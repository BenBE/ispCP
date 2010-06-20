<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @version 	SVN: $Id$
 * @link 		http://isp-control.net
 * @author 		ispCP Team
 *
 * @license
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * The Original Code is "ispCP - ISP Control Panel".
 *
 * The Initial Developer of the Original Code is ispCP Team.
 * Portions created by Initial Developer are Copyright (C) 2006-2010 by
 * isp Control Panel. All Rights Reserved.
 */

/**
 * ispCP paginator adapter Db_Table
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Paginator_Adapter_Db_Table
		implements ispcp_Paginator_Adapter_Interface
{
	/**
	 * Database table object for queries
	 * @var ispcp_Db_Table
	 */
	protected $_dbtable = null;
	/**
	 * Fields for main database query
	 * @var string
	 */
	protected $_fields = '';
	/**
	 * Where part for main database query
	 * @var mixed
	 */
	protected $_wherepart;
	/**
	 * Additional data for main database query
	 * @var array
	 */
	protected $_additional = array();
	/**
	 * Field for count query
	 * @var string
	 */
	protected $_countField = '';
	/**
	 * Where part for count query
	 * @var mixed
	 */
	protected $_countWhere;
	/**
	 * Additional part for count query
	 * @var array
	 */
	protected $_countAdditional = array();
	/**
	 * Internal flag, if queries were executed
	 * @var boolean
	 */
	protected $_executed = false;
	/**
	 * Number of items
	 * @var integer
	 */
	protected $_count = 0;
	/**
	 * Items
	 * @var array
	 */
	protected $_items = array();
	/**
	 * Offset of the query
	 * @var integer
	 */
	protected $_limitOffset = 0;
	/**
	 * Limit results per page
	 * @var integer
	 */
	protected $_limitCount = 10;

	/**
	 * Initialize Db_Table adapter
	 * @param ispcp_Db_Table $dbtable
	 * @param string $fields
	 * @param mixed $wherepart
	 * @param array $additional
	 */
	public function __construct($dbtable, $fields, $wherepart, $additional=array())
	{
		$this->_dbtable = $dbtable;
		$this->_fields = $fields;
		$this->_wherepart = $wherepart;
		$this->_additional = $additional;
		$this->_countField = 'COUNT(*) AS paginator_pagecount';
		$this->_countWhere = $wherepart;
		if (isset($additional['order_by'])) {
			unset($additional['order_by']);
		}
		$this->_countAdditional = $additional;
	}

	/**
	 * Set special query parameters for the count select
	 * @param string $sqlcountfield must contain "paginator_pagecount"
	 * @param mixed $wherepart
	 * @param array $additional
	 */
	public function setCountQuery($sqlcountfield, $wherepart, $additional=array())
	{
		$this->_countField = $sqlcountfield;
		$this->_countWhere = $wherepart;
		$this->_countAdditional = $additional;
	}

	/**
	 * Execute paginator queries
	 */
	protected function _execute()
	{
		$this->_count = (int)$this->_dbtable->selectField(
			$this->_countField,
			$this->_countWhere,
			$this->_countAdditional
		);

		if ($this->_count > 0) {
			$additional = $this->_additional;
			$additional['limit'] = $this->_limitOffset.', '.$this->_limitCount;

			$this->_items = $this->_dbtable->selectRecords(
				$this->_fields,
				$this->_wherepart,
				$additional
			);
			$this->prepareItems();
		} else {
			$this->_items = array();
		}

		$this->_executed = true;
	}

	public function prepareItems()
	{
		// ...
	}

	public function setRange($offset, $itemCountPerPage)
	{
		$this->_limitCount = $itemCountPerPage;
		$this->_limitOffset = $offset;
	}
	
	public function getCount()
	{
		if (!$this->_executed) {
			$this->_execute();
		}

		return $this->_items;
	}

	public function getItems()
	{
		if (!$this->_executed) {
			$this->_execute();
		}

		return $this->_items;
	}
}

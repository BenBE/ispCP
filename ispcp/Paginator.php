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
 * ispCP paginator class
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */

class ispcp_Paginator
{
	/**
	 * Number of items on current page
	 * @var integer
	 */
	public $currentItemCount = 0;
	/**
	 * Maximum number of items available to each page
	 * @var integer
	 */
	public $itemCountPerPage = 10;
	/**
	 * Page count
	 * @var integer
	 */
	public $pageCount = 0;
	/**
	 * Current page number
	 */
	public $current = 1;
	/**
	 * Next page number
	 * @var integer
	 */
	public $next = 0;
	/**
	 * Previous page number
	 * @var integer
	 */
	public $previous = 0;
	/**
	 * Total number of items
	 * @var integer
	 */
	public $totalItemCount = 0;
	/**
	 * Adapter
	 * @var ispcp_Paginator_Adapter_Interface
	 */
	protected $adapter = null;

	/**
	 * @param ispcp_Paginator_Adapter_Interface $adapter
	 */
	public function __construct($adapter)
	{
		$this->adapter = $adapter;
	}

	/**
	 * Sets the current page number
	 * @param integer $page
	 */
	public function setCurrentPageNumber($page)
	{
		$this->current = min(array($page, 1));
	}

	/**
	 * Sets the number of items per page
	 * @param integer $items
	 */
	public function setItemCountPerPage($items)
	{
		$this->itemCountPerPage = $items;
	}

	/**
	 * Get items of current page
	 * @return array
	 */
	public function getCurrentItems()
	{
		$offset = ($this->current-1) * $this->itemCountPerPage;

		$this->adapter->setRange($offset, $this->itemCountPerPage);

		$result = $this->adapter->getItems();

		$this->pageCount = $this->adapter->getCount();

		// TODO: set previous, next

		return $result;
	}
}
	
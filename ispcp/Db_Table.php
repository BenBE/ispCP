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
 * ispCP Db_Table (for the M from MVC)
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
abstract class ispcp_Db_Table
{
	/**
	 * @var string
	 */
	public abstract $tablename = '';
	/**
	 * @var string
	 */
	public abstract $pk = '';
	/**
	 * @var Database
	 */
	protected $db = null;
	/**
	 * @var string
	 */
	protected $_query = '';
	/**
	 * @var string
	 */
	protected $_where = '';
    /**
     * @var string
     */
    protected $_orderBy = '';
	/**
	 * @var string
	 */
	protected $_limit = '';
	/**
	 * @var string
	 */
	protected $_addfrom = '';
    /**
     * @var array
     */
    protected $_leftJoin = array();
	/**
	 * @var array
	 */
	protected $_paramValues = array();

	/**
	 * ispcp_Db_Table constructor
	 */
	public function __construct()
	{
		$this->db = Database::getInstance();
	}

	/**
	 * Perform SELECT query, where statement with primary key $pkvalue,
	 * return all fields
	 * @param string $fields
	 * @param mixed $pkvalue
	 * @return array
	 */
	public function selectRecordPk($fields, $pkvalue)
	{
		$this->_initializeQuery('SELECT '.$fields.' FROM `'.$this->tablename.'`');
		$this->_setWherePart(
			array(
				$this->pk	=> $pkvalue
			)
		);

		$statement = $this->db->Prepare($this->_query.$this->_addfrom.$this->_where);
		$result = $this->db->Execute($statement, array($pkvalue));

		return $result->getFields();
	}

    /**
     * Perform SELECT query, return all fields
     * @param string $fields
     * @param mixed $pkvalue
     * @return array
     */
    public function selectRecord($fields, $whereparams)
    {
        $this->_initializeQuery('SELECT '.$fields.' FROM `'.$this->tablename.'`');
        $this->_setWherePart($whereparams);

        $statement = $this->db->Prepare($this->_query.$this->_addfrom.$this->_where);
        $result = $this->db->Execute($statement, $this->_paramValues);

        return $result->getFields();
    }

	/**
	 * Perform SELECT query, Return all records
	 * @param string $fields
	 * @param array $whereparams
     * @param array $additional
	 * @return array
	 */
	public function selectRecords($fields, $whereparams, $additional=array())
	{
		$this->_initializeQuery('SELECT '.$fields.' FROM `'.$this->tablename.'`');
		$this->_setWherePart($whereparams);
        $this->_setAdditionalPart($additional);

		$statement = $this->db->Prepare($this->_query.$this->_addfrom.$this->_where.$this->_orderBy.$this->_limit);
		$rs = $this->db->Execute($statement, $this->_paramValues);
		
		return $rs->getRecords();
	}

	/**
	 * Perform SELECT query, where statement with primary key $pkvalue,
	 * return one field
	 * @param string $field
	 * @param mixed $pkvalue
	 * @return string
	 */
	public function selectFieldPk($field, $pkvalue)
	{
		$this->_initializeQuery('SELECT '.$field.' FROM `'.$this->tablename.'`');
		$this->_setWherePart(
			array(
				$this->pk	=> $pkvalue
			)
		);

		$statement = $this->db->Prepare($this->_query.$this->_addfrom.$this->_where);
		$result = $this->db->Execute($statement, $this->_paramValues);
		
		return $result->fields($field);
	}

    /**
     * Perform SELECT query for one field
     * @param string $field
     * @param mixed $pkvalue
     * @return string
     */
	public function selectField($field, $whereparams)
	{
		$this->_initializeQuery('SELECT '.$field.' FROM `'.$this->tablename.'`');
		$this->_setWherePart($whereparams);

		$statement = $this->db->Prepare($this->_query.$this->_addfrom.$this->_where);
		$result = $this->db->Execute($statement, $this->_paramValues);

		return $result->fields($field);
	}

	/**
	 * Execute insert statement
	 * @param array $fields
	 * @return integer last insert ID
	 */
	public function insert(array $fields)
	{
		$this->_initializeQuery('INSERT INTO `'.$this->tablename.'` FIELDS (');
		$this->_setInsertParamValues($fields);

		$statement = $this->db->Prepare($this->_query);
		$this->db->Execute($statement, $this->_paramValues);

		return $this->db->Insert_ID();
	}

	/**
	 * @param array $fields
	 * @param mixed $whereparam
	 * @return void
	 */
	public function update(array $fields, $whereparams)
	{
		$this->_initializeQuery('UPDATE `'.$this->tablename.'` SET ');
		$this->_setUpdateParamValues($fields);

		if ($whereparams !== null) {
			$this->_setWherePart($whereparams);
		}

		$statement = $this->db->Prepare($this->_query.$this->_where);
		$this->db->Execute($statement, $this->_paramValues);
	}

	public function deleteRecords($whereparams)
	{
		$this->_initializeQuery('DELETE FROM `'.$this->tablename.'` ');
		$this->_setWherePart($whereparams);
		$statement = $this->db->Prepare($this->_query.$this->_where);
		return $this->db->Execute($statement, $this->_paramValues);
	}

	protected function _initializeQuery($basequery)
	{
		$this->_query = $basequery;
		$this->_paramValues = array();
        $this->_orderBy = '';
        $this->_leftJoin = array();
		$this->_limit = '';
		$this->_addfrom = '';
	}

	protected function _setInsertParamValues(array $fields)
	{
		$first = true;
		foreach ($fields as $fieldname => $value) {
			if (!$first) {
				$this->_query .= ',';
			} else {
				$first = false;
			}
			$this->_query .= '`'.$fieldname.'`';
			$this->_paramValues[] = $value;
			$tmp[] = '?';
		}
		$this->_query .= ') VALUES (';
		$this->_query .= implode(',', $tmp);
		$this->_query .= ')';
	}

	protected function _setUpdateParamValues(array $fields)
	{
		$first = true;
		foreach ($fields as $fieldname => $value) {
			if (!$first) {
				$this->_query .= ',';
			} else {
				$first = false;
			}
			$this->_query .= '`'.$fieldname.'`= ?';
			$this->_paramValues[] = $value;
		}		
	}

	/**
	 * @param mixed $whereparams
	 * @return string
	 */
	protected function _setWherePart($whereparams)
	{
		$this->_where = ' WHERE ';
		
		if (is_array($whereparams)) {
			$first = true;
			foreach ($whereparams as $fieldname => $value) {
				if (!$first) {
					$this->_where .= ' AND ';
				} else {
					$first = false;
				}
				$this->_where .= '`'.$fieldname.'` ';
				if (is_array($value)) {
					if (count($value) > 2 && $value[2] == 'raw') {
						$this->_where .= $value[0].' '.$value[1];
					} else {
						$this->_where .= $value[0].' ?';
						$this->_paramValues[] = $value[1];
					}
				} else {
					$this->_where .= '= ?';
					$this->_paramValues[] = $value;
				}
			}
		} else {
			$this->_where .= $whereparams;
		}
	}

    /**
     * Set additional parameters
     * @param array $add
     * @return void
     */
    protected function _setAdditionalPart($add)
    {
        foreach ($add as $key => $value) {
            $key = strtolower($key);
            if ($key == 'order_by') {
                $this->_orderBy = ' ORDER BY '.$value;
            } elseif ($key == 'limit') {
				$this->_limit = ' LIMIT '.$value;
			} elseif ($key == 'addfrom') {
				$this->_addfrom = $value;
			}
        }
    }
}

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
 * ispCP domain class. Common methods for administration of domain related data
 *
 * @copyright 	2006-2010 by ispCP | http://isp-control.net
 * @author 		Thomas Wacker <thomas.wacker@ispcp.net>
 */
class ispcp_Domain
{
	private static $instance = null;
	protected $_db_domain;

	private function __construct() {}
	private function __clone() {}

	public static function getInstance()
	{
       if (self::$instance === null) {
           self::$instance = new self;
           self::$instance->initialize();
       }
       return self::$instance;
   	}

	private function initialize()
	{
		$this->_db_domain = Db_Table_domain::getInstance();
	}

	public function getDomainDefaultProps($domain_admin_id)
	{
		$fields = "
				`domain_id`,
				`domain_name`,
				`domain_gid`,
				`domain_uid`,
				`domain_created_id`,
				`domain_created`,
				`domain_expires`,
				`domain_last_modified`,
				`domain_mailacc_limit`,
				`domain_ftpacc_limit`,
				`domain_traffic_limit`,
				`domain_sqld_limit`,
				`domain_sqlu_limit`,
				`domain_status`,
				`domain_alias_limit`,
				`domain_subd_limit`,
				`domain_ip_id`,
				`domain_disk_limit`,
				`domain_disk_usage`,
				`domain_php`,
				`domain_cgi`,
				`allowbackup`,
				`domain_dns`
		";

		$rs = $this->_db_domain->selectRecordPk($fields, $domain_admin_id);

		return $rs->getFields();
	}

	public function getDomainRunningDmnFtpAccCnt($domain_id)
	{
		$ftp_separator = Config::get('FTP_USERNAME_SEPARATOR');

		$dmn_name = $this->_db_domain->selectFieldPk('domain_name', $domain_id);

		$db_ftp_users = Db_Table_ftp_users::getInstance();

		return $db_ftp_users->selectField(
			'COUNT(*) AS cnt',
			array(
				'userid' => array('LIKE', '%'.$ftp_separator.$dmn_name)
			)
		);
	}

	public function getDomainRunningSubFtpAccCnt($domain_id)
	{
		$sub_ftp_acc_cnt = 0;

		$ftp_separator = Config::get('FTP_USERNAME_SEPARATOR');

		$domain_name = $this->_db_domain->selectFieldPk('domain_name', $domain_id);

		$db_ftp_users = Db_Table_ftp_users::getInstance();
		$db = Db_Table_subdomain::getInstance();

		$rs = $db->selectRecords(
			'subdomain_name',
			array(
				'domain_id' => $domain_id
			)
		);

		foreach ($rs as $rec) {
			$sub_ftp_acc_cnt += $db_ftp_users->selectField(
				'COUNT(*) AS cnt',
				array(
					'userid'=>array('%' . $ftp_separator . $rec['subdomain_name'] . '.' . $domain_name)
				)
			);
		}

		return $sub_ftp_acc_cnt;
	}

	public function getDomainRunningAlsFtpAccCnt($domain_id)
	{
		$als_ftp_acc_cnt = 0;

		$ftp_separator = Config::get('FTP_USERNAME_SEPARATOR');

		$db_ftp_users = Db_Table_ftp_users::getInstance();
		$db = Db_Table_domain_aliasses::getInstance();

		$rs = $db->selectRecords(
			'alias_name',
			array(
				'domain_id' => $domain_id
			)
		);

		foreach ($rs as $rec) {
			$als_ftp_acc_cnt += $db_ftp_users->selectField(
				'COUNT(*) AS cnt',
				array(
					'userid'=>array('%' . $ftp_separator . $rec['alias_name'])
				)
			);
		}

		return $als_ftp_acc_cnt;
	}

	public function getDomainRunningFtpAccCnt($domain_id)
	{
		$dmn_ftp_acc_cnt = $this->getDomainRunningDmnFtpAccCnt($domain_id);
		$sub_ftp_acc_cnt = $this->getDomainRunningSubFtpAccCnt($domain_id);
		$als_ftp_acc_cnt = $this->getDomainRunningAlsFtpAccCnt($domain_id);

		return array(
			'total'  	=> $dmn_ftp_acc_cnt + $sub_ftp_acc_cnt + $als_ftp_acc_cnt,
			'domain' 	=> $dmn_ftp_acc_cnt,
			'subdomain' => $sub_ftp_acc_cnt,
			'alias' 	=> $als_ftp_acc_cnt
		);
	}

	public function getAliasMountPoint($alias_name)
	{
		$db = Db_Table_domain_aliasses::getInstance();

		return $db->selectField(
			'alias_mount',
			array(
				'alias_name' => $alias_name
			)
		);
	}

	/**
	 * @param string $input
	 * @return mixed
	 */
	public function decodeIdna($input)
	{
		if (function_exists('idn_to_unicode')) {
			return idn_to_unicode($input, 'utf-8');
		}

		$IDN = new idna_convert();
		$output = $IDN->decode($input);

		return ($output == false) ? $input : $output;
	}
}

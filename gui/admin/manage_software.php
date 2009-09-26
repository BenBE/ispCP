<?php
/**
 * ispCP ω (OMEGA) a Virtual Hosting Control System
 *
 * @copyright 	2001-2006 by moleSoftware GmbH
 * @copyright 	2006-2007 by ispCP | http://isp-control.net
 * @link 		http://isp-control.net
 * @author 		ispCP Team (2007)
 *
 * @license
 *   This program is free software; you can redistribute it and/or modify it under
 *   the terms of the MPL General Public License as published by the Free Software
 *   Foundation; either version 1.1 of the License, or (at your option) any later
 *   version.
 *   You should have received a copy of the MPL Mozilla Public License along with
 *   this program; if not, write to the Open Source Initiative (OSI)
 *   http://opensource.org | osi@opensource.org
 */

require '../include/ispcp-lib.php';

check_login(__FILE__);

$tpl = new pTemplate();
$tpl->define_dynamic('page', Config::get('ADMIN_TEMPLATE_PATH') . '/manage_software.tpl');
$tpl->define_dynamic('page_message', 'page');
$tpl->define_dynamic('logged_from', 'page');
$tpl->define_dynamic('list_software', 'page');
$tpl->define_dynamic('no_software_list', 'page');
$tpl->define_dynamic('list_softwaredepot', 'page');
$tpl->define_dynamic('no_softwaredepot_list', 'page');
$tpl->define_dynamic('no_reseller_list', 'page');
$tpl->define_dynamic('list_reseller', 'page');

// form data

function formatFilesize($byte) {
	$string = "Byte";
	if($byte>1024) {
		$byte/=1024;
		$string="KB";
	}
	if($byte>1024) {
		$byte/=1024;
		$string="MB";
	}
	if($byte>1024) {
		$byte/=1024;
		$string="GB";
	}
	if(number_format($byte,0)!=$byte) $byte=number_format($byte,2);
	return $byte." ".$string;
}

if (isset($_POST['Button'])) {
	$success = 1;
	if ($_FILES['sw_file']['name'] != '' AND !empty($_POST['sw_wget'])) {
		set_page_message(tr('You have to choose between file-upload and wget-function.'));
		$success = 0;
	} elseif ($_FILES['sw_file']['name'] == '' AND empty($_POST['sw_wget'])) {
		set_page_message(tr('You must select a file to upload/download.'));
		$success = 0;
	} else {
		if ($_FILES['sw_file']['name'] && $_FILES['sw_file']['name'] != "none") {
			if (substr($_FILES['sw_file']['name'], -7) != '.tar.gz') {
				set_page_message(tr('File needs to be a .tar.gz-archive'));
				$success = 0;
			}
			$file = 0;
		} else {
			if (substr($_POST['sw_wget'], -7) != '.tar.gz') {
				set_page_message(tr('File needs to be a .tar.gz-archive'));
				$success = 0;
			}
			$file = 1;
		}
	}
	if ($success == 1) {
		$user_id = $_SESSION['user_id'];
		$upload = 1;
		if($file == 0) {
			$fname = $_FILES['sw_file']['name'];
		} elseif($file == 1) {
			$fname = substr($_POST['sw_wget'], (strrpos($_POST['sw_wget'], '/')+1));
		}
		$filename = substr($fname, 0, -7);
		$extension = substr($fname, -7);
			$query=<<<SQL_QUERY
				INSERT INTO
					`web_software`
				(
					`reseller_id`, `software_name`, `software_version`, `software_type`, `software_db`, `software_archive`, 
					`software_prefix`, `software_link`, `software_desc`, `software_active`, `software_status`, `software_depot`
				) VALUES (
					?, ?, ?, ?, ?, ?,
					?, ?, ?, ?, ?, ?
				)
SQL_QUERY;
		$rs = exec_query($sql, $query, array($user_id, "waiting_for_input", "waiting_for_input", "waiting_for_input", "0", $filename, "waiting_for_input", "waiting_for_input", "waiting_for_input", "1", "toadd", "yes"));
		$sw_id = $sql->Insert_ID();
		if ($file == 0) {
			$dest_dir = Config::get('GUI_SOFTWARE_DIR').'/sw_depot/'.$filename.'-'.$sw_id.$extension;
			if (!is_dir(Config::get('GUI_SOFTWARE_DEPOT_DIR'))) {
				@mkdir(Config::get('GUI_SOFTWARE_DEPOT_DIR'),0755,true);
			}
			if (!move_uploaded_file($_FILES['sw_file']['tmp_name'], $dest_dir)) {
				// Delete software entry
				$query = "DELETE FROM `web_software` WHERE `software_id` = ?";
				exec_query($sql, $query, array($sw_id));
				$sw_wget = "";
				set_page_message(tr('ERROR: Could not upload file. Max. upload filesize ('.ini_get('upload_max_filesize').'B) reached?'));
				$upload = 0;
			}
		}
		if ($file == 1) {
			$sw_wget = $_POST['sw_wget'];
			$dest_dir = Config::get('GUI_SOFTWARE_DEPOT_DIR').'/'.$filename.'-'.$sw_id.$extension; 
			//Filegröße auslesen
   			$parts = parse_url($sw_wget);
   			$connection = fsockopen($parts['host'],80,$errno,$errstr,30);
   			if($connection) {
   				fputs($connection,"GET ".$sw_wget." HTTP/1.1\r\nHost: ".$parts['host']."\r\n\r\n");
   				$size = 0;
   				while(!isset($length) || ($size <= 500 && !feof($connection))) {
   					$tstr = fgets($connection,128);
   					$size += strlen($tstr);
   					if(substr($tstr,0,14) == 'Content-Length') {
   						$length = substr($tstr,15);
   					}
   				}
   				if($length) {
					$remote_file_size = $length;
				} else {
					$remote_file_size = 0;
				}
				$show_remote_file_size = formatFilesize($remote_file_size);
				if($remote_file_size < 1){
					// Delete software entry
					$query = "DELETE FROM `web_software` WHERE `software_id` = ?";
					exec_query($sql, $query, array($sw_id));
					$show_max_remote_filesize = formatFilesize(Config::get('MAX_REMOTE_FILESIZE'));
					set_page_message(tr('ERROR: Your remote filesize ('.$show_remote_file_size.') is lower than 1 Byte. Please check your URL!'));
					$upload = 0;
				} elseif($remote_file_size > Config::get('MAX_REMOTE_FILESIZE')) {
					// Delete software entry
					$query = "DELETE FROM `web_software` WHERE `software_id` = ?";
					exec_query($sql, $query, array($sw_id));
					$show_max_remote_filesize = formatFilesize(Config::get('MAX_REMOTE_FILESIZE'));
					set_page_message(tr('ERROR: Max. remote filesize ('.$show_max_remote_filesize.') is reached. Your remote file ist '.$show_remote_file_size.''));
					$upload = 0;
				} else {
					$remote_file = @file_get_contents($sw_wget);
					if($remote_file) {
						$output_file = fopen($dest_dir,'w+');
						fwrite($output_file,$remote_file);
						fclose($output_file);
					} else {
						// Delete software entry
						$query = "DELETE FROM `web_software` WHERE `software_id` = ?";
						exec_query($sql, $query, array($sw_id));
						set_page_message(tr('ERROR: Remote File not found!'));
						$upload = 0;
					}
				}
   			}else{
				// Delete software entry
				$query = "DELETE FROM `web_software` WHERE `software_id` = ?";
				exec_query($sql, $query, array($sw_id));
				set_page_message(tr('ERROR: Could not upload file. File not found!'));
				$upload = 0;
			}
		}
		if ($upload == 1) {
			$tpl->assign(
					array(
						'VAL_WGET' => ''
					)
				);
			send_request();
			set_page_message(tr('File was successfully uploaded.'));	
		} else {
			$tpl->assign(
					array(
						'VAL_WGET' => $sw_wget
					)
				);
		}
	} else {
		$tpl->assign(
				array(
					'VAL_WGET' => $_POST['sw_wget']
				)
			);

	}
} else {
	$tpl->assign(
			array(
				'VAL_WGET' => ''
			)
		);
}

// Begin function block
function get_avail_software (&$tpl, &$sql) {
	$query=<<<SQL_QUERY
		SELECT
			a.`software_id` as id,
			a.`software_name` as name,
			a.`software_version` as version,
			a.`software_type` as type,
			a.`software_desc` as description,
			a.`reseller_id`,
			b.`admin_id`,
			b.`admin_name` as reseller
		FROM
			`web_software` a,
			`admin` b
		WHERE
			a.`software_active` = 0
		AND
			a.`reseller_id` = b.`admin_id`
		AND
			a.software_depot = 'no'
		ORDER BY
			a.`reseller_id` ASC,
			a.`software_type` ASC,
			a.`software_name` ASC
SQL_QUERY;
	$rs = exec_query($sql, $query, array());
	if ($rs->RecordCount() > 0) {
		while(!$rs->EOF) {
			$act_url = "activate_software.php?id=".$rs->fields['id'];
			$del_url = "delete_software.php?id=".$rs->fields['id'];
			$dow_url = "download_software.php?id=".$rs->fields['id'];
			$tpl->assign(
					array(
						'TR_NAME' => $rs->fields['name'],
						'TR_TOOLTIP' => wordwrap($rs->fields['description'],60,"<br />"),
						'TR_VERSION' => $rs->fields['version'],
						'TR_TYPE' => $rs->fields['type'],
						'TR_RESELLER' => $rs->fields['reseller'],
						'DOWNLOAD_LINK' => $dow_url,
						'TR_DOWNLOAD' => tr('Download'),
						'ACTIVATE_LINK' => $act_url,
						'TR_ACTIVATION' => tr('Activate'),
						'DELETE_LINK' => $del_url,
						'TR_DELETE' => tr('Delete'),
						)
					);
			$tpl->parse('LIST_SOFTWARE', '.list_software');
			$rs->MoveNext();
		}
		$tpl->assign('NO_SOFTWARE_LIST', '');
	} else {
		$tpl->assign(
				array(
					'NO_SOFTWARE' => tr('No software is waiting for activation')
					)
				);
		$tpl->parse('NO_SOFTWARE_LIST', '.no_software_list');
		$tpl->assign('LIST_SOFTWARE', '');
	}
	return $rs->RecordCount();
}

function get_avail_softwaredepot (&$tpl, &$sql) {
	$query=<<<SQL_QUERY
		SELECT
			a.`software_id` as id,
			a.`software_name` as name,
			a.`software_version` as version,
			a.`software_type` as type,
			a.`software_desc` as description,
			a.`reseller_id`,
			a.`software_archive` as filename,
			a.`software_status` as swstatus,
			b.`admin_id`,
			b.`admin_name` as admin
		FROM
			`web_software` a,
			`admin` b
		WHERE
			a.`software_depot` = 'yes'
		AND
			a.`software_master_id` = 0
		AND
			a.`reseller_id` = b.`admin_id`
		ORDER BY
			a.`reseller_id` ASC,
			a.`software_type` ASC,
			a.`software_name` ASC
SQL_QUERY;
	$rs = exec_query($sql, $query, array());
	if ($rs->RecordCount() > 0) {
		while(!$rs->EOF) {
			if($rs->fields['swstatus'] == "ok" || $rs->fields['swstatus'] == "ready") {
				if($rs->fields['swstatus'] == "ready") {
					$updatequery = "UPDATE `web_software` set software_status = 'ok' WHERE `software_id` = ?";
					exec_query($sql, $updatequery, array($rs->fields['id']));
					set_page_message(tr('Packet installed successfuly!'));
				}
				$del_url = "delete_software.php?id=".$rs->fields['id'];
				$dow_url = "download_software.php?id=".$rs->fields['id'];
				$rights_url = "software_rights.php?id=".$rs->fields['id'];
				$tpl->assign(
						array(
							'TR_NAME' => $rs->fields['name'],
							'LINK_COLOR' => '#000000',
							'TR_TOOLTIP' => wordwrap($rs->fields['description'],60,"<br />"),
							'TR_VERSION' => $rs->fields['version'],
							'TR_TYPE' => $rs->fields['type'],
							'TR_ADMIN' => $rs->fields['admin'],
							'DOWNLOAD_LINK' => $dow_url,
							'TR_DOWNLOAD' => tr('Download'),
							'DELETE_LINK' => $del_url,
							'TR_DELETE' => tr('Delete'),
							'SOFTWARE_ICON' => 'edit',
							'SOFTWARE_RIGHTS_LINK' => $rights_url,
							'RIGHTS_LINK' => tr('Rights'),
							'TR_SOFTWARE_RIGHTS' => tr('Softwarerights'),
							)
						);
			} else {
				if($rs->fields['swstatus'] == "toadd") {
					$tpl->assign(
							array(
								'TR_NAME' => tr('Installing your uploaded packet. Please refresh this site.'),
								'LINK_COLOR' => '#FF0000',
								'TR_VERSION' => '',
								'TR_TOOLTIP' => tr('After your upload the packet will be installed on your systems.<br />Refresh your site to see the new status!'),
								'TR_DOWNLOAD' => '',
								'DOWNLOAD_LINK' => '',
								'DELETE_LINK' => '',
								'TR_DELETE' => '',
								'TR_TYPE' => '<font color="#FF0000">'.tr('installing').'</font>',
								'TR_ADMIN' => $rs->fields['admin'],
								'SOFTWARE_ICON' => 'disabled',
								'RIGHTS_LINK' => '',
								'TR_SOFTWARE_RIGHTS' => '',
								'SOFTWARE_RIGHTS_LINK' => ''
							)
						);
					} else {
						$tpl->assign(
								array(
									'TR_NAME' => tr('Failure in softwarepacket. Deleting!'),
									'LINK_COLOR' => '#FF0000',
									'TR_VERSION' => '',
									'TR_TOOLTIP' => tr('Check your softwarepacket. There is an error inside!<br />Refresh your site to see the new status!'),
									'TR_DOWNLOAD' => '',
									'DOWNLOAD_LINK' => '',
									'DELETE_LINK' => '',
									'TR_DELETE' => '',
									'TR_TYPE' => '<font color="#FF0000">'.tr('deleting').'</font>',
									'TR_ADMIN' => $rs->fields['admin'],
									'SOFTWARE_ICON' => 'delete',
									'RIGHTS_LINK' => '',
									'TR_SOFTWARE_RIGHTS' => '',
									'SOFTWARE_RIGHTS_LINK' => ''
								)
							);
						$del_path = Config::get('GUI_SOFTWARE_DEPOT_DIR')."/".$rs->fields['filename']."-".$rs->fields['id'].".tar.gz";
						@unlink($del_path);
						$delete="DELETE FROM `web_software` WHERE `software_id` = ?";
						$res = exec_query($sql, $delete, array($rs->fields['id']));
						set_page_message(tr('Your softwarepacket is corrupt. Please correct it!'));
					}
			}
			$tpl->parse('LIST_SOFTWAREDEPOT', '.list_softwaredepot');
			$rs->MoveNext();
		}
		$tpl->assign('NO_SOFTWAREDEPOT_LIST', '');
	} else {
		$tpl->assign(
				array(
					'NO_SOFTWAREDEPOT' => tr('No software in softwaredepot available!')
					)
				);
		$tpl->parse('NO_SOFTWAREDEPOT_LIST', '.no_softwaredepot_list');
		$tpl->assign('LIST_SOFTWAREDEPOT', '');
	}
	return $rs->RecordCount();
}

function get_reseller_software (&$tpl, &$sql) {
	$query=<<<SQL_QUERY
		SELECT
			t1.`admin_id` as reseller_id,
			t1.`admin_name` as reseller
		FROM
			`admin` t1
		LEFT JOIN
				`reseller_props` AS t2 ON t2.reseller_id = t1.`admin_id`
		WHERE
			t1.`admin_type` = 'reseller'
		AND
			t2.`software_allowed` = 'yes' 
		ORDER BY
			t1.`admin_id` ASC
SQL_QUERY;
	$rs = exec_query($sql, $query, array());
	if ($rs->RecordCount() > 0) {
		while(!$rs->EOF) {
			$query="SELECT `software_id` FROM `web_software` WHERE `reseller_id` = ?";
			$rssoftware = exec_query($sql, $query, array($rs->fields['reseller_id']));
			$software_ids = array();
			while ($data = $rssoftware->FetchRow()) {
				$software_ids[] = $data['software_id'];
			}
			$query="SELECT count(`software_id`) as swdepot FROM `web_software` WHERE `software_active` = 1 AND software_depot = 'yes' AND `reseller_id` = ?";
			$rscountswdepot = exec_query($sql, $query, array($rs->fields['reseller_id']));
			$query="SELECT count(`software_id`) as waiting FROM `web_software` WHERE `software_active` = 0 AND `reseller_id` = ?";
			$rscountwaiting = exec_query($sql, $query, array($rs->fields['reseller_id']));
			$query="SELECT count(`software_id`) as activated FROM `web_software` WHERE `software_active` = 1 AND `reseller_id` = ?";
			$rscountactivated = exec_query($sql, $query, array($rs->fields['reseller_id']));
			if(count($software_ids) > 0){
				$query="SELECT count(`domain_id`) as in_use FROM `web_software_inst` WHERE `software_id` IN (".implode(',', $software_ids ).") AND `software_status` = 'ok'";
				$rscountin_use = exec_query($sql, $query, array());
				$sw_in_use = $rscountin_use->fields['in_use'];
			}else{
				$sw_in_use = 0;
			}
			$tpl->assign(
					array(
						'RESELLER_NAME' => $rs->fields['reseller'],
						'RESELLER_ID' => $rs->fields['reseller_id'],
						'RESELLER_COUNT_SWDEPOT' => $rscountswdepot->fields['swdepot'],
						'RESELLER_COUNT_WAITING' => $rscountwaiting->fields['waiting'],
						'RESELLER_COUNT_ACTIVATED' => $rscountactivated->fields['activated'],
						'RESELLER_SOFTWARE_IN_USE' => $sw_in_use
						)
					);
			$tpl->parse('LIST_RESELLER', '.list_reseller');
			$rs->MoveNext();
		}
		$tpl->assign('NO_RESELLER_LIST', '');
	} else {
		$tpl->assign(
				array(
					'NO_RESELLER' => tr('No reseller with activated software installer found!')
					)
				);
		$tpl->parse('NO_RESELLER_LIST', '.no_reseller_list');
		$tpl->assign('LIST_RESELLER', '');
	}
	return $rs->RecordCount();
}

$theme_color = Config::get('USER_INITIAL_THEME');

$tpl->assign(
		array(
			'TR_MANAGE_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software Management'),
			'THEME_COLOR_PATH' => '../themes/'.$theme_color,
			'THEME_CHARSET' => tr('encoding'),
			'ISP_LOGO' => get_logo($_SESSION['user_id'])
			)
	);

$sw_cnt = get_avail_software (&$tpl, &$sql);
$swdepot_cnt = get_avail_softwaredepot (&$tpl, &$sql);
$res_cnt = get_reseller_software (&$tpl, &$sql);

$tpl->assign(
		array(
			'TR_SOFTWARE_DEPOT' => tr('Softwaredepot'),
			'TR_SOFTWARE_ADMIN' => tr('Admin'),
			'TR_SOFTWARE_RIGHTS' => tr('Softwarerights'),
			'TR_SOFTWAREDEPOT_COUNT' => tr('Softwaredepot total'),
			'TR_SOFTWAREDEPOT_NUM' => $swdepot_cnt,
			'TR_UPLOAD_SOFTWARE' => tr('Softwaredepot upload'),
			'TR_SOFTWARE_FILE' => tr('Choose file (Max: '.ini_get('upload_max_filesize').'B)'),
			'TR_SOFTWARE_URL' => tr('or remote file (Max: '.formatFilesize(Config::get('MAX_REMOTE_FILESIZE')).')'),
			'TR_UPLOAD_SOFTWARE_BUTTON' => tr('Upload now'),
			'TR_AWAITING_ACTIVATION' => tr('Awaiting Activation'),
			'TR_ACTIVATED_SOFTWARE' => tr('Reseller software list'),
			'TR_SOFTWARE_NAME' => tr('Application'),
			'TR_SOFTWARE_VERSION' => tr('App-Version'),
			'TR_SOFTWARE_TYPE' => tr('Type'),
			'TR_SOFTWARE_RESELLER' => tr('Reseller'),
			'TR_SOFTWARE_DOWNLOAD' => tr('Download'),
			'TR_SOFTWARE_ACTIVATION' => tr('Activate'),
			'TR_SOFTWARE_DELETE' => tr('Delete'),
			'TR_SOFTWARE_ACT_COUNT' => tr('Software total'),
			'TR_SOFTWARE_ACT_NUM' => $sw_cnt,
			'TR_RESELLER_NAME' => tr('Reseller'),
			'TR_RESELLER_ACT_COUNT' => tr('Reseller total'),
			'TR_RESELLER_ACT_NUM' => $res_cnt,
			'TR_RESELLER_COUNT_SWDEPOT' => tr('Softwaredepot'),
			'TR_RESELLER_COUNT_WAITING' => tr('Waiting for activation'),
			'TR_RESELLER_COUNT_ACTIVATED' => tr('Activated software'),
			'TR_RESELLER_SOFTWARE_IN_USE' => tr('Total installations'),
			'TR_MESSAGE_ACTIVATE' => tr('Are you sure you want to activate this package?', true),
			'TR_MESSAGE_DELETE' => tr('Are you sure you want to delete this package?', true),
			'TR_ADMIN_SOFTWARE_PAGE_TITLE' => tr('ispCP - Software management'),
			)
	);

gen_admin_mainmenu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/main_menu_users_manage.tpl');
gen_admin_menu($tpl, Config::get('ADMIN_TEMPLATE_PATH') . '/menu_users_manage.tpl');

gen_logged_from($tpl);

gen_page_message($tpl);

$tpl->parse('PAGE', 'page');

$tpl->prnt();

if (Config::get('DUMP_GUI_DEBUG')) {
	dump_gui_debug();
}

unset_messages();
?>

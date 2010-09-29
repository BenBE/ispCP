<?php
require '../include/ispcp-lib.php';

check_login(__FILE__);

$cfg = ispCP_Registry::get('Config');

if (isset($_GET['id']) AND is_numeric($_GET['id'])) {
	$query="
		SELECT
			`software_id`,
			`reseller_id`,
			`software_archive`,
			`software_depot`
		FROM
			`web_software`
		WHERE
			`software_id` = ?
		";
	$rs = exec_query($sql, $query, $_GET['id']);
	if($rs->fields['software_depot'] == "yes") {
		$filename = $cfg->GUI_SOFTWARE_DEPOT_DIR."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
	}else{
		$filename = $cfg->GUI_SOFTWARE_DIR."/".$rs->fields['reseller_id']."/".$rs->fields['software_archive']."-".$rs->fields['software_id'].".tar.gz";
	}
	if (file_exists($filename)) {
		header("Cache-Control: public, must-revalidate");
		header("Pragma: hack");
		header("Content-Type: application/octet-stream");
		header("Content-Length: " .(string)(filesize($filename)) );
		header('Content-Disposition: attachment; filename="'.$rs->fields['software_archive'].'.tar.gz"');
		header("Content-Transfer-Encoding: binary\n");

		$fp = fopen($filename, 'rb');
		$buffer = fread($fp, filesize($filename));
		fclose ($fp);
		print $buffer;
	} else {
		set_page_message(tr('File does not exist.'.$rs->fields['software_archive'].'.tar.gz'));
		header('Location: software_manage.php');
	}
} else {
	set_page_message(tr('Wrong software id.'));
	header('Location: software_manage.php');
}
?>
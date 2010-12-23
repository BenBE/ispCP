<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_EDIT_DOMAIN_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_EDIT_DOMAIN_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ui.core.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ui.datepicker.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Datepicker - begin		
			$('#dmn_exp_never').change(function() {
				if ($(this).is(':checked')) {
					$('#dmn_exp_date').attr('disabled', 'disabled');
				} else {
					$('#dmn_exp_date').removeAttr('disabled');
				}
			});
			// Datepicker - end

			// jQuery UI Datepicker
			$('#dmn_exp_date').datepicker({
				dateFormat: '{VL_DATE_FORMAT}',
				dayNamesMin: ['{TR_SU}', '{TR_MO}', '{TR_TU}', '{TR_WE}', '{TR_TH}', '{TR_FR}', '{TR_SA}'],
				monthNames: ['{TR_JANUARY}', '{TR_FEBRUARY}', '{TR_MARCH}', '{TR_APRIL}', '{TR_MAY}', '{TR_JUNE}', '{TR_JULY}', '{TR_AUGUST}', '{TR_SEPTEMBER}', '{TR_OCTOBER}', '{TR_NOVEMBER}', '{TR_DECEMBER}'],
				isRTL: false,
				showOtherMonths: true,
				defaultDate: '+1y',
				minDate: new Date()
			});
		});
	/* ]]> */
	</script>
</head>
<body>
	<div class="header">
		{MAIN_MENU}
		<div class="logo">
			<img src="{THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_EDIT_DOMAIN}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="domains"><span>{TR_EDIT_DOMAIN}</span></h2>
		<form action="domain_edit.php" method="post" id="reseller_domain_edit">
			<table>
				<tr>
					<td>{TR_DOMAIN_NAME}</td>
					<td>{VL_DOMAIN_NAME}</td>
				</tr>
				<tr>
					<td>{TR_DOMAIN_EXPIRE}</td>
					<td>
						<input type="text" name="dmn_expire_date" id="dmn_exp_date" value="{VL_DOMAIN_EXPIRE}" {VL_EXPIRE_DATE_DISABLED} />
						&nbsp;{TR_EXPIRE_CHECKBOX} <input type="checkbox" name="dmn_expire_never" id="dmn_exp_never" {VL_EXPIRE_NEVER_SELECTED} />
					</td>
				</tr>
				<tr>
					<td>{TR_DOMAIN_IP}</td>
					<td>{VL_DOMAIN_IP}</td>
						<!--
				<select name="domain_ip">

                      <option value="{IP_VALUE}" {IP_SELECTED}>{IP_NUM}&nbsp;({IP_NAME})</option>

                    </select>
				-->
				</tr>
				<tr>
					<td>{TR_PHP_SUPP}</td>
					<td><select name="domain_php" id="domain_php">
							<option value="_yes_" {PHP_YES}>{TR_YES}</option>
							<option value="_no_" {PHP_NO}>{TR_NO}</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>{TR_CGI_SUPP}</td>
					<td><select name="domain_cgi" id="domain_cgi">
							<option value="_yes_" {CGI_YES}>{TR_YES}</option>
							<option value="_no_" {CGI_NO}>{TR_NO}</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>{TR_DNS_SUPP}</td>
					<td><select name="domain_dns" id="domain_dns">
							<option value="_yes_" {DNS_YES}>{TR_YES}</option>
							<option value="_no_" {DNS_NO}>{TR_NO}</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>{TR_BACKUP}</td>
					<td><select name="backup" id="backup">
							<option value="_dmn_" {BACKUP_DOMAIN}>{TR_BACKUP_DOMAIN}</option>
							<option value="_sql_" {BACKUP_SQL}>{TR_BACKUP_SQL}</option>
							<option value="_full_" {BACKUP_FULL}>{TR_BACKUP_FULL}</option>
							<option value="_no_" {BACKUP_NO}>{TR_BACKUP_NO}</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>{TR_SUBDOMAINS}</td>
					<td><input type="text" name="dom_sub" id="dom_sub" value="{VL_DOM_SUB}"/></td>
				</tr>
				<tr>
					<td>{TR_ALIAS}</td>
					<td><input type="text" name="dom_alias" id="dom_alias" value="{VL_DOM_ALIAS}"/></td>
				</tr>
				<tr>
					<td>{TR_MAIL_ACCOUNT}</td>
					<td><input type="text" name="dom_mail_acCount" id="dom_mail_acCount" value="{VL_DOM_MAIL_ACCOUNT}"/></td>
				</tr>
				<tr>
					<td>{TR_FTP_ACCOUNTS}</td>
					<td><input type="text" name="dom_ftp_acCounts" id="dom_ftp_acCounts" value="{VL_FTP_ACCOUNTS}"/></td>
				</tr>
				<tr>
					<td>{TR_SQL_DB}</td>
					<td><input type="text" name="dom_sqldb" id="dom_sqldb" value="{VL_SQL_DB}"/></td>
				</tr>
				<tr>
					<td>{TR_SQL_USERS}</td>
					<td><input type="text" name="dom_sql_users" id="dom_sql_users" value="{VL_SQL_USERS}"/></td>
				</tr>
				<tr>
					<td>{TR_TRAFFIC}</td>
					<td><input type="text" name="dom_traffic" id="dom_traffic" value="{VL_TRAFFIC}"/></td>
				</tr>
				<tr>
					<td>{TR_DISK}</td>
					<td><input type="text" name="dom_disk" id="dom_disk" value="{VL_DOM_DISK}"/></td>
				</tr>
				<tr>
					<td>{TR_USER_NAME}</td>
					<td>{VL_USER_NAME}</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="sub_data" />
				<input type="submit" name="Submit" value="{TR_UPDATE_DATA}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
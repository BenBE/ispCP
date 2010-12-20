<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_RESELLER_MAIN_INDEX_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_RESELLER_MAIN_INDEX_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.ui.tooltip.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ispcpTooltips.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Tooltips - begin
			$('#hp_tos_help').ispCPtooltips({msg:"{TR_TOS_NOTE}"});
			// Tooltips - end
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
			<h1 class="hosting_plans">{TR_MENU_HOSTING_PLANS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="hosting_plan.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_EDIT_HOSTING_PLAN}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="doc"><span>{TR_EDIT_HOSTING_PLAN}</span></h2>
		<form action="hosting_plan_edit.php" method="post" id="admin_hosting_plan_edit">
			<table>
				<tr>
					<td>{TR_TEMPLATE_NAME}</td>
					<td><input type="text" name="hp_name" id="hp_name" value="{HP_NAME_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_TEMPLATE_DESCRIPTON}</td>
					<td><textarea name="hp_description" id="hp_description" cols="40" rows="8">{HP_DESCRIPTION_VALUE}</textarea></td>
				</tr>
				<tr>
					<td>{TR_MAX_SUBDOMAINS}</td>
					<td><input type="text" name="hp_sub" id="hp_sub" value="{TR_MAX_SUB_LIMITS}" /></td>
				</tr>
				<tr>
					<td>{TR_MAX_ALIASES}</td>
					<td><input type="text" name="hp_als" id="hp_als" value="{TR_MAX_ALS_VALUES}" /></td>
				</tr>
				<tr>
					<td>{TR_MAX_MAILACCOUNTS}</td>
					<td><input type="text" name="hp_mail" id="hp_mail" value="{HP_MAIL_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_MAX_FTP}</td>
					<td><input type="text" name="hp_ftp" id="hp_ftp" value="{HP_FTP_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_MAX_SQL}</td>
					<td><input type="text" name="hp_sql_db" id="hp_sql_db" value="{HP_SQL_DB_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_MAX_SQL_USERS}</td>
					<td><input type="text" name="hp_sql_user" id="hp_sql_user" value="{HP_SQL_USER_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_MAX_TRAFFIC}</td>
					<td><input type="text" name="hp_traff" id="hp_traff" value="{HP_TRAFF_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_DISK_LIMIT}</td>
					<td><input type="text" name="hp_disk" id="hp_disk" value="{HP_DISK_VALUE}" /></td>
				</tr>
				<tr>
					<td>{TR_PHP}</td>
					<td>
						<input type="radio" name="php" id="php_yes" value="_yes_" {TR_PHP_YES} />&nbsp;{TR_YES}
						<input type="radio" name="php" id="php_no" value="_no_" {TR_PHP_NO} />&nbsp;{TR_NO}
					</td>
				</tr>
				<tr>
					<td>{TR_CGI}</td>
					<td>
						<input type="radio" name="cgi" id="cgi_yes" value="_yes_" {TR_CGI_YES} />&nbsp;{TR_YES}
						<input type="radio" name="cgi" id="cgi_no" value="_no_" {TR_CGI_NO} />&nbsp;{TR_NO}
					</td>
				</tr>
				<tr>
					<td>{TR_DNS}</td>
					<td>
						<input type="radio" name="dns" id="dns_yes" value="_yes_" {TR_DNS_YES} />&nbsp;{TR_YES}
						<input type="radio" name="dns" id="dns_no" value="_no_" {TR_DNS_NO} />&nbsp;{TR_NO}
					</td>
				</tr>
				<tr>
					<td>{TR_BACKUP}</td>
					<td>
						<input type="radio" name="backup" id="backup_dmn" value="_dmn_" {VL_BACKUPD} />&nbsp;{TR_BACKUP_DOMAIN}
						<input type="radio" name="backup" id="backup_sql" value="_sql_" {VL_BACKUPS} />&nbsp;{TR_BACKUP_SQL}
						<input type="radio" name="backup" id="backup_full" value="_full_" {VL_BACKUPF} />&nbsp;{TR_BACKUP_FULL}
						<input type="radio" name="backup" id="backup_none" value="_no_" {VL_BACKUPN} />&nbsp;{TR_BACKUP_NO}
					</td>
				</tr>
			</table>
			<div>&nbsp;</div>
			<fieldset>
				<legend>{TR_BILLING_PROPS}</legend>
				<table>
					<tr>
						<td>{TR_PRICE}</td>
						<td><input type="text" name="hp_price" id="hp_price" value="{HP_PRICE}" /></td>
					</tr>
					<tr>
						<td>{TR_SETUP_FEE}</td>
						<td><input type="text" name="hp_setupfee" id="hp_setupfee" value="{HP_SETUPFEE}" /></td>
					</tr>
					<tr>
						<td>{TR_VALUE}</td>
						<td><input type="text" name="hp_value" id="hp_value" value="{HP_VALUE}" /> <span class="legend">{TR_EXAMPLE}</span></td>
					</tr>
					<tr>
						<td>{TR_PAYMENT}</td>
						<td><input type="text" name="hp_payment" id="hp_payment" value="{HP_PAYMENT}" /></td>
					</tr>
					<tr>
						<td>{TR_STATUS}</td>
						<td>
							<input type="radio" name="status" id="status_yes" value="1" {TR_STATUS_YES} />&nbsp;{TR_YES}
							<input type="radio" name="status" id="status_no" value="0" {TR_STATUS_NO} />&nbsp;{TR_NO}
						</td>
					</tr>
				</table>
			</fieldset>
			<!-- TOS -->
			<fieldset>
				<legend>{TR_TOS_PROPS} <span id="hp_tos_help" class="icon i_help">&nbsp;</span></legend>
				<table>
					<tr>
						<td>{TR_TOS_DESCRIPTION}</td>
						<td><textarea name="hp_tos" id="hp_tos" cols="70" rows="8">{HP_TOS_VALUE}</textarea></td>
					</tr>
					
				</table>
			</fieldset>
			<!-- TOS END -->
			<div class="buttons">
				<input type="hidden" name="uaction" value="edit_plan" />
				<input type="submit" name="Submit" value="{TR_EDIT_HOSTING_PLAN}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->

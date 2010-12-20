<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
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
			<li><a>{TR_DELETE_DOMAIN}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="domains"><span>{TR_DELETE_DOMAIN} - {DOMAIN_NAME}</span></h2>
		<fieldset>
		<legend>{TR_DOMAIN_SUMMARY}</legend>
			<!-- BDP: mail_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_EMAILS}</th>
				</tr>
				<!-- BDP: mail_item -->
				<tr>
					<td style="width: 350px;">{MAIL_ADDR}</td>
					<td>{MAIL_TYPE}</td>
				</tr>
				<!-- EDP: mail_item -->
			</table>
			<!-- EDP: mail_list -->
			<!-- BDP: ftp_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_FTPS}</th>
				</tr>
				<!-- BDP: ftp_item -->
				<tr>
					<td style="width: 350px;">{FTP_USER}</td>
					<td>{FTP_HOME}</td>
				</tr>
				<!-- EDP: ftp_item -->
			</table>
			<!-- EDP: ftp_list -->
			<!-- BDP: als_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_ALIASES}</th>
				</tr>
				<!-- BDP: als_item -->
				<tr>
					<td style="width: 350px;">{ALS_NAME}</td>
					<td>{ALS_MNT}</td>
				</tr>
				<!-- EDP: als_item -->
			</table>
			<!-- EDP: als_list -->
			<!-- BDP: sub_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_SUBS}</th>
				</tr>
				<!-- BDP: sub_item -->
				<tr>
					<td style="width: 350px;">{SUB_NAME}</td>
					<td>{SUB_MNT}</td>
				</tr>
				<!-- EDP: sub_item -->
			</table>
			<!-- EDP: sub_list -->
			<!-- BDP: db_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_DBS}</th>
				</tr>
				<!-- BDP: db_item -->
				<tr>
					<td style="width: 350px;">{DB_NAME}</td>
					<td>{DB_USERS}</td>
				</tr>
				<!-- EDP: db_item -->
			</table>
			<!-- EDP: db_list -->
			<form action="domain_delete.php" method="post" id="reseller_delete_domain">
				<div class="buttons">
					<input type="hidden" name="domain_id" value="{DOMAIN_ID}" />
					<div>{TR_REALLY_WANT_TO_DELETE_DOMAIN}</div><br />
					<input type="checkbox" name="delete" id="delete" value="1" /> <label for="delete">{TR_YES_DELETE_DOMAIN}</label><br />
					<br />
					<input type="submit" name="Submit" value="{TR_BUTTON_DELETE}" />
				</div>
			</form>
		</fieldset>
	</div>
<!-- INCLUDE "footer.tpl" -->
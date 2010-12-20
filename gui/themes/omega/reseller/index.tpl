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
			<h1 class="general">{GENERAL_INFO}</h1>
		</div>
		<ul class="location-menu">
			
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a>{TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: msg_entry -->
		<div class="{NEW_MSG_TYPE}">{TR_NEW_MSGS}</div>
		<!-- EDP: msg_entry -->
		<h2 class="general"><span>{GENERAL_INFO}</span></h2>
		<!-- BDP: props_list -->
		<table>
			<tr>
				<td>{ACCOUNT_NAME}</td>
				<td>{RESELLER_NAME}</td>
			</tr>
			<tr>
				<td>{DOMAINS}</td>
				<td>{DMN_MSG}</td>
			</tr>
			<tr>
				<td>{SUBDOMAINS}</td>
				<td>{SUB_MSG}</td>
			</tr>
			<tr>
				<td>{ALIASES}</td>
				<td>{ALS_MSG}</td>
			</tr>
			<tr>
				<td>{MAIL_ACCOUNTS}</td>
				<td>{MAIL_MSG}</td>
			</tr>
			<tr>
				<td>{TR_FTP_ACCOUNTS}</td>
				<td>{FTP_MSG}</td>
			</tr>
			<tr>
				<td>{SQL_DATABASES}</td>
				<td>{SQL_DB_MSG}</td>
			</tr>
			<tr>
				<td>{MAIL_ACCOUNTS}</td>
				<td>{MAIL_MSG}</td>
			</tr>
			<tr>
				<td>{TR_FTP_ACCOUNTS}</td>
				<td>{FTP_MSG}</td>
			</tr>
			<tr>
				<td>{SQL_DATABASES}</td>
				<td>{SQL_DB_MSG}</td>
			</tr>
			<tr>
				<td>{SQL_USERS}</td>
				<td>{SQL_USER_MSG}</td>
			</tr>
			<tr>
				<td>{TRAFFIC}</td>
				<td>{TRAFF_MSG}</td>
			</tr>
			<tr>
				<td>{DISK}</td>
				<td>{DISK_MSG}</td>
			</tr>
		</table>
		<!-- BDP: traff_warn -->
		<div class="warning">{TR_TRAFFIC_WARNING}</div>
		<!-- EDP: traff_warn -->
		<h2 class="traffic"><span>{TR_TRAFFIC_USAGE}</span></h2>
		{TRAFFIC_USAGE_DATA}
		<div class="graph"><span style="width:{TRAFFIC_PERCENT}%">&nbsp;</span></div>
		<!-- BDP: traff_warn -->
		<div class="warning">{TR_DISK_WARNING}</div>
		<!-- EDP: traff_warn -->
		<h2 class="diskusage"><span>{TR_DISK_USAGE}</span></h2>
		{DISK_USAGE_DATA}
		<div class="graph"><span style="width:{DISK_PERCENT}%">&nbsp;</span></div>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
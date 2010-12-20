<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_MAIN_INDEX_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_MAIN_INDEX_PAGE_TITLE}' />
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
			<h1 class="general">{TR_MENU_GENERAL_INFORMATION}</h1>
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
		<h2 class="general"><span>{TR_GENERAL_INFORMATION}</span></h2>
		<table>
			<tr>
				<td>{TR_ACCOUNT_NAME} / {TR_MAIN_DOMAIN}</td>
				<td>{ACCOUNT_NAME} / {DOMAIN_IP}</td>
			</tr>
			<tr>
				<td>{TR_DMN_TMP_ACCESS}</td>
				<td><a href="{DOMAIN_ALS_URL}">{DOMAIN_ALS_URL}</a></td>
			</tr>
			<tr>
				<td>{TR_DOMAIN_EXPIRE}</td>
				<td>{DMN_EXPIRES} {DMN_EXPIRES_DATE}</td>
			</tr>
			<!-- BDP: t_php_support -->
			<tr>
				<td>{TR_PHP_SUPPORT}</td>
				<td>{PHP_SUPPORT}</td>
			</tr>
			<!-- EDP: t_php_support -->
			<!-- BDP: t_cgi_support -->
			<tr>
				<td>{TR_CGI_SUPPORT}</td>
				<td>{CGI_SUPPORT}</td>
			</tr>
			<!-- EDP: t_cgi_support -->
			<!-- BDP: t_sql1_support -->
			<tr>
				<td>{TR_MYSQL_SUPPORT}</td>
				<td>{MYSQL_SUPPORT}</td>
			</tr>
			<!--EDP: t_sql1_support -->
			<!-- BDP: t_sdm_support -->
			<tr>
				<td>{TR_SUBDOMAINS}</td>
				<td>{SUBDOMAINS}</td>
			</tr>
			<!--EDP: t_sdm_support -->
			<!-- BDP: t_alias_support -->
			<tr>
				<td>{TR_DOMAIN_ALIASES}</td>
				<td>{DOMAIN_ALIASES}</td>
			</tr>
			<!--EDP: t_alias_support -->
			<!-- BDP: t_mails_support -->
			<tr>
				<td>{TR_MAIL_ACCOUNTS}</td>
				<td>{MAIL_ACCOUNTS}</td>
			</tr>
			<!--EDP: t_mails_support -->
			<tr>
				<td>{TR_FTP_ACCOUNTS}</td>
				<td>{FTP_ACCOUNTS}</td>
			</tr>
			<!-- BDP: t_sdm_support -->
			<tr>
				<td>{TR_SQL_DATABASES}</td>
				<td>{SQL_DATABASES}</td>
			</tr>
			<tr>
				<td>{TR_SQL_USERS}</td>
				<td>{SQL_USERS}</td>
			</tr>
			<!--EDP: t_sdm_support -->
		</table>
		<h2 class="traffic"><span>{TR_TRAFFIC_USAGE}</span></h2>
		<!-- BDP: traff_warn -->
		<div class="warning">{TR_TRAFFIC_WARNING}</div>
		<!-- EDP: traff_warn -->
		{TRAFFIC_USAGE_DATA}
		<div class="graph"><span style="width:{TRAFFIC_PERCENT}%">&nbsp;</span></div>
		<h2 class="diskusage"><span>{TR_DISK_USAGE}</span></h2>
		<!-- BDP: disk_warn -->
		<div class="warning">{TR_DISK_WARNING}</div>
		<!-- EDP: disk_warn -->
		{DISK_USAGE_DATA}
		<div class="graph"><span style="width:{DISK_PERCENT}%">&nbsp;</span></div>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
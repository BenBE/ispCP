<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_ISPCP_DEBUGGER_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_ISPCP_DEBUGGER_PAGE_TITLE}' />
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
			<h1 class="webtools">{TR_MENU_SYSTEM_TOOLS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="system_info.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_DEBUGGER_TITLE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="debugger"><span>{TR_DEBUGGER_TITLE}</span></h2>
		<!-- BDP: props_list -->
		<table>
			<tr>
				<td><b>{TR_DOMAIN_ERRORS}</b></td>
			</tr>
			<!-- BDP: domain_message -->
			<tr>
				<td>{TR_DOMAIN_MESSAGE}</td>
			</tr>
			<!-- EDP: domain_message -->
			<!-- BDP: domain_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{TR_DOMAIN_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="link">{TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{TR_DOMAIN_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: domain_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{TR_ALIAS_ERRORS}</b></td>
			</tr>
			<!-- BDP: alias_message -->
			<tr>
				<td>{TR_ALIAS_MESSAGE}</td>
			</tr>
			<!-- EDP: alias_message -->
			<!-- BDP: alias_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{TR_ALIAS_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="link">{TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{TR_ALIAS_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: alias_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{TR_SUBDOMAIN_ERRORS}</b></td>
			</tr>
			<!-- BDP: subdomain_message -->
			<tr>
				<td>{TR_SUBDOMAIN_MESSAGE}</td>
			</tr>
			<!-- EDP: subdomain_message -->
			<!-- BDP: subdomain_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{TR_SUBDOMAIN_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="link">{TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{TR_SUBDOMAIN_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: subdomain_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{TR_SUBDOMAIN_ALIAS_ERRORS}</b></td>
			</tr>
			<!-- BDP: subdomain_alias_message -->
			<tr>
				<td>{TR_SUBDOMAIN_ALIAS_MESSAGE}</td>
			</tr>
			<!-- EDP: subdomain_alias_message -->
			<!-- BDP: subdomain_alias_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{TR_SUBDOMAIN_ALIAS_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="link">{TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{TR_SUBDOMAIN_ALIAS_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: subdomain_alias_list -->
		</table>
		<br />
		<table>
			<tr>
				<td class="content3"><b>{TR_MAIL_ERRORS}</b></td>
			</tr>
			<!-- BDP: mail_message -->
			<tr>
				<td>{TR_MAIL_MESSAGE}</td>
			</tr>
			<!-- EDP: mail_message -->
			<!-- BDP: mail_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{TR_MAIL_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="link">{TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{TR_MAIL_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: mail_list -->
		</table>
		<br />
		<table>
			<tr>
				<td class="content3"><b>{TR_HTACCESS_ERRORS}</b></td>
			</tr>
			<!-- BDP: htaccess_message -->
			<tr>
				<td>{TR_HTACCESS_MESSAGE}</td>
			</tr>
			<!-- EDP: htaccess_message -->
			<!-- BDP: htaccess_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{TR_HTACCESS_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="link">{TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{TR_HTACCESS_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: htaccess_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{TR_DAEMON_TOOLS}</b></td>
			</tr>
			<tr>
				<td><a href="ispcp_debugger.php?action=run_engine" class="link">{EXEC_COUNT} {TR_EXEC_REQUESTS}</a></td>
			</tr>
			<tr>
				<td>{TR_ERRORS}</td>
			</tr>
		</table>
		<!-- EDP: props_list -->
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
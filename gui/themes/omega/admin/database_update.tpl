<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_ISPCP_UPDATES_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_ISPCP_UPDATES_PAGE_TITLE}' />
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
			<li><a>{TR_UPDATES_TITLE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: database_update_message -->
		<div class="notice">{TR_UPDATE_MESSAGE}</div>
		<!-- EDP: database_update_message -->
		<!-- BDP: props_list -->
		<!-- BDP: database_update_infos -->
		<h2 class="update"><span>{TR_UPDATES_TITLE}</span></h2>
		<form action="database_update.php" method="post" id="database_update">
			<table class="description">
				<tr>
					<th>{TR_UPDATE}</th>
					<td>{UPDATE}</td>
				</tr>
				<tr>
					<th>{TR_INFOS}</th>
					<td>{INFOS}</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="execute" id='execute' value="update" />
				<input type="submit" name="Submit" value="{TR_EXECUTE_UPDATE}" />
			</div>
		</form>
		<!-- EDP: database_update_infos -->
		<!-- EDP: props_list -->
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
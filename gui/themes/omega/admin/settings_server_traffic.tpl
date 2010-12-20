<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_CHANGE_SERVER_TRAFFIC_SETTINGS_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_CHANGE_SERVER_TRAFFIC_SETTINGS_TITLE}' />
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
			<h1 class="settings">{TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_SERVER_TRAFFIC_SETTINGS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="general"><span>{TR_SERVER_TRAFFIC_SETTINGS}</span></h2>
		<form action="settings_server_traffic.php" method="post" id="admin_modify_server_traffic_settings">
			<fieldset>
				<legend>{TR_SET_SERVER_TRAFFIC_SETTINGS}</legend>
				<table>
					<tr>
						<td><label for="max_traffic">{TR_MAX_TRAFFIC}</label></td>
						<td><input type="text" name="max_traffic" id="max_traffic" value="{MAX_TRAFFIC}" /></td>
					</tr>
					<tr>
						<td><label for="traffic_warning">{TR_WARNING}</label></td>
						<td><input type="text" name="traffic_warning" id="traffic_warning" value="{TRAFFIC_WARNING}" /></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="modify" />
				<input type="submit" name="Submit"  value="{TR_MODIFY}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_RESELLER_LAYOUT_DATA_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_RESELLER_LAYOUT_DATA_PAGE_TITLE}' />
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
			<li><a href="settings.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_LAYOUT_SETTINGS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="multilanguage"><span>{TR_LAYOUT_SETTINGS}</span></h2>
		<form action="settings_layout.php" method="post" enctype="multipart/form-data" id="set_layout">
			<fieldset>
				<legend>{TR_UPLOAD_LOGO}</legend>
				<table>
					<tr>
                        <td>{TR_LOGO_FILE}</td>
						<td><input type="file" name="logo_file" size="40" /></td>
					</tr>
				</table>
				<input type="hidden" name="uaction" value="upload_logo" />
				<input name="Submit" type="submit" class="button" value=" {TR_UPLOAD} " />
			</fieldset>
		</form>
		<!-- BDP: logo_remove_button -->
		<img src="{OWN_LOGO}" alt="reseller logo" />
		<form action="settings_layout.php" method="post">
			<fieldset>
				<input type="hidden" name="uaction" value="delete_logo" />
				<input name="Submit" type="submit" class="button" value=" Entfernen " />
			</fieldset>
		</form>
		<!-- EDP: logo_remove_button -->
	</div>
	<div class="footer">
			ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>

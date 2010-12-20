<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_I18N_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_I18N_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, language) {
			if (!confirm(sprintf("{TR_MESSAGE_DELETE}", language)))
				return false;
				location = url;
		}
		// Overrides exportation url to enable/disable gzip compression
		//
		// author Laurent Declercq <laurent.declercq@ispcp.net>
		// Since 1.0.6
		function override_export_url(ob) {
			regexp = new RegExp('[a-z_]*([0-9]+)');
			link = document.getElementById('url_export' + regexp.exec(ob.id)[1]);
			if(ob.checked) {
				link.href = link.href + '&compress=1';
			} else {
				link.href = link.href. substring(0, link.href.indexOf('&compress'));
			}
		}
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
			<h1 class="settings">{TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MULTILANGUAGE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="multilanguage"><span>{TR_MULTILANGUAGE}</span></h2>
		<form action="multilanguage.php" method="post" id="admin_multilanguage" enctype="multipart/form-data">
			<fieldset>
				<legend>{TR_INSTALLED_LANGUAGES}</legend>
				<table>
					<tr>
						<th>{TR_LANGUAGE}</th>
						<th>{TR_MESSAGES}</th>
						<th>{TR_LANG_REV}</th>
						<th>{TR_ACTION}</th>
					</tr>
					<!-- BDP: lang_row -->
					<tr>
						<td><span class="icon i_locale">{LANGUAGE}</span></td>
						<td>{MESSAGES}</td>
						<td>{LANGUAGE_REVISION}</td>
						<td>
							<a href="{URL_EXPORT}" id="url_export{INDEX}" title="{TR_EXPORT}" class="icon i_details"></a>
							<input type="checkbox" name="gz_export{INDEX}" id="gz_export{INDEX}" onclick="override_export_url(this)" /> <label for="gz_export{INDEX}">{TR_GZIPPED}</label>
							<!-- BDP: lang_delete_show -->
							<!-- EDP: lang_delete_show -->
							<!-- BDP: lang_delete_link -->
							<a href="#" onclick="action_delete('{URL_DELETE}', '{LANGUAGE}')" title="{TR_UNINSTALL}" class="icon i_delete"></a>
							<!-- EDP: lang_delete_link -->
						</td>
					</tr>
					<!-- EDP: lang_row -->
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_INSTALL_NEW_LANGUAGE}</legend>
				<table>
					<tr>
						<td>{TR_LANGUAGE_FILE}</td>
						<td><input type="file" name="lang_file" /></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="upload_language" />
				<input type="submit" name="Submit" value="{TR_INSTALL}" />
				
			</div>
		</form>
	</div>
	<div class="footer">
			ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_HTACCESS}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_HTACCESS}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function() {
			$('#protected_areas_add').click(function() {
				document.location.href = 'protected_areas_add.php';
			});
			$('#protected_user_manage').click(function() {
				document.location.href = 'protected_user_manage.php';
			});
		});

		function action_delete(url, subject) {
			return confirm(sprintf("{TR_MESSAGE_DELETE}", subject));
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
			<h1 class="webtools">{TR_MENU_WEBTOOLS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="webtools.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_HTACCESS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="htaccess"><span>{TR_HTACCESS}</span></h2>
		<!-- BDP: protected_areas -->
		<table>
			<tr>
				<th>{TR_HTACCESS}</th>
				<th>{TR_STATUS}</th>
				<th>{TR__ACTION}</th>
			</tr>
			<!-- BDP: dir_item -->
			<tr>
				<td>{AREA_NAME}<br /><em>{AREA_PATH}</em></td>
				<td>{STATUS}</td>
				<td>
					<a href="protected_areas_add.php?id={PID}" title="{TR_EDIT}" class="icon i_edit"></a>
					<a href="protected_areas_delete.php?id={PID}" onclick="return action_delete('protected_areas_delete.php?id={PID}', '{JS_AREA_NAME}')" title="{TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- EDP: dir_item -->
		</table>
		<!-- EDP: protected_areas -->
		<div class="buttons">
			<input type="button" name="protected_areas_add" id="protected_areas_add" value="{TR_ADD_AREA}" />
			<input type="button" name="protected_user_manage" id="protected_user_manage" value="{TR_MANAGE_USRES}" />
		</div>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
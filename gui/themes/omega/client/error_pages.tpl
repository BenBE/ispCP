<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_ERROR_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_ERROR_PAGE_TITLE}' />
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
			<li><a>{TR_MENU_ERROR_PAGES}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="errors"><span>{TR_ERROR_PAGES}</span></h2>
		<table>
			<tr>
				<td><span class="icon_big i_error401">{TR_ERROR_401}</span></td>
				<td><a href="error_edit.php?eid=401" title="{TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{DOMAIN}/errors/401.html" class="icon i_preview">{TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error403">{TR_ERROR_403}</span></td>
				<td><a href="error_edit.php?eid=403" title="{TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{DOMAIN}/errors/403.html" class="icon i_preview">{TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error404">{TR_ERROR_404}</span></td>
				<td><a href="error_edit.php?eid=404" title="{TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{DOMAIN}/errors/404.html" class="icon i_preview">{TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error500">{TR_ERROR_500}</span></td>
				<td><a href="error_edit.php?eid=500" title="{TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{DOMAIN}/errors/500.html" class="icon i_preview">{TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error503">{TR_ERROR_503}</span></td>
				<td><a href="error_edit.php?eid=503" title="{TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{DOMAIN}/errors/503.html" class="icon i_preview">{TR_VIEW}</a></td>
			</tr>
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
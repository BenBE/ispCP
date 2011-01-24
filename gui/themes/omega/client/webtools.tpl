<!-- INCLUDE "header.tpl" -->
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
			<li><a>{TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="webtools"><span>{TR_MENU_WEBTOOLS}</span></h2>
	   	<a href="protected_areas.php">{TR_HTACCESS}</a>
		<p>{TR_HTACCESS_TEXT}</p>
		<a href="protected_user_manage.php">{TR_HTACCESS_USER}</a>
		<p>{TR_HTACCESS_USER}</p>
		<a href="error_pages.php">{TR_ERROR_PAGES}</a>
		<p>{TR_ERROR_PAGES_TEXT}</p>
		<a href="backup.php">{TR_BACKUP}</a>
		<p>{TR_BACKUP_TEXT}</p>
		<!-- BDP: active_email -->
		<a href="{WEBMAIL_PATH}">{TR_WEBMAIL}</a>
		<p>{TR_WEBMAIL_TEXT}</p>
		<!-- EDP: active_email -->
		<a href="{FILEMANAGER_PATH}">{TR_FILEMANAGER}</a>
		<p>{TR_FILEMANAGER_TEXT}</p>
		<!-- BDP: active_awstats -->
		<a href="{AWSTATS_PATH}">{TR_AWSTATS}</a>
		<p>{TR_AWSTATS_TEXT}</p>
		<!-- EDP: active_awstats -->
	</div>
<!-- INCLUDE "footer.tpl" -->
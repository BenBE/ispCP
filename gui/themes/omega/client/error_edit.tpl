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
			<li><a href="webtools.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a href="error_pages.php">{TR_MENU_ERROR_PAGES}</a></li>
			<li><a>{TR_ERROR_EDIT_PAGE} {EID}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="errors"><span>{TR_ERROR_EDIT_PAGE} {EID}</span></h2>
		<form action="error_pages.php" method="post" name="client_error_pages">
			<fieldset>
				<textarea name="error" cols="120" rows="25" id="error">{ERROR}</textarea>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="eid" value="{EID}" />
				<input type="hidden" name="uaction" value="updt_error" />
				<input type="submit" name="Submit" value="{TR_SAVE}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
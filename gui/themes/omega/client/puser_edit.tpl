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
			<li><a href="protected_user_manage.php">{TR_HTACCESS_USER}</a></li>
			<li><a>{TR_UPDATE_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="users"><span>{TR_UPDATE_USER}</span></h2>
		<form action="protected_user_edit.php" method="post" id="client_protected_user_edit">
			<table>
				<tr>
					<td>{TR_USERNAME}</td>
					<td>{UNAME}</td>
				</tr>
				<tr>
					<td>{TR_PASSWORD}</td>
					<td><input type="password" id="pass" name="pass" value="" /></td>
				</tr>
				<tr>
					<td>{TR_PASSWORD_REPEAT}</td>
					<td><input type="password" id="pass_rep" name="pass_rep" value="" /></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="nadmin_name" value="{UID}" />
				<input type="hidden" name="uaction" value="modify_user" />
				<input type="submit" name="Submit" value="{TR_UPDATE}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
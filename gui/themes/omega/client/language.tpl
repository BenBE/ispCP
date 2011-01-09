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
			<h1 class="general">{TR_MENU_GENERAL_INFORMATION}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="index.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_CHOOSE_DEFAULT_LANGUAGE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="multilanguage"><span>{TR_CHOOSE_DEFAULT_LANGUAGE}</span></h2>
		<form action="language.php" method="post" id="reseller_language">
			<table>
				<tr>
					<td><label for="def_language">{TR_CHOOSE_DEFAULT_LANGUAGE}</label></td>
					<td>
						<select name="def_language" id="def_language">
							<!-- BDP: def_language -->
							<option value="{LANG_VALUE}" {LANG_SELECTED}>{LANG_NAME}</option>
							<!-- EDP: def_language -->
						</select>
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="save_lang" />
				<input type="submit" name="Submit" value="{TR_SAVE}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->

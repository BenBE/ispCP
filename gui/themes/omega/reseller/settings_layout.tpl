{include file='header.tpl'}
<body>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="general">{$TR_MENU_GENERAL_INFORMATION}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_LAYOUT_SETTINGS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="multilanguage"><span>{$TR_LAYOUT_SETTINGS}</span></h2>
		<form action="settings_layout.php" method="post" enctype="multipart/form-data" id="set_layout">
			<fieldset>
				<legend>{$TR_UPLOAD_LOGO}</legend>
				<table>
					<tr>
                        <td>{$TR_LOGO_FILE}</td>
						<td><input type="file" name="logo_file" size="40" /></td>
					</tr>
				</table>
				<input type="hidden" name="uaction" value="upload_logo" />
				<input name="Submit" type="submit" class="button" value=" {$TR_UPLOAD} " />
			</fieldset>
		</form>
		{if isset($LOGO_REMOVE_BUTTON)}
		<img src="{$OWN_LOGO}" alt="reseller logo" />
		<form action="settings_layout.php" method="post">
			<fieldset>
				<input type="hidden" name="uaction" value="delete_logo" />
				<input name="Submit" type="submit" class="button" value=" {$TR_REMOVE} " />
			</fieldset>
		</form>
		{/if}
	</div>
	<div class="footer">
			ispCP Omega {$VERSION}<br />build: {$BUILDDATE}<br />Codename: {$CODENAME}
	</div>
</body>
</html>

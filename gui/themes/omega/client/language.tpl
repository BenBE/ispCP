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
			<li><a href="index.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_CHOOSE_DEFAULT_LANGUAGE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="multilanguage"><span>{$TR_CHOOSE_DEFAULT_LANGUAGE}</span></h2>
		<form action="language.php" method="post" id="reseller_language">
			<table>
				<tr>
					<td><label for="def_language">{$TR_CHOOSE_DEFAULT_LANGUAGE}</label></td>
					<td>
						<select name="def_language" id="def_language">
							{section name=i loop=$LANG_NAME}
							<option value="{$LANG_VALUE[i]}" {$LANG_SELECTED[i]}>{$LANG_NAME[i]}</option>
							{/section}
						</select>
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="save_lang" />
				<input type="submit" name="Submit" value="{$TR_SAVE}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}

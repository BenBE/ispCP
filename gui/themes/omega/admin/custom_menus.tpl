{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, dmn_name) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", dmn_name)))
				return false;
				location = url;
		}
	/* ]]> */
	</script>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="settings">{$TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_TITLE_CUSTOM_MENUS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="general"><span>{$TR_TITLE_CUSTOM_MENUS}</span></h2>
		{if isset($CONTENT)}
		<table>
			<tr>
				<td><b>{$TR_MENU_NAME}</b></td>
				<td><b>{$TR_LEVEL}</b></td>
				<td><b>{$TR_ACTON}</b></td>
			</tr>
			{section name=i loop=$CONTENT}
			<tr>
				<td>
					<a href="{$LINK[i]}" class="link"><strong>{$MENU_NAME[i]}</strong></a><br />
					{$LINK[i]}
				</td>
				<td>{$LEVEL[i]}</td>
				<td>
					<a href="custom_menus.php?edit_id={$BUTONN_ID[i]}" title="{$TR_EDIT}" class="icon i_edit"></a>
					<a href="custom_menus.php?delete_id={$BUTONN_ID[i]}" onclick="return action_delete('custom_menus.php?delete_id={$BUTONN_ID[i]}', '{$MENU_NAME2[i]}')" title="{$TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			{/section}
		</table>
		{/if}
		<br />
		{if isset($ADD_BUTTON)}
		<form action="custom_menus.php" method="post" id="add_new_button_frm">
			<fieldset>
				<legend>{$TR_ADD_NEW_BUTTON}</legend>
				<table>
					<tr>
						<td><label for="bname">{$TR_BUTTON_NAME}</label></td>
						<td><input type="text" name="bname" id="bname" /></td>
					</tr>
					<tr>
						<td><label for="blink">{$TR_BUTTON_LINK}</label></td>
						<td><input type="text" name="blink" id="blink" /></td>
					</tr>
					<tr>
						<td><label for="btarget">{$TR_BUTTON_TARGET}</label></td>
						<td><input type="text" name="btarget" id="btarget" /></td>
					</tr>
					<tr>
						<td><label for="bview">{$TR_VIEW_FROM}</label></td>
						<td>
							<select name="bview" id="bview">
								<option value="admin">{$ADMIN}</option>
								<option value="reseller">{$RESELLER}</option>
								<option value="user">{$USER}</option>
								<option value="all">{$RESSELER_AND_USER}</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="uaction" value="new_button" />
				<input type="submit" name="Submit" value="  {$TR_SAVE}  " />
			</fieldset>
		</form>
		{/if}
		{if isset($EDIT_BUTTON)}
		<form action="custom_menus.php" method="post" id="edit_button_frm">
			<fieldset>
				<legend>{$TR_EDIT_BUTTON}</legend>
				<table>
					<tr>
						<td><label for="bname">{$TR_BUTTON_NAME}</label></td>
						<td><input type="text" name="bname" id="bname" value="{$BUTON_NAME}" /></td>
					</tr>
					<tr>
						<td><label for="blink">{$TR_BUTTON_LINK}</label></td>
						<td><input type="text" name="blink" id="blink" value="{$BUTON_LINK}" /></td>
					</tr>
					<tr>
						<td><label for="btarget">{$TR_BUTTON_TARGET}</label></td>
						<td><input type="text" name="btarget" id="btarget" value="{$BUTON_TARGET}" /></td>
					</tr>
					<tr>
						<td><label for="bview">{$TR_VIEW_FROM}</label></td>
						<td>
							<select name="bview" id="bview">
								<option value="admin">{$ADMIN}</option>
								<option value="reseller">{$RESELLER}</option>
								<option value="user">{$USER}</option>
								<option value="all">{$RESSELER_AND_USER}</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="eid" value="{$EID}" />
				<input type="hidden" name="uaction" value="edit_button" />
				<input type="submit" name="Submit" value="  {$TR_SAVE}  " />
			</fieldset>
		</form>
		{/if}
	</div>
{include file='footer.tpl'}
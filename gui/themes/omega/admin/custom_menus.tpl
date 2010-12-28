<!-- INCLUDE "header.tpl" -->
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, dmn_name) {
			if (!confirm(sprintf("{TR_MESSAGE_DELETE}", dmn_name)))
				return false;
				location = url;
		}
	/* ]]> */
	</script>
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
			<li><a>{TR_TITLE_CUSTOM_MENUS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="general"><span>{TR_TITLE_CUSTOM_MENUS}</span></h2>
		<table>
			<tr>
				<td><b>{TR_MENU_NAME}</b></td>
				<td><b>{TR_LEVEL}</b></td>
				<td><b>{TR_ACTON}</b></td>
			</tr>
			<!-- BDP: button_list -->
			<tr>
				<td>
					<a href="{LINK}" class="link"><strong>{MENU_NAME}</strong></a><br />
					{LINK}
				</td>
				<td>{LEVEL}</td>
				<td>
					<a href="custom_menus.php?edit_id={BUTONN_ID}" title="{TR_EDIT}" class="icon i_edit"></a>
					<a href="custom_menus.php?delete_id={BUTONN_ID}" onclick="return action_delete('custom_menus.php?delete_id={BUTONN_ID}', '{MENU_NAME2}')" title="{TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- EDP: button_list -->
		</table>
		<!-- BDP: add_button -->
		<form action="custom_menus.php" method="post" id="add_new_button_frm">
			<fieldset>
				<legend>{TR_ADD_NEW_BUTTON}</legend>
				<table>
					<tr>
						<td><label for="bname">{TR_BUTTON_NAME}</label></td>
						<td><input type="text" name="bname" id="bname" /></td>
					</tr>
					<tr>
						<td><label for="blink">{TR_BUTTON_LINK}</label></td>
						<td><input type="text" name="blink" id="blink" /></td>
					</tr>
					<tr>
						<td><label for="btarget">{TR_BUTTON_TARGET}</label></td>
						<td><input type="text" name="btarget" id="btarget" /></td>
					</tr>
					<tr>
						<td><label for="bview">{TR_VIEW_FROM}</label></td>
						<td>
							<select name="bview" id="bview">
								<option value="admin">{ADMIN}</option>
								<option value="reseller">{RESELLER}</option>
								<option value="user">{USER}</option>
								<option value="all">{RESSELER_AND_USER}</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="uaction" value="new_button" />
				<input type="submit" name="Submit" value="  {TR_SAVE}  " />
			</fieldset>
		</form>
		<!-- EDP: add_button -->
		<!-- BDP: edit_button -->
		<form action="custom_menus.php" method="post" id="edit_button_frm">
			<fieldset>
				<legend>{TR_EDIT_BUTTON}</legend>
				<table>
					<tr>
						<td><label for="bname">{TR_BUTTON_NAME}</label></td>
						<td><input type="text" name="bname" id="bname" value="{BUTON_NAME}" /></td>
					</tr>
					<tr>
						<td><label for="blink">{TR_BUTTON_LINK}</label></td>
						<td><input type="text" name="blink" id="blink" value="{BUTON_LINK}" /></td>
					</tr>
					<tr>
						<td><label for="btarget">{TR_BUTTON_TARGET}</label></td>
						<td><input type="text" name="btarget" id="btarget" value="{BUTON_TARGET}" /></td>
					</tr>
					<tr>
						<td><label for="bview">{TR_VIEW_FROM}</label></td>
						<td>
							<select name="bview" id="bview">
								<option value="admin">{ADMIN}</option>
								<option value="reseller">{RESELLER}</option>
								<option value="user">{USER}</option>
								<option value="all">{RESSELER_AND_USER}</option>
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="eid" value="{EID}" />
				<input type="hidden" name="uaction" value="edit_button" />
				<input type="submit" name="Submit" value="  {TR_SAVE}  " />
			</fieldset>
		</form>
		<!-- EDP: edit_button -->
	</div>
<!-- INCLUDE "footer.tpl" -->
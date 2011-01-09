<!-- INCLUDE "header.tpl" -->
<body onload="changeType('{DEFAULT}');">
	<script type="text/javascript">
	/* <![CDATA[ */
		function changeType(type) {
			if (type == "normal") {
				document.forms[0].mail_id.disabled = false;
				document.forms[0].forward_list.disabled = true;
			} else {
				document.forms[0].mail_id.disabled = true;
				document.forms[0].forward_list.disabled = false;
			}
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
			<h1 class="email">{TR_MENU_EMAIL_ACCOUNTS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="mail_accounts.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_CREATE_CATCHALL_MAIL_ACCOUNT}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_CREATE_CATCHALL_MAIL_ACCOUNT}</span></h2>
		<form action="mail_catchall_add.php" method="post" id="client_mail_catchall_add">
			<table>
				<tr>
					<td><input type="radio" name="mail_type" id="mail_type1" value="normal" onclick="changeType('normal');" {NORMAL_MAIL} />&nbsp;{TR_MAIL_LIST}</td>
					<td>
						<select name="mail_id">
							<!-- BDP: mail_list -->
							<option value="{MAIL_ID};{MAIL_ACCOUNT_PUNNY};">{MAIL_ACCOUNT}</option>
							<!-- EDP: mail_list -->
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="radio" name="mail_type" id="mail_type2" value="forward" onclick="changeType('forward');" {FORWARD_MAIL} />&nbsp;{TR_FORWARD_MAIL}</td>
				</tr>
				<tr>
					<td>{TR_FORWARD_TO}</td>
					<td><textarea name="forward_list" id="forward_list" cols="35" rows="5"></textarea></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="id" value="{ID}" />
				<input type="hidden" name="uaction" value="create_catchall" />
				<input type="submit" name="Submit" value="{TR_CREATE_CATCHALL}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
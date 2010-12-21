<!-- INCLUDE "header.tpl" -->
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
			<h1 class="settings">{TR_LOSTPW_EMAIL}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_LOSTPW_EMAIL}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_LOSTPW_EMAIL}</span></h2>
		<form action="settings_lostpassword.php" method="post" id="admin_settings_lostpassword">
			<fieldset>
				<legend>{TR_MESSAGE_TEMPLATE_INFO}</legend>
				<table>
					<tr>
						<td colspan="2"><b>{TR_ACTIVATION_EMAIL}</b></td>
						<td colspan="2"><b>{TR_PASSWORD_EMAIL}</b></td>
					</tr>
					<tr>
						<td><b>{TR_USER_LOGIN_NAME}</b></td>
						<td>{USERNAME}</td>
						<td><b>{TR_USER_LOGIN_NAME}</b></td>
						<td>{USERNAME}</td>
					</tr>
					<tr>
						<td><b>{TR_LOSTPW_LINK}</b></td>
						<td>{LINK}</td>
						<td><b>{TR_USER_PASSWORD}</b></td>
						<td>{PASSWORD}</td>
					</tr>
					<tr>
						<td><b>{TR_USER_REAL_NAME}</b></td>
						<td>{NAME}</td>
						<td><b>{TR_USER_REAL_NAME}</b></td>
						<td>{NAME}</td>
					</tr>
					<tr>
						<td><b>{TR_BASE_SERVER_VHOST}</b></td>
						<td>{BASE_SERVER_VHOST}</td>
						<td><b>{TR_BASE_SERVER_VHOST}</b></td>
						<td>{BASE_SERVER_VHOST}</td>
					</tr>
					<tr>
						<td><b>{TR_BASE_SERVER_VHOST_PREFIX}</b></td>
						<td>{BASE_SERVER_VHOST_PREFIX}</td>
						<td><b>{TR_BASE_SERVER_VHOST_PREFIX}</b></td>
						<td>{BASE_SERVER_VHOST_PREFIX}</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_MESSAGE_TEMPLATE}</legend>
				<table>
					<tr>
						<td>{TR_SUBJECT}</td>
						<td><input type="text" name="subject1" id="subject1" value="{SUBJECT_VALUE1}" /></td>
						<td><input type="text" name="subject2" id="subject2" value="{SUBJECT_VALUE2}" /></td>
					</tr>
					<tr>
						<td>{TR_MESSAGE}</td>
						<td><textarea name="message1" id="message1" cols="80" rows="20" style="width: 400px;">{MESSAGE_VALUE1}</textarea></td>
						<td><textarea name="message2" id="message2" cols="80" rows="20" style="width: 400px;">{MESSAGE_VALUE2}</textarea></td>
					</tr>
					<tr>
						<td>{TR_SENDER_EMAIL}</td>
						<td colspan="2">{SENDER_EMAIL_VALUE}</td>
					</tr>
					<tr>
						<td>{TR_SENDER_NAME}</td>
						<td colspan="2">{SENDER_NAME_VALUE}</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="apply" />
                		<input type="submit" name="Submit" value="{TR_APPLY_CHANGES}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
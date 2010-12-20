<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_CIRCULAR_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_CIRCULAR_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
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
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="manage_users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_CIRCULAR}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_CIRCULAR}</span></h2>
		<form action="circular.php" method="post" id="admin_circular">
			<fieldset>
				<legend>{TR_CORE_DATA}</legend>
				<table>
					<tr>
						<td><label for="rcpt_to">{TR_SEND_TO}</label></td>
						<td>
							<select id="rcpt_to" name="rcpt_to">
								<option value="usrs">{TR_ALL_USERS}</option>
								<option value="rslrs">{TR_ALL_RESELLERS}</option>
								<option value="usrs_rslrs">{TR_ALL_USERS_AND_RESELLERS}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label for="msg_subject">{TR_MESSAGE_SUBJECT}</label></td>
						<td><input type="text" name="msg_subject" id="msg_subject" value="{MESSAGE_SUBJECT}"/></td>
					</tr>
					<tr>
						<td><label for="msg_text">{TR_MESSAGE_TEXT}</label></td>
						<td><textarea name="msg_text" id="msg_text" cols="80" rows="20">{MESSAGE_TEXT}</textarea></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_ADDITIONAL_DATA}</legend>
				<table>
					<tr>
						<td><label for="sender_email">{TR_SENDER_EMAIL}</label></td>
						<td><input type="text" name="sender_email" id="sender_email" value="{SENDER_EMAIL}"/></td>
					</tr>
					<tr>
						<td><label for="sender_name">{TR_SENDER_NAME}</label></td>
						<td><input type="text" name="sender_name" id="sender_name" value="{SENDER_NAME}"/></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="send_circular" />
				<input type="submit" name="Submit" value="{TR_SEND_MESSAGE}" />
			</div>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
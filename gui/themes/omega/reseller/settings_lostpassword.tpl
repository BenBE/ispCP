<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_LOSTPW_EMAL_SETUP}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_LOSTPW_EMAL_SETUP}' />
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
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_LOSTPW_EMAIL}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_LOSTPW_EMAIL}</span></h2>
		<form action="settings_lostpassword.php" method="post" id="reseller_settings_lostpassword">
			<fieldset>
				<legend>{TR_MESSAGE_TEMPLATE_INFO}</legend>
				<table>
					<thead>
						<tr>
							<th colspan="2">{TR_ACTIVATION_EMAIL}</th>
							<th colspan="2">{TR_PASSWORD_EMAIL}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>{TR_USER_LOGIN_NAME}</td>
							<td>{USERNAME}</td>
							<td>{TR_USER_LOGIN_NAME}</td>
							<td>{USERNAME}</td>
						</tr>
						<tr>
							<td>{TR_LOSTPW_LINK}</td>
							<td>{LINK}</td>
							<td>{TR_USER_PASSWORD}</td>
							<td>{PASSWORD}</td>
						</tr>
						<tr>
							<td>{TR_USER_REAL_NAME}</td>
							<td>{NAME}</td>
							<td>{TR_USER_REAL_NAME}</td>
							<td>{NAME}</td>
						</tr>
						<tr>
							<td>{TR_BASE_SERVER_VHOST}</td>
							<td>{BASE_SERVER_VHOST}</td>
							<td>{TR_BASE_SERVER_VHOST}</td>
							<td>{BASE_SERVER_VHOST}</td>
						</tr>
						<tr>
							<td>{TR_BASE_SERVER_VHOST_PREFIX}</td>
							<td>{BASE_SERVER_VHOST_PREFIX}</td>
							<td>{TR_BASE_SERVER_VHOST_PREFIX}</td>
							<td>{BASE_SERVER_VHOST_PREFIX}</td>
						</tr>
					</tbody>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_MESSAGE_TEMPLATE}</legend>
				<table>
					<tr>
						<td>{TR_SENDER_EMAIL}</td>
						<td colspan="2">{SENDER_EMAIL_VALUE}</td>
					</tr>
					<tr>
						<td>{TR_SENDER_NAME}</td>
						<td colspan="2">{SENDER_NAME_VALUE}</td>
					</tr>
					<tr>
						<td>{TR_SUBJECT}</td>
						<td><input type="text" name="subject1" id="subject1" value="{SUBJECT_VALUE1}" /></td>
						<td><input type="text" name="subject2" value="{SUBJECT_VALUE2}" /></td>
					</tr>
					<tr>
						<td>{TR_MESSAGE}</td>
						<td><textarea name="message1" cols="40" rows="20" id="message1">{MESSAGE_VALUE1}</textarea></td>
						<td><textarea name="message2" cols="40" rows="20" id="message2">{MESSAGE_VALUE2}</textarea></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="sender_email" value="{SENDER_EMAIL_VALUE}" />
				<input type="hidden" name="sender_name" value="{SENDER_NAME_VALUE}" />
				<input type="hidden" name="uaction" value="apply" />
                		<input type="submit" name="Submit" value="{TR_APPLY_CHANGES}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->

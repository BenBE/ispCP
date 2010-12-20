<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_RESELLER_ORDER_EMAL}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_RESELLER_ORDER_EMAL}' />
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
			<h1 class="purchasing">{TR_MENU_ORDERS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="orders.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_ORDER_EMAIL}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
   		<div class="{MSG_TYPE}">{MESSAGE}</div>
	   	<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_MENU_ORDER_EMAIL}</span></h2>
		<form action="order_email.php" method="post" id="reseller_order_email">
			<fieldset>
				<legend>{TR_MESSAGE_TEMPLATE_INFO}</legend>
				<table>
					<tr>
						<td>{TR_USER_DOMAIN}</td>
						<td>{DOMAIN}</td>
					</tr>
					<tr>
						<td>{TR_USER_REAL_NAME}</td>
						<td>{NAME}</td>
					</tr>
					<tr>
						<td>{TR_ACTIVATION_LINK}</td>
						<td>{ACTIVATION_LINK}</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_MESSAGE_TEMPLATE}</legend>
				<table>
					<tr>
						<td>{TR_SUBJECT}</td>
						<td><input type="text" name="auto_subject" id="auto_subject" value="{SUBJECT_VALUE}" /></td>
					</tr>
					<tr>
						<td>{TR_MESSAGE}</td>
						<td><textarea name="auto_message" id="auto_message" cols="80" rows="30">{MESSAGE_VALUE}</textarea></td>
					</tr>
					<tr>
						<td>{TR_SENDER_EMAIL}</td>
						<td>{SENDER_EMAIL_VALUE}</td>
					</tr>
					<tr>
						<td>{TR_SENDER_NAME}</td>
						<td>{SENDER_NAME_VALUE}</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="order_email" />
				<input type="submit" name="Submit" value="{TR_APPLY_CHANGES}" />
			</div>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
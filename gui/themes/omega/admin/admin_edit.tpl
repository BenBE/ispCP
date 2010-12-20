<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_EDIT_USER_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_EDIT_USER_PAGE_TITLE}' />
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
			<li><a href="manage_users.php">{TR_MENU_MANAGE_USERS}</a></li>
			<li><a>{TR_EDIT_ADMIN}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="user"><span>{TR_EDIT_ADMIN}</span></h2>
		<form action="admin_edit.php" method="post" id="admin_edit_user">
			<fieldset>
				<legend>{TR_CORE_DATA}</legend>
				<table>
					<tr>
						<td>{TR_USERNAME}</td>
						<td>{USERNAME}</td>
					</tr>
					<tr>
						<td><label for="pass">{TR_PASSWORD}</label></td>
						<td>
							<input type="password" name="pass" id="pass" value="{VAL_PASSWORD}"/>
							<input type="submit" name="genpass" value="{TR_PASSWORD_GENERATE}" />
						</td>
					</tr>
					<tr>
						<td><label for="pass_rep">{TR_PASSWORD_REPEAT}</label></td>
						<td><input type="password" name="pass_rep" id="pass_rep" value="{VAL_PASSWORD}"/></td>
					</tr>
					<tr>
						<td><label for="email">{TR_EMAIL}</label></td>
						<td><input type="text" name="email" id="email" value="{EMAIL}"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_ADDITIONAL_DATA}</legend>
				<table>
					<tr>
						<td><label for="fname">{TR_FIRST_NAME}</label></td>
						<td><input type="text" name="fname" id="fname" value="{FIRST_NAME}"/></td>
					</tr>
					<tr>
						<td><label for="lname">{TR_LAST_NAME}</label></td>
						<td><input type="text" name="lname" id="lname" value="{LAST_NAME}"/></td>
					</tr>
					<tr>
						<td><label for="gender">{TR_GENDER}</label></td>
						<td>
							<select name="gender" id="gender">
								<option value="M" {VL_MALE}>{TR_MALE}</option>
								<option value="F" {VL_FEMALE}>{TR_FEMALE}</option>
								<option value="U" {VL_UNKNOWN}>{TR_UNKNOWN}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label for="firm">{TR_COMPANY}</label></td>
						<td><input type="text" name="firm" id="firm" value="{FIRM}"/></td>
					</tr>
					<tr>
						<td><label for="zip">{TR_ZIP_POSTAL_CODE}</label></td>
						<td><input type="text" name="zip" id="zip" value="{ZIP}"/></td>
					</tr>
					<tr>
						<td><label for="city">{TR_CITY}</label></td>
						<td><input type="text" name="city" id="city" value="{CITY}"/></td>
					</tr>
					<tr>
						<td><label for="state">{TR_STATE_PROVINCE}</label></td>
						<td><input type="text" name="state" id="state" value="{STATE_PROVINCE}"/></td>
					</tr>
					<tr>
						<td><label for="country">{TR_COUNTRY}</label></td>
						<td><input type="text" name="country" id="country" value="{COUNTRY}"/></td>
					</tr>
					<tr>
						<td><label for="street1">{TR_STREET_1}</label></td>
						<td><input type="text" name="street1" id="street1" value="{STREET_1}"/></td>
					</tr>
					<tr>
						<td><label for="street2">{TR_STREET_2}</label></td>
						<td><input type="text" name="street2" id="street2" value="{STREET_2}"/></td>
					</tr>
					<tr>
						<td><label for="phone">{TR_PHONE}</label></td>
						<td><input type="text" name="phone" id="phone" value="{PHONE}"/></td>
					</tr>
					<tr>
						<td><label for="fax">{TR_FAX}</label></td>
						<td><input type="text" name="fax" id="fax" value="{FAX}" /></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="edit_id" value="{EDIT_ID}" />
				<input type="hidden" name="edit_username" value="{USERNAME}" />
				<input type="hidden" name="uaction" value="edit_user" />
				<label for="send_data">{TR_SEND_DATA}</label>
				<input type="checkbox" name="send_data" id="send_data" checked="checked" />
				<input type="submit" name="Submit" value="{TR_UPDATE}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
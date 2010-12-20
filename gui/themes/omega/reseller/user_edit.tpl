<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_EDIT_USER_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_EDIT_USER_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
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
			<li><a>{TR_EDIT_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="general"><span>{TR_MANAGE_USERS}</span></h2>
		<form action="user_edit.php" method="post" id="reseller_user_edit">
			<fieldset>
				<legend>{TR_CORE_DATA}</legend>
				<table>
					<tr>
						<td>{TR_USERNAME}</td>
						<td>{VL_USERNAME}</td>
					</tr>
					<tr>
						<td>{TR_PASSWORD}</td>
						<td>
							<input type="password" name="userpassword" id="userpassword" value="{VAL_PASSWORD}"/>
							<input type="submit" name="genpass" value=" {TR_PASSWORD_GENERATE} " />
						</td>
					</tr>
					<tr>
						<td>{TR_REP_PASSWORD}</td>
						<td><input type="password" name="userpassword_repeat" id="userpassword_repeat" value="{VAL_PASSWORD}"/></td>
					</tr>
					<tr>
						<td>{TR_USREMAIL}</td>
						<td><input type="text" name="useremail" id="useremail" value="{VL_MAIL}"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_ADDITIONAL_DATA}</legend>
				<table>
					<tr>
						<td>{TR_CUSTOMER_ID}</td>
						<td><input type="text" name="useruid" id="useruid" value="{VL_USR_ID}"/></td>
					</tr>
					<tr>
						<td>{TR_FIRSTNAME}</td>
						<td><input type="text" name="userfname" id="userfname" value="{VL_USR_NAME}"/></td>
					</tr>
					<tr>
						<td>{TR_LASTNAME}</td>
						<td><input type="text" name="userlname" id="userlname" value="{VL_LAST_USRNAME}"/></td>
					</tr>
					<tr>
						<td>{TR_GENDER}</td>
						<td>
							<select name="gender" id="gender">
								<option value="M" {VL_MALE}>{TR_MALE}</option>
								<option value="F" {VL_FEMALE}>{TR_FEMALE}</option>
								<option value="U" {VL_UNKNOWN}>{TR_UNKNOWN}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>{TR_COMPANY}</td>
						<td><input type="text" name="userfirm" id="userfirm" value="{VL_USR_FIRM}" /></td>
					</tr>
					<tr>
						<td>{TR_STREET1}</td>
						<td><input type="text" name="userstreet1" id="userstreet1" value="{VL_STREET1}" /></td>
					</tr>
					<tr>
						<td>{TR_STREET2}</td>
						<td><input type="text" name="userstreet2" id="userstreet2" value="{VL_STREET2}" /></td>
					</tr>
					<tr>
						<td>{TR_POST_CODE}</td>
						<td><input type="text" name="userzip" id="userzip" value="{VL_USR_POSTCODE}" /></td>
					</tr>
					<tr>
						<td>{TR_CITY}</td>
						<td><input type="text" name="usercity" id="usercity" value="{VL_USRCITY}" /></td>
					</tr>
					<tr>
						<td>{TR_STATE}</td>
						<td><input type="text" name="userstate" id="userstate" value="{VL_USRSTATE}" /></td>
					</tr>
					<tr>
						<td>{TR_COUNTRY}</td>
						<td><input type="text" name="usercountry" id="usercountry" value="{VL_COUNTRY}" /></td>
					</tr>
					<tr>
						<td>{TR_PHONE}</td>
						<td><input type="text" name="userphone" id="userphone" value="{VL_PHONE}" /></td>
					</tr>
					<tr>
						<td>{TR_FAX}</td>
						<td><input type="text" name="userfax" id="userfax" value="{VL_FAX}" /></td>
					</tr>
				</table>
				<div class="buttons">
					<input type="hidden" name="edit_id" value="{EDIT_ID}" />
					<input type="hidden" name="uaction" value="save_changes" />
					<input type="checkbox" id="send_data" name="send_data" checked="checked" />&nbsp;{TR_SEND_DATA}
					<input type="submit"  name="Submit" value="{TR_BTN_ADD_USER}"/>
				</div>
			</fieldset>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
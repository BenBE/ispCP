<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_ADD_RESELLER_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_ADD_RESELLER_PAGE_TITLE}' />
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
			<li><a>{TR_ADD_RESELLER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="user"><span>{TR_ADD_RESELLER}</span></h2>
		<form action="reseller_add.php" method="post" id="admin_add_reseller">
			<fieldset>
				<legend>{TR_CORE_DATA}</legend>
				<table>
					<tr>
						<td><label for="username">{TR_USERNAME}</label></td>
						<td><input type="text" name="username" id="username" value="{USERNAME}" /></td>
					</tr>
					<tr>
						<td><label for="pass">{TR_PASSWORD}</label></td>
						<td><input type="password" name="pass" id="pass" value="{GENPAS}"/></td>
					</tr>
					<tr>
						<td><label for="pass_rep">{TR_PASSWORD_REPEAT}</label></td>
						<td><input type="password" name="pass_rep" id="pass_rep" value="{GENPAS}"/></td>
					</tr>
					<tr>
						<td><label for="email">{TR_EMAIL}</label></td>
						<td><input type="text" name="email" id="email" value="{EMAIL}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_domain_cnt">{TR_MAX_DOMAIN_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_domain_cnt" id="nreseller_max_domain_cnt" value="{MAX_DOMAIN_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_subdomain_cnt">{TR_MAX_SUBDOMAIN_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_subdomain_cnt" id="nreseller_max_subdomain_cnt" value="{MAX_SUBDOMAIN_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_alias_cnt">{TR_MAX_ALIASES_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_alias_cnt" id="nreseller_max_alias_cnt" value="{MAX_ALIASES_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_mail_cnt">{TR_MAX_MAIL_USERS_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_mail_cnt" id="nreseller_max_mail_cnt" value="{MAX_MAIL_USERS_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_ftp_cnt">{TR_MAX_FTP_USERS_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_ftp_cnt" id="nreseller_max_ftp_cnt" value="{MAX_FTP_USERS_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_sql_db_cnt">{TR_MAX_SQLDB_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_sql_db_cnt" id="nreseller_max_sql_db_cnt" value="{MAX_SQLDB_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_sql_user_cnt">{TR_MAX_SQL_USERS_COUNT}</label></td>
						<td><input type="text" name="nreseller_max_sql_user_cnt" id="nreseller_max_sql_user_cnt" value="{MAX_SQL_USERS_COUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_traffic">{TR_MAX_TRAFFIC_AMOUNT}</label></td>
						<td><input type="text" name="nreseller_max_traffic" id="nreseller_max_traffic" value="{MAX_TRAFFIC_AMOUNT}"/></td>
					</tr>
					<tr>
						<td><label for="nreseller_max_disk">{TR_MAX_DISK_AMOUNT}</label></td>
						<td><input type="text" name="nreseller_max_disk" id="nreseller_max_disk" value="{MAX_DISK_AMOUNT}"/></td>
					</tr>
					<tr>
						<td>{TR_SUPPORT_SYSTEM}</td>
						<td>
							<input type="radio" checked="checked" name="support_system" id="support_system_yes" value="yes" /><label for="support_system_yes"> {TR_YES}</label>
							<input type="radio" name="support_system" id="support_system_no" value="no" /><label for="support_system_no"> {TR_NO}</label>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{TR_RESELLER_IPS}</legend>
				<!-- BDP: rsl_ip_message -->
				<div class="{MSG_TYPE}">{MESSAGE}</div>
				<!-- EDP: rsl_ip_message -->
				<!-- BDP: rsl_ip_list -->
				<table>
					<tr>
						<th>{TR_RSL_IP_NUMBER}</th>
						<th>{TR_RSL_IP_ASSIGN}</th>
						<th>{TR_RSL_IP_LABEL}</th>
						<th>{TR_RSL_IP_IP}</th>
					</tr>
					<!-- BDP: rsl_ip_item -->
					<tr>
						<td>{RSL_IP_NUMBER}</td>
						<td><input type="checkbox" name="{RSL_IP_CKB_NAME}" id="{RSL_IP_CKB_NAME}" value="{RSL_IP_CKB_VALUE}" {RSL_IP_ITEM_ASSIGNED} /></td>
						<td><label for="{RSL_IP_CKB_NAME}">{RSL_IP_LABEL}</label></td>
						<td>{RSL_IP_IP}</td>
					</tr>
					<!-- EDP: rsl_ip_item -->
				</table>
				<!-- EDP: rsl_ip_list -->
			</fieldset>
			<fieldset>
				<legend>{TR_ADDITIONAL_DATA}</legend>
				<table>
					<tr>
						<td><label for="customer_id">{TR_CUSTOMER_ID}</label></td>
						<td><input type="text" name="customer_id" id="customer_id" value="{CUSTOMER_ID}"/></td>
					</tr>
					<tr>
						<td><label for="first_name">{TR_FIRST_NAME}</label></td>
						<td><input type="text" name="fname" id="first_name" value="{FIRST_NAME}"/></td>
					</tr>
					<tr>
						<td><label for="last_name">{TR_LAST_NAME}</label></td>
						<td><input type="text" name="lname" id="last_name" value="{LAST_NAME}"/></td>
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
						<td><input type="text" name="firm" id="firm" value="{FIRM}" /></td>
					</tr>
					<tr>
						<td><label for="street1">{TR_STREET_1}</label></td>
						<td><input type="text" name="street1" id="street1" value="{STREET_1}" /></td>
					</tr>
					<tr>
						<td><label for="street2">{TR_STREET_2}</label></td>
						<td><input type="text" name="street2" id="street2" value="{STREET_2}" /></td>
					</tr>
					<tr>
						<td><label for="zip_postal_code">{TR_ZIP_POSTAL_CODE}</label></td>
						<td><input type="text" name="zip" id="zip_postal_code" value="{ZIP}" /></td>
					</tr>
					<tr>
						<td><label for="city">{TR_CITY}</label></td>
						<td><input type="text" name="city" id="city" value="{CITY}" /></td>
					</tr>
					<tr>
						<td><label for="state">{TR_STATE}</label></td>
						<td><input type="text" name="state" id="state" value="{STATE}" /></td>
					</tr>
					<tr>
						<td><label for="country">{TR_COUNTRY}</label></td>
						<td><input type="text" name="country" id="country" value="{COUNTRY}" /></td>
					</tr>
					<tr>
						<td><label for="phone">{TR_PHONE}</label></td>
						<td><input type="text" name="phone" id="phone" value="{PHONE}" /></td>
					</tr>
					<tr>
						<td><label for="fax">{TR_FAX}</label></td>
						<td><input type="text" name="fax" id="fax" value="{FAX}" /></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_reseller" />
				<input type="submit" name="Submit" value="{TR_ADD}" />
			</div>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
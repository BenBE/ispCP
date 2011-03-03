{include file='header.tpl'}
<body>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="manage_users">{$TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_ADD_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="user"><span>{$TR_ADD_USER}</span></h2>
		{if !isset($ADD_USER)}
		<form action="user_add3.php" method="post" id="reseller_user_add3">
			<fieldset>
				<legend>{$TR_CORE_DATA}</legend>
				<table>
					<tr>
						<td>{$TR_USERNAME}</td>
						<td>{$VL_USERNAME}</td>
					</tr>
					<tr>
						<td>{$TR_PASSWORD}</td>
						<td><input type="password" name="userpassword" id="password" value="{$VL_USR_PASS}"/></td>
					</tr>
					<tr>
						<td>{$TR_REP_PASSWORD}</td>
						<td><input type="password" name="userpassword_repeat" id="pass_rep" value="{$VL_USR_PASS}"/></td>
					</tr>
					<tr>
						<td>
							{$TR_DMN_IP}
						</td>
						<td><select name="domain_ip" id="domain_ip">
								<!-- BDP: ip_entry -->
								<option value="{$IP_VALUE}" {$IP_SELECTED}>{$IP_NUM}&nbsp;({$IP_NAME})</option>
								<!-- EDP: ip_entry -->
							</select>
						</td>
					</tr>
					<tr>
						<td>{$TR_USREMAIL}</td>
						<td><input type="text" name="useremail" id="useremail" value="{$VL_MAIL}"/></td>
					</tr>
					<tr>
						<td>
							{$TR_ADD_ALIASES}
						</td>
						<td><input type="checkbox" name="add_alias" id="add_alias" value="on" /></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{$TR_ADDITIONAL_DATA}</legend>
				<table>
					<tr>
						<td>{$TR_CUSTOMER_ID}</td>
						<td><input type="text" name="useruid" id="useruid" value="{$VL_USR_ID}"/></td>
					</tr>
					<tr>
						<td>{$TR_FIRSTNAME}</td>
						<td><input type="text" name="userfname" id="userfname" value="{$VL_USR_NAME}"/></td>
					</tr>
					<tr>
						<td>{$TR_LASTNAME}</td>
						<td><input type="text" name="userlname" id="userlname" value="{$VL_LAST_USRNAME}"/></td>
					</tr>
					<tr>
						<td>{$TR_GENDER}</td>
						<td><select id="gender" name="gender">
								<option value="M" {$VL_MALE}>{$TR_MALE}</option>
								<option value="F" {$VL_FEMALE}>{$TR_FEMALE}</option>
								<option value="U" {$VL_UNKNOWN}>{$TR_UNKNOWN}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>{$TR_COMPANY}</td>
						<td><input type="text" name="userfirm" id="userfirm" value="{$VL_USR_FIRM}" /></td>
					</tr>
					<tr>
						<td>{$TR_STREET1}</td>
						<td><input type="text" name="userstreet1" id="userstreet1" value="{$VL_STREET1}" /></td>
					</tr>
					<tr>
						<td>{$TR_STREET2}</td>
						<td><input type="text" name="userstreet2" id="userstreet2" value="{$VL_STREET2}" /></td>
					</tr>
					<tr>
						<td>{$TR_POST_CODE}</td>
						<td><input type="text" name="userzip" id="userzip" value="{$VL_USR_POSTCODE}" /></td>
					</tr>
					<tr>
						<td>{$TR_CITY}</td>
						<td><input type="text" name="usercity" id="usercity" value="{$VL_USRCITY}" /></td>
					</tr>
					<tr>
						<td>{$TR_STATE_PROVINCE}</td>
						<td><input type="text" name="userstate" id="userstate" value="{$VL_USRSTATE}" /></td>
					</tr>
					<tr>
						<td>{$TR_COUNTRY}</td>
						<td><input type="text" name="usercountry" id="usercountry" value="{$VL_COUNTRY}" /></td>
					</tr>
					<tr>
						<td>{$TR_PHONE}</td>
						<td><input type="text" name="userphone" id="userphone" value="{$VL_PHONE}" /></td>
					</tr>
					<tr>
						<td>{$TR_FAX}</td>
						<td><input type="text" name="userfax" id="userfax" value="{$VL_FAX}" /></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="user_add3_nxt" />
				<input type="submit" name="Submit" value="{$TR_BTN_ADD_USER}" />
			</div>
		</form>
		{/if}
	</div>
		<div class="footer">
			ispCP Omega {$VERSION}<br />build: {$BUILDDATE}<br />Codename: {$CODENAME}
		</div>
</body>
</html>
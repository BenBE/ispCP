{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) { 
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE_ACCOUNT}", domain)))
				return false;
			location = url;
		}
	/* ]]> */
	</script>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="purchasing">{$TR_MENU_ORDERS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="orders.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_ORDER_DETAILS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
	   	{/if}
		<h2 class="domains"><span>{$TR_ORDER_DETAILS}</span></h2>
		<form action="orders_details.php?order_id={$ID}" method="post" id="reseller_orders_details">
			<fieldset>
				<legend>{$TR_HOSTING_INFO}</legend>
				<table>
					<tr>
						<td>{$TR_DATE}</td>
						<td>{$DATE}</td>
					</tr>
					<tr>
						<td>{$TR_HP}</td>
						<td>{$HP}</td>
					</tr>
					<tr>
						<td>{$TR_DOMAIN}</td>
						<td><input type="text" name="domain" id="domain" value="{$DOMAINNAME}" /></td>
					</tr>
					<tr>
						<td>{$TR_DMN_IP}</td>
						<td>
							<select name="domain_ip" id="domain_ip">
								<!-- BDP: ip_entry -->
								<option value="{$IP_VALUE}" {$IP_SELECTED}>{$IP_NUM}&nbsp;({$IP_NAME})</option>
								<!-- EDP: ip_entry -->
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{$TR_CUSTOMER_DATA}</legend>
				<table>
					<tr>
						<td>{$TR_CUSTOMER_ID}</td>
						<td><input type="text" name="customer_id" id="customer_id" value="{$CUSTOMER_ID}" /></td>
					</tr>
					<tr>
						<td>{$TR_FIRST_NAME}</td>
						<td><input type="text" name="fname" id="fname" value="{$FNAME}" /></td>
					</tr>
					<tr>
						<td>{$TR_LAST_NAME}</td>
						<td><input type="text" name="lname" id="lname" value="{$LNAME}" /></td>
					</tr>
					<tr>
						<td>{$TR_GENDER}</td>
						<td>
							<select name="gender" id="gender" size="1">
								<option value="M" {$VL_MALE}>{$TR_MALE}</option>
								<option value="F" {$VL_FEMALE}>{$TR_FEMALE}</option>
								<option value="U" {$VL_UNKNOWN}>{$TR_UNKNOWN}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>{$TR_COMPANY}</td>
						<td><input type="text" name="firm" id="firm" value="{$FIRM}"/></td>
					</tr>
					<tr>
						<td>{$TR_ZIP_POSTAL_CODE}</td>
						<td><input type="text" name="zip" id="zip" value="{$ZIP}" /></td>
					</tr>
					<tr>
						<td>{$TR_CITY}</td>
						<td><input type="text" name="city" id="city" value="{$CITY}" /></td>
					</tr>
					<tr>
						<td>{$TR_STATE}</td>
						<td><input type="text" name="state" id="state" value="{$STATE}" /></td>
					</tr>
					<tr>
						<td>{$TR_COUNTRY}</td>
						<td><input type="text" name="country" id="country" value="{$COUNTRY}" /></td>
					</tr>
					<tr>
						<td>{$TR_STREET_1}</td>
						<td><input type="text" name="street1" id="street1" value="{$STREET1}"/></td>
					</tr>
					<tr>
						<td>{$TR_STREET_2}</td>
						<td><input type="text" name="street2" id="street2" value="{$STREET2}"/></td>
					</tr>
					<tr>
						<td>{$TR_EMAIL}</td>
						<td><input type="text" name="email" id="email" value="{$EMAIL}"/></td>
					</tr>
					<tr>
						<td>{$TR_PHONE}</td>
						<td><input type="text" name="phone" id="phone" value="{$PHONE}"/></td>
					</tr>
					<tr>
						<td>{$TR_FAX}</td>
						<td><input type="text" name="fax" id="fax" value="{$FAX}"/></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="order_id" value="{$ID}" />
				<input type="hidden" name="uaction" value="" />
				<input type="button" name="add" onclick="return sbmt(document.forms[0],'add_user');" value="{$TR_ADD}" />
				<input type="button" name="update" onclick="return sbmt(document.forms[0],'update_data');"  value="{$TR_UPDATE_DATA}" />
				<input type="button" name="delete" onclick="delete_order('orders_delete.php?order_id={$ID}', '{$DOMAIN}')" value="{$TR_DELETE_ORDER}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
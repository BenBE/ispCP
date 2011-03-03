{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", subject)))
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
			<h1 class="settings">{$TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$MANAGE_IPS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="ip"><span>{$MANAGE_IPS}</span></h2>
		<fieldset>
			<legend>{$TR_AVAILABLE_IPS}</legend>
			<table>
				<tr>
					<td><strong>{$TR_IP}</strong></td>
					<td><strong>{$TR_DOMAIN}</strong></td>
					<td><strong>{$TR_ALIAS}</strong></td>
					<td><strong>{$TR_NETWORK_CARD}</strong></td>
					<td><strong>{$TR_ACTION}</strong></td>
				</tr>
				{section name=i loop=$IP}
				<tr>                    
					<td>{$IP[i]}</td>
					<td>{$DOMAIN[i]}</td>
					<td>{$ALIAS[i]}</td>
					<td>{$NETWORK_CARD[i]}</td>
					<td>
						{if isset($IP_ACTION[i])}
							{if $IP_ACTION[i] == false}
								N/A
							{else}
								<a href="#" onclick="action_delete('{$IP_ACTION_SCRIPT[i]}', '{$IP[i]}')"  title="{$IP_ACTION[i]}" class="icon i_delete"></a>
							{/if}
						{/if}
					</td>
                </tr>
				{/section}
			</table>
		</fieldset>
		<form action="ip_manage.php" method="post" id="add_new_ip_frm">
			<fieldset>
				<legend>{$TR_ADD_NEW_IP}</legend>
				<table>
					<tr>
						<td><label for="ip_number_1">{$TR_IP}</label></td>
						<td><input type="text" name="ip_number_1" id="ip_number_1" value="{$VALUE_IP1}" maxlength="3" />.</td>
						<td><input type="text" name="ip_number_2" id="ip_number_2" value="{$VALUE_IP2}" maxlength="3" />.</td>
						<td><input type="text" name="ip_number_3" id="ip_number_3" value="{$VALUE_IP3}" maxlength="3" />.</td>
						<td><input type="text" name="ip_number_4" id="ip_number_4" value="{$VALUE_IP4}" maxlength="3" /></td>
					</tr>
					<tr>
						<td><label for="domain">{$TR_DOMAIN}</label></td>
						<td colspan="3"><input type="text" name="domain" id="domain" value="{$VALUE_DOMAIN}" /></td>
						</tr>
					<tr>
						<td><label for="alias">{$TR_ALIAS}</label></td>
						<td colspan="3"><input type="text" name="alias" id="alias" value="{$VALUE_ALIAS}" />
						</td>
					</tr>
					<tr>                        
						<td>{$TR_NETWORK_CARD}</td>
						<td colspan="3">
							<select name="ip_card">
								<!-- BDP: card_list -->
								<option>{$NETWORK_CARDS}</option>
								<!-- EDP: card_list -->
							</select>
						</td>
					</tr>
				</table>
				<input type="hidden" name="uaction" value="add_ip" />
				<input type="submit" name="Submit" value="  {$TR_ADD}  " />
			</fieldset>
		</form>
	</div>
{include file='footer.tpl'}
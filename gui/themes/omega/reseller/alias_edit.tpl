{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function setForwardReadonly(obj){ 
			if(obj.value == 1) { 
				document.getElementById('reseller_alias_edit').elements['forward'].readOnly = false;
				document.getElementById('reseller_alias_edit').elements['forward_prefix'].disabled = false;
			} else { 
				document.getElementById('reseller_alias_edit').elements['forward'].readOnly = true;
				document.getElementById('reseller_alias_edit').elements['forward'].value = '';
				document.getElementById('reseller_alias_edit').elements['forward_prefix'].disabled = true;
			}
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
			<h1 class="manage_users">{$TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{$TR_MENU_MANAGE_USERS}</a></li>
			<li><a href="alias.php">{$TR_MENU_DOMAIN_ALIAS}</a></li>
			<li><a>{$TR_EDIT_ALIAS} {$ALIAS_NAME}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="domains"><span>{$TR_EDIT_ALIAS}</span></h2>
		<form action="alias_edit.php?edit_id={$ID}" method="post" id="reseller_alias_edit">
			<table>
				<tr>
					<td>{$TR_ALIAS_NAME}</td>
					<td>{$ALIAS_NAME}</td>
				</tr>
				<tr>
					<td>{$TR_DOMAIN_IP}</td>
					<td>{$DOMAIN_IP}</td>
				</tr>
				<tr>
					<td>{$TR_ENABLE_FWD}</td>
					<td>
						<input type="radio" name="status" id="status_EN" value="1" onchange="setForwardReadonly(this);" {$CHECK_EN} /> &nbsp; {$TR_ENABLE}<br />
						<input type="radio" name="status" id="status_DIS" value="0" onchange="setForwardReadonly(this);" {$CHECK_DIS} /> &nbsp;{$TR_DISABLE}
					</td>
				</tr>
				<tr>
					<td>{$TR_FORWARD}</td>
					<td>
						<select name="forward_prefix" style="vertical-align:middle"{$DISABLE_FORWARD}>
							<option value="{$TR_PREFIX_HTTP}" {$HTTP_YES}>{$TR_PREFIX_HTTP}</option>
							<option value="{$TR_PREFIX_HTTPS}" {$HTTPS_YES}>{$TR_PREFIX_HTTPS}</option>
							<option value="{$TR_PREFIX_FTP}" {$FTP_YES}>{$TR_PREFIX_FTP}</option>
						</select>
						<input type="text" name="forward" id="forward" value="{$FORWARD}" {$READONLY_FORWARD} />
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="modify" />
				<input type="submit" name="Submit" value="{$TR_MODIFY}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
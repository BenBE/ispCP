{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){ 
			// Tooltips - begin
			$('#dmn_help').ispCPtooltips({ msg:"{$TR_DMN_HELP}"});
			// Tooltips - end
		});

		function makeUser() { 
			var dname = document.getElementById('reseller_alias_add').elements['ndomain_name'].value;
			dname = dname.toLowerCase();
			document.getElementById('reseller_alias_add').elements['ndomain_mpoint'].value = "/" + dname;
		}

		function setForwardReadonly(obj){ 
			if(obj.value == 1) { 
				document.forms[0].elements['forward'].readOnly = false;
				document.forms[0].elements['forward_prefix'].disabled = false;
			} else { 
				document.forms[0].elements['forward'].readOnly = true;
				document.forms[0].elements['forward'].value = '';
				document.forms[0].elements['forward_prefix'].disabled = true;
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
			<!-- <li><a class="help" href="#">Help</a></li> -->
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{$TR_MENU_MANAGE_USERS}</a></li>
			<li><a href="alias.php">{$TR_MENU_DOMAIN_ALIAS}</a></li>
			<li><a>{$TR_ADD_ALIAS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="domains"><span>{$TR_MANAGE_DOMAIN_ALIAS}</span></h2>
		<form action="alias_add.php" method="post" id="reseller_alias_add">
			<fieldset>
				<legend>{$TR_ADD_ALIAS}</legend>
				<table>
					<tr>
						<td>{$TR_DOMAIN_ACCOUNT}</td>
						<td colspan="2">
							<select name="usraccounts" id="usraccounts" size="5">
								<!-- BDP: user_entry -->
									<option value="{$USER}" {$SELECTED}>{$USER_DOMAIN_ACCOUN}</option>
								<!-- EDP: user_entry -->
							</select>
						</td>
					</tr>
					<tr>
						<td>{$TR_DOMAIN_NAME} <span id="dmn_help" class="icon i_help">&nbsp;</span></td>
						<td><input type="text" name="ndomain_name" id="ndomain_name" value="{$DOMAIN}" onblur="makeUser();" /></td>
					</tr>
					<tr>
						<td>{$TR_MOUNT_POINT}</td>
						<td><input type="text" name="ndomain_mpoint" id="ndomain_mpoint" value='{$MP}' /></td>
					</tr>
					<tr>
						<td>{$TR_ENABLE_FWD}</td>
						<td>
							<input type="radio" name="status" id="status_EN" value="1" onchange="setForwardReadonly(this);" {$CHECK_EN} /> {$TR_ENABLE}<br />
							<input type="radio" name="status" id="status_DIS" value="0" onchange="setForwardReadonly(this);" {$CHECK_DIS} /> {$TR_DISABLE}</td>
					</tr>
					<tr>
						<td>{$TR_FORWARD}</td>
						<td>
							<select name="forward_prefix" style="vertical-align:middle" {$DISABLE_FORWARD}>
								<option value="{$TR_PREFIX_HTTP}" {$HTTP_YES}>{$TR_PREFIX_HTTP}</option>
								<option value="{$TR_PREFIX_HTTPS}" {$HTTPS_YES}>{$TR_PREFIX_HTTPS}</option>
								<option value="{$TR_PREFIX_FTP}" {$FTP_YES}>{$TR_PREFIX_FTP}</option>
							</select>
							<input type="text" name="forward" id="forward" value="{$FORWARD}" {$READONLY_FORWARD} />
						</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_alias" />
				<input type="submit" name="Submit" value="{$TR_ADD}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
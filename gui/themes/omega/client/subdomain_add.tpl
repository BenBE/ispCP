{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Tooltips - begin
			$('#fwd_help').ispCPtooltips({ msg:"{$TR_DMN_HELP}"});
			$('#mnt_help').ispCPtooltips({ msg:"{$TR_MNT_POINT_HELP}"});
			// Tooltips - end
		});

		function makeUser() {
			var subname  = document.getElementById('client_subdomain_add').elements['subdomain_name'].value;
			subname = subname.toLowerCase();
			document.getElementById('client_subdomain_add').elements['subdomain_mnt_pt'].value = "/" + subname;
		}

		function setForwardReadonly(obj){
			if(obj.value == 1) {
				document.getElementById('client_subdomain_add').elements['forward'].readOnly = false;
				document.getElementById('client_subdomain_add').elements['forward_prefix'].disabled = false;
			} else {
				document.getElementById('client_subdomain_add').elements['forward'].readOnly = true;
				document.getElementById('client_subdomain_add').elements['forward'].value = '';
				document.getElementById('client_subdomain_add').elements['forward_prefix'].disabled = true;
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
			<h1 class="domains">{$TR_MENU_MANAGE_DOMAINS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="domains_manage.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_ADD_SUBDOMAIN}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="domains"><span>{$TR_ADD_SUBDOMAIN}</span></h2>
		<form action="subdomain_add.php" method="post" id="client_subdomain_add">
			<table>
				<tr>
					<td>{$TR_SUBDOMAIN_NAME} <span id="fwd_help" class="icon i_help">&nbsp;</span></td>
					<td>
						<input type="text" name="subdomain_name" id="subdomain_name" value="{$SUBDOMAIN_NAME}" onblur="makeUser();" />&nbsp;
						<input type="radio" name="dmn_type" id="dmn_type" value="dmn" {$SUB_DMN_CHECKED} />{$DOMAIN_NAME}&nbsp;
						<!-- BDP: to_alias_domain -->
						<input type="radio" name="dmn_type" value="als" {$SUB_ALS_CHECKED} />
							<select name="als_id">
								{if isset($ALS_NAME)}
									<option value="{$ALS_ID}" {$ALS_SELECTED}>.{$ALS_NAME}</option>
								{/if}
							</select>
						<!-- EDP: to_alias_domain -->
					</td>
				</tr>
				<tr>
					<td>{$TR_DIR_TREE_SUBDOMAIN_MOUNT_POINT} <span id="mnt_help" class="icon i_help">&nbsp;</span></td>
					<td><input type="text" name="subdomain_mnt_pt" id="subdomain_mnt_pt" value="{$SUBDOMAIN_MOUNT_POINT}" /></td>
				</tr>
				<tr>
					<td>{$TR_ENABLE_FWD}</td>
					<td>
						<input type="radio" name="status" id="status_EN" value="1" onchange='setForwardReadonly(this);' {$CHECK_EN} />&nbsp;{$TR_ENABLE}<br />
						<input type="radio" name="status" id="status_DIS" value="0" onchange='setForwardReadonly(this);' {$CHECK_DIS} />&nbsp;{$TR_DISABLE}
					</td>
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
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_subd" />
				<input type="submit" name="Submit" value="{$TR_ADD}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, mailacc) {
			if (url.indexOf("delete")==-1) {
				location = url;
			} else {
				if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", mailacc)))
					return false;
				location = url;
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
			<h1 class="email">{$TR_MENU_EMAIL_ACCOUNTS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="mail_accounts.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_CATCH_ALL_MAIL}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="email"><span>{$TR_CATCHALL_MAIL_USERS}</span></h2>
		{if isset($CATCHALL_MSG)}
		<div class="{$MSG_TYPE}">{$CATCHALL_MSG}</div>
		{/if}
		<table>
			<thead>
				<tr>
					<th>{$TR_DOMAIN}</th>
					<th>{$TR_CATCHALL}</th>
					<th>{$TR_STATUS}</th>
					<th>{$TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: catchall_item -->
				<tr>
					<td>{$CATCHALL_DOMAIN}</td>
					<td>{$CATCHALL_ACC}</td>
					<td>{$CATCHALL_STATUS}</td>
					<td>
						<a href="#" class="icon i_users" onclick="action_delete('{$CATCHALL_ACTION_SCRIPT}', '{$CATCHALL_ACC}')">{$CATCHALL_ACTION}</a>
					</td>
				</tr>
				<!-- EDP: catchall_item -->
			</tbody>
		</table>
	</div>
{include file='footer.tpl'}
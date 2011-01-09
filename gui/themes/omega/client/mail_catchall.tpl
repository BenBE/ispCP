<!-- INCLUDE "header.tpl" -->
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, mailacc) {
			if (url.indexOf("delete")==-1) {
				location = url;
			} else {
				if (!confirm(sprintf("{TR_MESSAGE_DELETE}", mailacc)))
					return false;
				location = url;
			}
		}
	/* ]]> */
	</script>
	<div class="header">
		{MAIN_MENU}
		<div class="logo">
			<img src="{THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="email">{TR_MENU_EMAIL_ACCOUNTS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="mail_accounts.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_CATCH_ALL_MAIL}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_CATCHALL_MAIL_USERS}</span></h2>
		<!-- BDP: catchall_message -->
		<div class="{MSG_TYPE}">{CATCHALL_MSG}</div>
		<!-- EDP: catchall_message -->
		<table>
			<thead>
				<tr>
					<th>{TR_DOMAIN}</th>
					<th>{TR_CATCHALL}</th>
					<th>{TR_STATUS}</th>
					<th>{TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: catchall_item -->
				<tr>
					<td>{CATCHALL_DOMAIN}</td>
					<td>{CATCHALL_ACC}</td>
					<td>{CATCHALL_STATUS}</td>
					<td>
						<a href="#" class="icon i_users<!-- BDP: del_icon --> i_delete<!-- EDP: del_icon -->" onclick="action_delete('{CATCHALL_ACTION_SCRIPT}', '{CATCHALL_ACC}')">{CATCHALL_ACTION}</a>
					</td>
				</tr>
				<!-- EDP: catchall_item -->
			</tbody>
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
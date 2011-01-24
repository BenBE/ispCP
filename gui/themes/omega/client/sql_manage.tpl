<!-- INCLUDE "header.tpl" -->
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Target - begin
			$('#phpMyAdmin').attr('rel', 'external').attr('target', '_blank');
			// Target - end
		});

		function action_delete(url, subject) {
			if (!confirm(sprintf("{TR_MESSAGE_DELETE}", subject)))
				return false;
			location = url;
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
			<h1 class="database">{TR_MENU_MANAGE_SQL}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a>{TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="sql"><span>{TR_MANAGE_SQL}</span></h2>
		<table>
			<tr>
				<th>{TR_DATABASE}</th>
				<th>{TR_ACTION}</th>
			</tr>
			<!-- BDP: db_list -->
			<tr>
				<td><span class="icon i_database_small">&nbsp;</span> {DB_NAME}</td>
				<td>
					<a href="sql_user_add.php?id={DB_ID}" title="{TR_ADD_USER}" class="icon i_add_user"></a>
					<a href="#" onclick="action_delete('sql_database_delete.php?id={DB_ID}', '{DB_NAME}')" title="{TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- BDP: db_message -->
			<tr>
				<td colspan="2">{DB_MSG}</td>
			</tr>
			<!-- EDP: db_message -->
			<!-- BDP: user_list -->
			<tr>
				<td><span class="icon i_users">&nbsp;</span> {DB_USER}</td>
				<td>
					<a href="pma_auth.php?id={USER_ID}" id="phpMyAdmin" title="{TR_PHP_MYADMIN}" class="icon i_pma"></a>
					<a href="sql_change_password.php?id={USER_ID}" title="{TR_CHANGE_PASSWORD}" class="icon i_change_password"></a>
					<a href="#" onclick="action_delete('sql_delete_user.php?id={USER_ID}', '{DB_USER}')" title="{TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- EDP: user_list -->
			<!-- EDP: db_list -->
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
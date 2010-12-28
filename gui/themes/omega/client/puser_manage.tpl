<!-- INCLUDE "header.tpl" -->
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function() {
			$('#protected_user_add').click(function() {
				document.location.href = 'protected_user_add.php';
			});
			$('#protected_group_add').click(function() {
				document.location.href = 'protected_group_add.php';
			});
		}); 

		function action_delete(url, subject) {
			return confirm(sprintf("{TR_MESSAGE_DELETE}", subject));
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
			<h1 class="webtools">{TR_MENU_WEBTOOLS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="webtools.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_HTACCESS_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="users"><span>{TR_USER_MANAGE}</span></h2>
		<!-- BDP: usr_msg -->
		<div class="warning">{USER_MESSAGE}</div>
		<!-- EDP: usr_msg -->
		<table>
			<thead>
				<tr>
					<th>{TR_USERNAME}</th>
					<th>{TR_STATUS}</th>
					<th>{TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: pusres -->
				<tr>
					<td>{UNAME}</td>
					<td>{USTATUS}</td>
					<td>
						<a href="protected_user_assign.php?uname={USER_ID}" title="{TR_GROUP}" class="icon i_users"></a>
						<a href="{USER_EDIT_SCRIPT}" title="{USER_EDIT}" class="icon i_edit"></a>
						<a href="#" onclick="{USER_DELETE_SCRIPT}" title="{USER_DELETE}" class="icon i_delete"></a>
					</td>
				</tr>
				<!-- EDP: pusres -->
			</tbody>
		</table>
		<div class="buttons">
			<input type="button" name="protected_user_add" id="protected_user_add" value="{TR_ADD_USER}" />
		</div>
		<h2 class="groups"><span>{TR_GROUPS}</span></h2>
		<!-- BDP: grp_msg -->
		<div class="warning">{GROUP_MESSAGE}</div>
		<!-- EDP: grp_msg -->
		<table>
			<thead>
				<tr>
					<th>{TR_GROUPNAME}</th>
					<th>{TR_GROUP_MEMBERS}</th>
					<th>{TR_STATUS}</th>
					<th>{TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: pgroups -->
				<tr>
					<td>{GNAME}</td>
					<td><!-- BDP: group_members -->{MEMBER}<!-- EDP: group_members --></td>
					<td>{GSTATUS}</td>
					<td>
						<a href="#" onclick="{GROUP_DELETE_SCRIPT}" title="{GROUP_DELETE}" class="icon i_delete"></a>
					</td>
				</tr>
				<!-- EDP: pgroups -->
			</tbody>
		</table>
		<div class="buttons">
			<input type="button" name="protected_group_add" id="protected_group_add" value="{TR_ADD_GROUP}" />
		</div>
	</div>
<!-- INCLUDE "footer.tpl" -->
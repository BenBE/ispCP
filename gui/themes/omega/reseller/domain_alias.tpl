<!-- INCLUDE "header.tpl" -->
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function delete_account(url, name) {
				if (!confirm(sprintf("{TR_MESSAGE_DELETE}", name)))
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
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_DOMAIN_ALIAS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="users"><span>{TR_MANAGE_ALIAS}</span></h2>
		<form action="alias.php?psi={PSI}" method="post" id="reseller_alias">
			<fieldset>
				<input type="text" name="search_for" id="search_for" value="{SEARCH_FOR}" />
				<select name="search_common">
					<option value="alias_name" {M_DOMAIN_NAME_SELECTED}>{M_ALIAS_NAME}</option>
					<option value="account_name" {M_ACCOUN_NAME_SELECTED}>{M_ACCOUNT_NAME}</option>
				</select>
				<input type="hidden" name="uaction" value="go_search" />
				<input type="submit" name="Submit" value="{TR_SEARCH}" />
			</fieldset>
		</form>
		<!-- BDP: table_list -->
		<table>
			<thead>
				<tr>
					<th>{TR_NAME}</th>
					<th>{TR_REAL_DOMAIN}</th>
					<th>{TR_FORWARD}</th>
					<th>{TR_STATUS}</th>
					<th>{TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: table_item -->
				<tr>
					<td><a href="http://www.{NAME}/" class="icon i_domain">{NAME}</a><br />{ALIAS_IP}</td>
					<td>{REAL_DOMAIN}<br />{REAL_DOMAIN_MOUNT}</td>
					<td>{FORWARD}</td>
					<td>{STATUS}</td>
					<td>
						<a href="{EDIT_LINK}" title="{EDIT}" class="icon i_edit"></a>
						<a href="#" onclick="delete_account('{DELETE_LINK}', '{NAME}')" title="{DELETE}" class="icon i_delete"></a>
					</td>
				</tr>
				<!-- EDP: table_item -->
			</tbody>
		</table>
		<!-- EDP: table_list -->
		<form action="alias_add.php" method="post" id="admin_alias_add">
			<fieldset>
				<input type="submit" name="Submit"  value="{TR_ADD_ALIAS}" />
			</fieldset>
		</form>
		<div class="paginator">
			<!-- BDP: scroll_next_gray -->
			<span class="icon i_next_gray">&nbsp;</span>
			<!-- EDP: scroll_next_gray -->
			<!-- BDP: scroll_next -->
			<a href="manage_users.php?psi={NEXT_PSI}" title="next" class="icon i_next">next</a>
			<!-- EDP: scroll_next -->
			<!-- BDP: scroll_prev_gray -->
			<span class="icon i_prev_gray">&nbsp;</span>
			<!-- EDP: scroll_prev_gray -->
			<!-- BDP: scroll_prev -->
			<a href="manage_users.php?psi={PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			<!-- EDP: scroll_prev -->
		</div>
	</div>
<!-- INCLUDE "footer.tpl" -->
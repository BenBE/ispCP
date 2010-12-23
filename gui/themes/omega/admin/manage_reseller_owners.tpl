<!-- INCLUDE "header.tpl" -->
</head>
<body>
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
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="manage_users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_RESELLER_ASSIGNMENT}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="users2"><span>{TR_RESELLER_ASSIGNMENT}</span></h2>
		<form action="manage_reseller_owners.php" method="post" id="admin_reseller_assignment">
			<!-- BDP: reseller_list -->
			<table>
				<tr>
					<th>{TR_NUMBER}</th>
					<th>{TR_MARK}</th>
					<th>{TR_RESELLER_NAME}</th>
					<th>{TR_OWNER}</th>
				</tr>
				<!-- BDP: reseller_item -->
				<tr>
					<td>{NUMBER}</td>
					<td><input id="{CKB_NAME}" type="checkbox" name="{CKB_NAME}" /></td>
					<td><label for="{CKB_NAME}">{RESELLER_NAME}</label></td>
					<td>{OWNER}</td>
				</tr>
				<!-- EDP: reseller_item -->
			</table>
			<!-- EDP: reseller_list -->
			<!-- BDP: select_admin -->
			<div class="buttons">
				{TR_TO_ADMIN}
				<select name="dest_admin">
					<!-- BDP: select_admin_option -->
					<option {SELECTED} value="{VALUE}">{OPTION}</option>
					<!-- EDP: select_admin_option -->
				</select>
				<input type="hidden" name="uaction" value="reseller_owner" />
				<input type="submit" name="Submit" value="{TR_MOVE}" />
			</div>
			<!-- EDP: select_admin -->
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
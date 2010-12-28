<!-- INCLUDE "header.tpl" -->
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
			<li><a>{TR_MANAGE_USER_SESSIONS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="users2"><span>{TR_MANAGE_USER_SESSIONS}</span></h2>
		<table>
			<tr>
				<th>{TR_USERNAME}</th>
				<th>{TR_LOGIN_ON}</th>
				<th>{TR_OPTIONS}</th>
			</tr>
			<!-- BDP: user_session -->
			<tr>
				<td>{ADMIN_USERNAME}</td>
				<td>{LOGIN_TIME}</td>
				<td><a href="{KILL_LINK}" title="{TR_DELETE}" class="icon i_delete">{TR_DELETE}</a></td>
			</tr>
			<!-- EDP: user_session -->
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
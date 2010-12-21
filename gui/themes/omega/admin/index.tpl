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
			<h1 class="general">{TR_GENERAL_INFORMATION}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a>{TR_GENERAL_INFORMATION}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: msg_entry -->
		<div class="{NEW_MSG_TYPE}"><a href="ticket_system.php">{TR_NEW_MSGS}</a></div>
		<!-- EDP: msg_entry -->
		<!-- BDP: update_message -->
		<div class="{UPDATE_TYPE}">{UPDATE}</div>
		<!-- EDP: update_message -->
		<!-- BDP: database_update_message -->
		<div class="{DATABASE_MSG_TYPE}">{DATABASE_UPDATE}</div>
		<!-- EDP: database_update_message -->
		<h2 class="general"><span>{TR_GENERAL_INFORMATION}</span></h2>
		<!-- BDP: props_list -->
		<table>
			<tr>
				<td>{TR_ACCOUNT_NAME}</td>
				<td>{ACCOUNT_NAME}</td>
			</tr>
			<tr>
				<td>{TR_ADMIN_USERS}</td>
				<td>{ADMIN_USERS}</td>
			</tr>
			<tr>
				<td>{TR_RESELLER_USERS}</td>
				<td>{RESELLER_USERS}</td>
			</tr>
			<tr>
				<td>{TR_NORMAL_USERS}</td>
				<td>{NORMAL_USERS}</td>
			</tr>
			<tr>
				<td>{TR_DOMAINS}</td>
				<td>{DOMAINS}</td>
			</tr>
			<tr>
				<td>{TR_SUBDOMAINS}</td>
				<td>{SUBDOMAINS}</td>
			</tr>
			<tr>
				<td>{TR_DOMAINS_ALIASES}</td>
				<td>{DOMAINS_ALIASES}</td>
			</tr>
			<tr>
				<td>{TR_MAIL_ACCOUNTS}</td>
				<td>{MAIL_ACCOUNTS}</td>
			</tr>
			<tr>
				<td>{TR_FTP_ACCOUNTS}</td>
				<td>{FTP_ACCOUNTS}</td>
			</tr>
			<tr>
				<td>{TR_SQL_DATABASES}</td>
				<td>{SQL_DATABASES}</td>
			</tr>
			<tr>
				<td>{TR_SQL_USERS}</td>
				<td>{SQL_USERS}</td>
			</tr>
		</table>
		<!-- EDP: props_list -->
		<h2 class="traffic"><span>{TR_SERVER_TRAFFIC}</span></h2>
		<!-- BDP: traff_warn -->
		<div class="warning">{TR_TRAFFIC_WARNING}</div>
		<!-- EDP: traff_warn -->
		{TRAFFIC_WARNING}
		<div class="graph"><span style="width:{TRAFFIC_PERCENT}%">&nbsp;</span></div>
	</div>
<!-- INCLUDE "footer.tpl" -->
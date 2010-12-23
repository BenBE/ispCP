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
			<h1 class="statistics">{TR_MENU_STATISTICS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="server_statistic.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{IP_USAGE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="ip"><span>{IP_USAGE}</span></h2>
		<!-- BDP: ip_row -->
		<table>
			<tr>
				<th>{IP}</th>
			</tr>
			<tr>
				<td><b>{RECORD_COUNT}</b></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<th>{TR_DOMAIN_NAME}</th>
				<th>{TR_RESELLER_NAME}</th>
			</tr>
			<!-- BDP: domain_row -->
			<tr>
				<td>{DOMAIN_NAME}</td>
				<td>{RESELLER_NAME}</td>
			</tr>
			<!-- EDP: domain_row -->
		</table>
		<!-- EDP: ip_row -->
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
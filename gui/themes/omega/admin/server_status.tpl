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
			<h1 class="general">{TR_MENU_GENERAL_INFORMATION}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="index.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_SERVER_STATUS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="serverstatus"><span>{TR_SERVER_STATUS}</span></h2>
		<!-- BDP: props_list -->
		<table>
			<tr>
				<th>{TR_HOST}</th>
				<th>{TR_SERVICE}</th>
				<th>{TR_STATUS}</th>
			</tr>
			<!-- BDP: service_status -->
			<tr>
				<td class="{CLASS}">{HOST} (Port {PORT})</td>
				<td class="{CLASS}">{SERVICE}</td>
				<td class="{CLASS}">{STATUS}</td>
			</tr>
			<!-- EDP: service_status -->
		</table>
		<!-- EDP: props_list -->
	</div>
<!-- INCLUDE "footer.tpl" -->
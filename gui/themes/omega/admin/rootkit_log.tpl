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
			<h1 class="webtools">{TR_MENU_SYSTEM_TOOLS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="system_info.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_ROOTKIT_LOG}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="serverstatus"><span>{TR_ROOTKIT_LOG}</span></h2>
		<!-- BDP: props_list -->
		<table>
			<tr>
				<th>{FILENAME}:</th>
			</tr>
			<tr>
				<td>{LOG}</td>
			</tr>
		</table>
		<!-- EDP: props_list -->
	</div>
<!-- INCLUDE "footer.tpl" -->
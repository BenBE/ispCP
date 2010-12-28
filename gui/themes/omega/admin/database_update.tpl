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
			<h1 class="webtools">{TR_MENU_SYSTEM_TOOLS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="system_info.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_UPDATES_TITLE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: database_update_message -->
		<div class="notice">{TR_UPDATE_MESSAGE}</div>
		<!-- EDP: database_update_message -->
		<!-- BDP: props_list -->
		<!-- BDP: database_update_infos -->
		<h2 class="update"><span>{TR_UPDATES_TITLE}</span></h2>
		<form action="database_update.php" method="post" id="database_update">
			<table class="description">
				<tr>
					<th>{TR_UPDATE}</th>
					<td>{UPDATE}</td>
				</tr>
				<tr>
					<th>{TR_INFOS}</th>
					<td>{INFOS}</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="execute" id='execute' value="update" />
				<input type="submit" name="Submit" value="{TR_EXECUTE_UPDATE}" />
			</div>
		</form>
		<!-- EDP: database_update_infos -->
		<!-- EDP: props_list -->
	</div>
<!-- INCLUDE "footer.tpl" -->
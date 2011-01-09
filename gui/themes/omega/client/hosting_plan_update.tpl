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
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="index.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_UPDATE_HP}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="purchasing"><span>{TR_MENU_UPDATE_HP}</span></h2>
		<table>
			<!-- BDP: hosting_plans -->
			<tr>
			  <td>
				<strong>{HP_NAME}</strong><br />
				{HP_DESCRIPTION}<br />
				<br />
				{HP_DETAILS}<br />
				<br />
				<strong>{HP_COSTS}</strong></td>
			</tr>
			<tr>
			  <td><a href="hosting_plan_update.php?{LINK}={ID}" class="icon i_details">{TR_PURCHASE}</a></td>
			</tr>
			<!-- EDP: hosting_plans -->
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
{include file='header.tpl'}
<body>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="general">{$TR_MENU_GENERAL_INFORMATION}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="index.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_UPDATE_HP}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		{if isset($HP_NAME)}
		<h2 class="purchasing"><span>{$TR_MENU_UPDATE_HP}</span></h2>
		<table>
			{section name=i loop=$HP_NAME}
			<tr>
			  <td>
				<strong>{$HP_NAME[i]}</strong><br />
				{$HP_DESCRIPTION[i]}<br />
				<br />
				{$HP_DETAILS[i]}<br />
				<br />
				<strong>{$HP_COSTS[i]}</strong></td>
			</tr>
			<tr>
			  <td><a href="hosting_plan_update.php?{$LINK[i]}={$ID[i]}" class="icon i_details">{$TR_PURCHASE}</a></td>
			</tr>
			{/section}
		</table>
		{/if}
	</div>
{include file='footer.tpl'}
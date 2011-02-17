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
			<h1 class="webtools">{$TR_MENU_SYSTEM_TOOLS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="system_info.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_UPDATES_TITLE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="{$MSG_TYPE}"><span>{$TR_UPDATES_TITLE}</span></h2>
		<table class="description">
			<tr>
				<th>{$TR_UPDATE}</th>
				<td>{$UPDATE}</td>
			</tr>
			<!-- BDP: update_infos -->
			<tr>
				<th>{$TR_INFOS}</th>
				<td>{$INFOS}</td>
			</tr>
			<!-- EDP: update_infos -->
		</table>
		<!--
		<div class="info">
			{$UPDATE}<br />
			{$INFOS}
		</div>
		-->
	</div>
{include file='footer.tpl'}
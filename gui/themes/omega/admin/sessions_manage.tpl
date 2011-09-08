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
			<h1 class="manage_users">{$TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="manage_users.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MANAGE_USER_SESSIONS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="users2"><span>{$TR_MANAGE_USER_SESSIONS}</span></h2>
		<table>
			<tr>
				<th>{$TR_USERNAME}</th>
				<th>{$TR_LOGIN_ON}</th>
				<th>{$TR_OPTIONS}</th>
			</tr>
			{section name=i loop=$ADMIN_USERNAME}
			<tr>
				<td>{$ADMIN_USERNAME[i]}</td>
				<td>{$LOGIN_TIME[i]}</td>
				<td><a href="{$KILL_LINK[i]}" title="{$TR_DELETE}" class="icon i_delete"></a></td>
			</tr>
			{/section}
		</table>
	</div>
{include file='footer.tpl'}
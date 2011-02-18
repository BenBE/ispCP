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
			<h1 class="webtools">{$TR_MENU_WEBTOOLS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="webtools.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_ERROR_PAGES}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="errors"><span>{$TR_ERROR_PAGES}</span></h2>
		<table>
			<tr>
				<td><span class="icon_big i_error401">{$TR_ERROR_401}</span></td>
				<td><a href="error_edit.php?eid=401" title="{$TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{$DOMAIN}/errors/401.html" class="icon i_preview">{$TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error403">{$TR_ERROR_403}</span></td>
				<td><a href="error_edit.php?eid=403" title="{$TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{$DOMAIN}/errors/403.html" class="icon i_preview">{$TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error404">{$TR_ERROR_404}</span></td>
				<td><a href="error_edit.php?eid=404" title="{$TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{$DOMAIN}/errors/404.html" class="icon i_preview">{$TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error500">{$TR_ERROR_500}</span></td>
				<td><a href="error_edit.php?eid=500" title="{$TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{$DOMAIN}/errors/500.html" class="icon i_preview">{$TR_VIEW}</a></td>
			</tr>
			<tr>
				<td><span class="icon_big i_error503">{$TR_ERROR_503}</span></td>
				<td><a href="error_edit.php?eid=503" title="{$TR_EDIT}" class="icon i_edit"></a></td>
				<td><a href="{$DOMAIN}/errors/503.html" class="icon i_preview">{$TR_VIEW}</a></td>
			</tr>
		</table>
	</div>
{include file='footer.tpl'}
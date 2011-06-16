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
			<li><a>{$TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		{if isset($TR_NEW_MSGS)}
		<div class="{$NEW_MSG_TYPE}">{$TR_NEW_MSGS}</div>
		{/if}
		<h2 class="general"><span>{$TR_GENERAL_INFORMATION}</span></h2>
		<table>
			<tr>
				<td>{$TR_ACCOUNT_NAME} / {$TR_MAIN_DOMAIN}</td>
				<td>{$ACCOUNT_NAME} / {$DOMAIN_IP}</td>
			</tr>
			<tr>
				<td>{$TR_DMN_TMP_ACCESS}</td>
				<td><a href="{$DOMAIN_ALS_URL}" class="external"">{$DOMAIN_ALS_URL}</a></td>
			</tr>
			<tr>
				<td>{$TR_DOMAIN_EXPIRE}</td>
				<td>{$DMN_EXPIRES} {$DMN_EXPIRES_DATE}</td>
			</tr>
			{if isset($PHP_SUPPORT)}
			<tr>
				<td>{$TR_PHP_SUPPORT}</td>
				<td>{$PHP_SUPPORT}</td>
			</tr>
			{/if}
			{if isset($CGI_SUPPORT)}
			<tr>
				<td>{$TR_CGI_SUPPORT}</td>
				<td>{$CGI_SUPPORT}</td>
			</tr>
			{/if}
			{if isset($MYSQL_SUPPORT)}
			<tr>
				<td>{$TR_MYSQL_SUPPORT}</td>
				<td>{$MYSQL_SUPPORT}</td>
			</tr>
			{/if}
			{if isset($TR_SUBDOMAINS)}
			<tr>
				<td>{$TR_SUBDOMAINS}</td>
				<td>{$SUBDOMAINS}</td>
			</tr>
			{/if}
			{if isset($TR_DOMAIN_ALIASES)}
			<tr>
				<td>{$TR_DOMAIN_ALIASES}</td>
				<td>{$DOMAIN_ALIASES}</td>
			</tr>
			{/if}
			{if isset($TR_MAIL_ACCOUNTS)}
			<tr>
				<td>{$TR_MAIL_ACCOUNTS}</td>
				<td>{$MAIL_ACCOUNTS}</td>
			</tr>
			{/if}
			<tr>
				<td>{$TR_FTP_ACCOUNTS}</td>
				<td>{$FTP_ACCOUNTS}</td>
			</tr>
			{if isset($MYSQL_SUPPORT)}
			<tr>
				<td>{$TR_SQL_DATABASES}</td>
				<td>{$SQL_DATABASES}</td>
			</tr>
			<tr>
				<td>{$TR_SQL_USERS}</td>
				<td>{$SQL_USERS}</td>
			</tr>
			{/if}
		</table>
		<h2 class="traffic"><span>{$TR_TRAFFIC_USAGE}</span></h2>
		{if isset($TR_TRAFFIC_WARNING)}
		<div class="warning">{$TR_TRAFFIC_WARNING}</div>
		{/if}
		{$TRAFFIC_USAGE_DATA}
		<div class="graph"><span style="width:{$TRAFFIC_PERCENT}%">&nbsp;</span></div>
		<h2 class="diskusage"><span>{$TR_DISK_USAGE}</span></h2>
		{if isset($TR_DISK_WARNING)}
		<div class="warning">{$TR_DISK_WARNING}</div>
		{/if}
		{$DISK_USAGE_DATA}
		<div class="graph"><span style="width:{$DISK_PERCENT}%">&nbsp;</span></div>
	</div>
{include file='footer.tpl'}
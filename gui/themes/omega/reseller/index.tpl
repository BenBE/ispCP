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
			<h1 class="general">{$GENERAL_INFO}</h1>
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
		<h2 class="general"><span>{$GENERAL_INFO}</span></h2>
		<table>
			<tr>
				<td>{$ACCOUNT_NAME}</td>
				<td>{$RESELLER_NAME}</td>
			</tr>
			<tr>
				<td>{$DOMAINS}</td>
				<td>{$DMN_MSG}</td>
			</tr>
			<tr>
				<td>{$SUBDOMAINS}</td>
				<td>{$SUB_MSG}</td>
			</tr>
			<tr>
				<td>{$ALIASES}</td>
				<td>{$ALS_MSG}</td>
			</tr>
			<tr>
				<td>{$MAIL_ACCOUNTS}</td>
				<td>{$MAIL_MSG}</td>
			</tr>
			<tr>
				<td>{$TR_FTP_ACCOUNTS}</td>
				<td>{$FTP_MSG}</td>
			</tr>
			<tr>
				<td>{$SQL_DATABASES}</td>
				<td>{$SQL_DB_MSG}</td>
			</tr>
			<tr>
				<td>{$MAIL_ACCOUNTS}</td>
				<td>{$MAIL_MSG}</td>
			</tr>
			<tr>
				<td>{$TR_FTP_ACCOUNTS}</td>
				<td>{$FTP_MSG}</td>
			</tr>
			<tr>
				<td>{$SQL_DATABASES}</td>
				<td>{$SQL_DB_MSG}</td>
			</tr>
			<tr>
				<td>{$SQL_USERS}</td>
				<td>{$SQL_USER_MSG}</td>
			</tr>
			<tr>
				<td>{$TRAFFIC}</td>
				<td>{$TRAFF_MSG}</td>
			</tr>
			<tr>
				<td>{$DISK}</td>
				<td>{$DISK_MSG}</td>
			</tr>
		</table>
		{if isset($TR_TRAFFIC_WARNING)}
		<div class="warning">{$TR_TRAFFIC_WARNING}</div>
		{/if}
		<h2 class="traffic"><span>{$TR_TRAFFIC_USAGE}</span></h2>
		{$TRAFFIC_USAGE_DATA}
		<div class="graph"><span style="width:{$TRAFFIC_PERCENT}%">&nbsp;</span></div>
		{if isset($TR_TRAFFIC_WARNING)}
		<div class="warning">{$TR_DISK_WARNING}</div>
		{/if}
		<h2 class="diskusage"><span>{$TR_DISK_USAGE}</span></h2>
		{$DISK_USAGE_DATA}
		<div class="graph"><span style="width:{$DISK_PERCENT}%">&nbsp;</span></div>
	</div>
{include file='footer.tpl'}
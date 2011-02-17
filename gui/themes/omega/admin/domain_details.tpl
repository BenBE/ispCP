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
			<li><a>{$TR_DOMAIN_DETAILS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="general"><span>{$TR_DOMAIN_DETAILS}</span></h2>
		<table>
			<tr>
				<td>{$TR_DOMAIN_NAME}</td>
				<td>{$VL_DOMAIN_NAME}</td>
			</tr>
			<tr>
				<td>{$TR_DOMAIN_IP}</td>
				<td>{$VL_DOMAIN_IP}</td>
			</tr>
			<tr>
				<td>{$TR_STATUS}</td>
				<td>{$VL_STATUS}</td>
			</tr>
			<tr>
				<td>{$TR_PHP_SUPP}</td>
				<td>{$VL_PHP_SUPP}</td>
			</tr>
			<tr>
				<td>{$TR_CGI_SUPP}</td>
				<td>{$VL_CGI_SUPP}</td>
			</tr>
			<tr>
				<td>{$TR_BACKUP_SUPPORT}</td>
				<td>{$VL_BACKUP_SUPPORT}</td>
			</tr>
			<tr>
				<td>{$TR_DNS_SUPP}</td>
				<td>{$VL_DNS_SUPP}</td>
			</tr>
			<tr>
				<td>{$TR_MYSQL_SUPP}</td>
				<td>{$VL_MYSQL_SUPP}</td>
			</tr>
			<tr>
				<td>{$TR_TRAFFIC}</td>
				<td>
					<div class="graph"><span style="width:{$VL_TRAFFIC_PERCENT}%">&nbsp;</span></div>
					{$VL_TRAFFIC_USED} / {$VL_TRAFFIC_LIMIT}
				</td>
			</tr>
			<tr>
				<td>{$TR_DISK}</td>
				<td>
					<div class="graph"><span style="width:{$VL_DISK_PERCENT}%">&nbsp;</span></div>
					{$VL_DISK_USED} / {$VL_DISK_LIMIT}
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<th>{$TR_FEATURE}</th>
				<th>{$TR_USED}</th>
				<th>{$TR_LIMIT}</th>
			</tr>
			<tr>
				<td>{$TR_MAIL_ACCOUNTS}</td>
				<td>{$VL_MAIL_ACCOUNTS_USED}</td>
				<td>{$VL_MAIL_ACCOUNTS_LIIT}</td>
			</tr>
			<tr>
				<td>{$TR_FTP_ACCOUNTS}</td>
				<td>{$VL_FTP_ACCOUNTS_USED}</td>
				<td>{$VL_FTP_ACCOUNTS_LIIT}</td>
			</tr>
			<tr>
				<td>{$TR_SQL_DB_ACCOUNTS}</td>
				<td>{$VL_SQL_DB_ACCOUNTS_USED}</td>
				<td>{$VL_SQL_DB_ACCOUNTS_LIIT}</td>
			</tr>
			<tr>
				<td>{$TR_SQL_USER_ACCOUNTS}</td>
				<td>{$VL_SQL_USER_ACCOUNTS_USED}</td>
				<td>{$VL_SQL_USER_ACCOUNTS_LIIT}</td>
			</tr>
			<tr>
				<td>{$TR_SUBDOM_ACCOUNTS}</td>
				<td>{$VL_SUBDOM_ACCOUNTS_USED}</td>
				<td>{$VL_SUBDOM_ACCOUNTS_LIIT}</td>
			</tr>
			<tr>
				<td>{$TR_DOMALIAS_ACCOUNTS}</td>
				<td>{$VL_DOMALIAS_ACCOUNTS_USED}</td>
				<td>{$VL_DOMALIAS_ACCOUNTS_LIIT}</td>
			</tr>
		</table>
		<form action="manage_users.php" method="post" id="admin_manage_users">
			<div class="buttons">
				<input type="submit" name="Submit"  value="  {$TR_BACK}  " />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
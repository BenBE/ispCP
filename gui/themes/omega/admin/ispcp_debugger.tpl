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
			<li><a>{$TR_DEBUGGER_TITLE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="debugger"><span>{$TR_DEBUGGER_TITLE}</span></h2>
		<table>
			<tr>
				<td><b>{$TR_DOMAIN_ERRORS}</b></td>
			</tr>
			<!-- BDP: domain_message -->
			<tr>
				<td>{$TR_DOMAIN_MESSAGE}</td>
			</tr>
			<!-- EDP: domain_message -->
			{if isset($TRAFF_PERCENT)}
			<tr>
				<td>&nbsp;</td>
				<td>
					{$TR_DOMAIN_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={$CHANGE_ID}&amp;type={$CHANGE_TYPE}" class="link">{$TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{$TR_DOMAIN_ERROR}</span>
				</td>
			</tr>
			{/if}
		</table>
		<br />
		<table>
			<tr>
				<td><b>{$TR_ALIAS_ERRORS}</b></td>
			</tr>
			<!-- BDP: alias_message -->
			<tr>
				<td>{$TR_ALIAS_MESSAGE}</td>
			</tr>
			<!-- EDP: alias_message -->
			<!-- BDP: alias_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{$TR_ALIAS_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={$CHANGE_ID}&amp;type={$CHANGE_TYPE}" class="link">{$TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{$TR_ALIAS_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: alias_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{$TR_SUBDOMAIN_ERRORS}</b></td>
			</tr>
			<!-- BDP: subdomain_message -->
			<tr>
				<td>{$TR_SUBDOMAIN_MESSAGE}</td>
			</tr>
			<!-- EDP: subdomain_message -->
			<!-- BDP: subdomain_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{$TR_SUBDOMAIN_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={$CHANGE_ID}&amp;type={$CHANGE_TYPE}" class="link">{$TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{$TR_SUBDOMAIN_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: subdomain_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{$TR_SUBDOMAIN_ALIAS_ERRORS}</b></td>
			</tr>
			<!-- BDP: subdomain_alias_message -->
			<tr>
				<td>{$TR_SUBDOMAIN_ALIAS_MESSAGE}</td>
			</tr>
			<!-- EDP: subdomain_alias_message -->
			<!-- BDP: subdomain_alias_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{$TR_SUBDOMAIN_ALIAS_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={$CHANGE_ID}&amp;type={$CHANGE_TYPE}" class="link">{$TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{$TR_SUBDOMAIN_ALIAS_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: subdomain_alias_list -->
		</table>
		<br />
		<table>
			<tr>
				<td class="content3"><b>{$TR_MAIL_ERRORS}</b></td>
			</tr>
			{if isset($MAIL_MSG)}
			<tr>
				<td>{$TR_MAIL_MESSAGE}</td>
			</tr>
			{/if}
			<!-- BDP: mail_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{$TR_MAIL_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={$CHANGE_ID}&amp;type={$CHANGE_TYPE}" class="link">{$TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{$TR_MAIL_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: mail_list -->
		</table>
		<br />
		<table>
			<tr>
				<td class="content3"><b>{$TR_HTACCESS_ERRORS}</b></td>
			</tr>
			<!-- BDP: htaccess_message -->
			<tr>
				<td>{$TR_HTACCESS_MESSAGE}</td>
			</tr>
			<!-- EDP: htaccess_message -->
			<!-- BDP: htaccess_list -->
			<tr>
				<td>&nbsp;</td>
				<td>
					{$TR_HTACCESS_NAME} - <a href="ispcp_debugger.php?action=change_status&amp;id={$CHANGE_ID}&amp;type={$CHANGE_TYPE}" class="link">{$TR_CHANGE_STATUS}</a><br />
					<span style="color:red;">{$TR_HTACCESS_ERROR}</span>
				</td>
			</tr>
			<!-- EDP: htaccess_list -->
		</table>
		<br />
		<table>
			<tr>
				<td><b>{$TR_DAEMON_TOOLS}</b></td>
			</tr>
			<tr>
				<td><a href="ispcp_debugger.php?action=run_engine" class="link">{$EXEC_COUNT} {$TR_EXEC_REQUESTS}</a></td>
			</tr>
			<tr>
				<td>{$TR_ERRORS}</td>
			</tr>
		</table>
	</div>
{include file='footer.tpl'}
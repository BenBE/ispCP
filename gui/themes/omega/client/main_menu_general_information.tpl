<div class="main_menu">
	<ul class="icons">
		<li><a href="index.php" title="{$TR_MENU_GENERAL_INFORMATION}"><span class="general icon_link">&nbsp;</span></a></li>
		{if isset($ISACTIVE_DOMAIN)}
		<li><a href="domains_manage.php" title="{$TR_MENU_MANAGE_DOMAINS}"><span class="domains icon_link">&nbsp;</span></a></li>
		{/if}
		{if isset($ISACTIVE_EMAIL)}
		<li><a href="mail_accounts.php" title="{$TR_MENU_EMAIL_ACCOUNTS}"><span class="email icon_link">&nbsp;</span></a></li>
		{/if}
		{if isset($ISACTIVE_FTP)}
		<li><a href="ftp_accounts.php" title="{$TR_MENU_FTP_ACCOUNTS}"><span class="ftp icon_link">&nbsp;</span></a></li>
		{/if}
		{if isset($ISACTIVE_SQL)}
		<li><a href="sql_manage.php" title="{$TR_MENU_MANAGE_SQL}"><span class="database icon_link">&nbsp;</span></a></li>
		{/if}
		<li><a href="webtools.php" title="{$TR_MENU_WEBTOOLS}"><span class="webtools icon_link">&nbsp;</span></a></li>
		<li><a href="domain_statistics.php" title="{$TR_MENU_DOMAIN_STATISTICS}"><span class="statistics icon_link">&nbsp;</span></a></li>
		<li><a href="{$SUPPORT_SYSTEM_PATH}" title="{$TR_MENU_QUESTIONS_AND_COMMENTS}"><span class="support icon_link">&nbsp;</span></a></li>
		{if isset($CUSTOM_BUTTONS)}
			{section name=i loop=$BUTTON_NAME}
			<li><a href="{$BUTTON_LINK[i]}" {$BUTTON_TARGET[i]} title="{$BUTTON_NAME[i]}"><span class="custom_link icon_link">&nbsp;</span></a></li>
			{/section}
		{/if}
	</ul>
</div>

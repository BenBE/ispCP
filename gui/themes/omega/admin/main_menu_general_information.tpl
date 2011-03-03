<div class="main_menu">
	<ul class="icons">
		<li><a href="index.php" title="{$TR_MENU_GENERAL_INFORMATION}"><span class="general icon_link">&nbsp;</span></a></li>
		<li><a href="manage_users.php" title="{$TR_MENU_MANAGE_USERS}"><span class="manage_users icon_link">&nbsp;</span></a></li>
		{if isset($HOSTING_PLANS)}
		<li><a href="hosting_plan.php" title="{$TR_MENU_HOSTING_PLANS}"><span class="hosting_plans icon_link">&nbsp;</span></a></li>
		{/if}
		<li><a href="system_info.php" title="{$TR_MENU_SYSTEM_TOOLS}"><span class="webtools icon_link">&nbsp;</span></a></li>
		<li><a href="server_statistic.php" title="{$TR_MENU_STATISTICS}"><span class="statistics icon_link">&nbsp;</span></a></li>
		{if isset($SUPPORT_SYSTEM)}
		<li><a href="{$SUPPORT_SYSTEM_PATH}" title="{$TR_MENU_SUPPORT_SYSTEM}"><span class="support icon_link">&nbsp;</span></a></li>
		{/if}
		<li><a href="settings.php" title="{$TR_MENU_SETTINGS}"><span class="settings icon_link">&nbsp;</span></a></li>
		{if isset($CUSTOM_BUTTONS)}
			{section name=i loop=$BUTTON_NAME}
			<li><a href="{$BUTTON_LINK[i]}" {$BUTTON_TARGET[i]} title="{$BUTTON_NAME[i]}"><span class="custom_link icon_link">&nbsp;</span></a></li>
			{/section}
		{/if}
    </ul>
</div>

<div class="main_menu">
	<ul class="icons">
		<li><a href="index.php" title="{$TR_MENU_GENERAL_INFORMATION}"><span class="general icon_link">&nbsp;</span></a></li>
		<li><a href="users.php" title="{$TR_MENU_MANAGE_USERS}"><span class="manage_users icon_link">&nbsp;</span></a></li>
		<!-- BDP: hosting_plans -->
		<li><a href="hosting_plan.php" title="{$TR_MENU_HOSTING_PLANS}"><span class="hosting_plans icon_link">&nbsp;</span></a></li>
		<!-- EDP: hosting_plans -->
		<li><a href="orders.php" title="{$TR_MENU_ORDERS}"><span class="purchasing icon_link">&nbsp;</span></a></li>
		<li><a href="user_statistics.php" title="{$TR_MENU_DOMAIN_STATISTICS}"><span class="statistics icon_link">&nbsp;</span></a></li>
		<!-- BDP: isactive_support -->
		<li><a href="ticket_system.php" title="{$TR_MENU_QUESTIONS_AND_COMMENTS}"><span class="support icon_link">&nbsp;</span></a></li>
		<!-- EDP: isactive_support -->
		{if isset($BUTTON_NAME)}
		<li><a href="{$BUTTON_LINK}" {$BUTTON_TARGET} title="{$BUTTON_NAME}"><span class="custom_link icon_link">&nbsp;</span></a></li>
		{/if}
	</ul>
</div>

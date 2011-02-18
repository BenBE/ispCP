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
			<h1 class="purchasing">{$TR_MENU_ORDERS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="orders.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_ORDER_SETTINGS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
   		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
	   	{/if}
		<h2 class="tools"><span>{$TR_MENU_ORDER_SETTINGS}</span></h2>
		 <form action="order_settings.php" method="post" id="reseller_order_settings">
		 	<fieldset>
		 		<legend>{$TR_IMPLEMENT_INFO}</legend>
		 		<p>{$TR_IMPLEMENT_URL}</p>
		 	</fieldset>
		 	<fieldset>
		 		<legend>{$TR_HEADER}</legend>
		 		<textarea name="header" id="header" cols="80" rows="15"><!-- BDP: purchase_header --><!-- EDP: purchase_header --></textarea>
		 	</fieldset>
		 	<fieldset>
		 		<legend>{$TR_FOOTER}</legend>
		 		<textarea name="footer" id="footer" cols="80" rows="15"><!-- BDP: purchase_footer --><!-- EDP: purchase_footer --></textarea>
		 	</fieldset>
		 	<div class="buttons">
		 		<input type="submit" name="Submit" value="{$TR_APPLY_CHANGES}" />
		 		<input type="button" name="Button" onclick="window.open('/orderpanel/', 'preview', 'width=770,height=480')" value="{$TR_PREVIEW}" />
		 	</div>
		 </form>
	</div>
{include file='footer.tpl'}
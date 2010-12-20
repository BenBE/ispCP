<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_RESELLER_MAIN_INDEX_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_RESELLER_MAIN_INDEX_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
</head>
<body>
	<div class="header">
		{MAIN_MENU}
		<div class="logo">
			<img src="{THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="purchasing">{TR_MENU_ORDERS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="orders.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_ORDER_SETTINGS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
   		<div class="{MSG_TYPE}">{MESSAGE}</div>
	   	<!-- EDP: page_message -->
		<h2 class="tools"><span>{TR_MENU_ORDER_SETTINGS}</span></h2>
		 <form action="order_settings.php" method="post" id="reseller_order_settings">
		 	<fieldset>
		 		<legend>{TR_IMPLEMENT_INFO}</legend>
		 		<p>{TR_IMPLEMENT_URL}</p>
		 	</fieldset>
		 	<fieldset>
		 		<legend>{TR_HEADER}</legend>
		 		<textarea name="header" id="header" cols="80" rows="15"><!-- BDP: purchase_header --><!-- EDP: purchase_header --></textarea>
		 	</fieldset>
		 	<fieldset>
		 		<legend>{TR_FOOTER}</legend>
		 		<textarea name="footer" id="footer" cols="80" rows="15"><!-- BDP: purchase_footer --><!-- EDP: purchase_footer --></textarea>
		 	</fieldset>
		 	<div class="buttons">
		 		<input type="submit" name="Submit" value="{TR_APPLY_CHANGES}" />
		 		<input type="button" name="Button" onclick="window.open('/orderpanel/', 'preview', 'width=770,height=480')" value="{TR_PREVIEW}" />
		 	</div>
		 </form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
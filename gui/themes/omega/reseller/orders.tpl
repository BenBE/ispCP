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
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) {
			if (!confirm(sprintf("{TR_MESSAGE_DELETE_ACCOUNT}", domain)))
				return false;
			location = url;
		}
	/* ]]> */
	</script>
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
			<li><a>{TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: props_list -->
		<h2 class="billing"><span>{TR_MANAGE_ORDERS}</span></h2>
		<!-- BDP: orders_table -->
		<table>
			<tr>
				<th>{TR_ID}</th>
				<th>{TR_DOMAIN}</th>
				<th>{TR_HP}</th>
				<th>{TR_USER}</th>
				<th>{TR_STATUS}</th>
				<th>{TR_ACTION}</th>
			</tr>
			<!-- BDP: order -->
			<tr>
				<td>{ID}</td>
				<td>{DOMAIN}</td>
				<td>{HP}</td>
				<td>{USER}</td>
				<td>{STATUS}</td>
				<td>
					<a href="{LINK}" title="{TR_ADD}" class="icon i_add_user"></a>
					<a href="#" onclick="delete_order('orders_delete.php?order_id={ID}', '{DOMAIN}')" title="{TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- EDP: order -->
		</table>
		<!-- EDP: orders_table -->
		<div class="paginator">
			<!-- BDP: scroll_next_gray -->
			<span class="icon i_next_gray">&nbsp;</span>
			<!-- EDP: scroll_next_gray -->
			<!-- BDP: scroll_next -->
			<a href="orders.php?psi={NEXT_PSI}" title="next" class="icon i_next">next</a>
			<!-- EDP: scroll_next -->
			<!-- BDP: scroll_prev_gray -->
			<span class="icon i_prev_gray">&nbsp;</span>
			<!-- EDP: scroll_prev_gray -->
			<!-- BDP: scroll_prev -->
			<a href="orders.php?psi={PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			<!-- EDP: scroll_prev -->
		</div>
		<!-- EDP: props_list -->
	</div>
<!-- INCLUDE "footer.tpl" -->
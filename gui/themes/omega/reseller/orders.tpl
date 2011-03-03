{include file='header.tpl'}
<body>
	{literal}
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE_ACCOUNT}", domain)))
				return false;
			location = url;
		}
	/* ]]> */
	</script>
	{/literal}
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
			<li><a>{$TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="billing"><span>{$TR_MANAGE_ORDERS}</span></h2>
		{if isset($ID)}
		<table>
			<tr>
				<th>{$TR_ID}</th>
				<th>{$TR_DOMAIN}</th>
				<th>{$TR_HP}</th>
				<th>{$TR_USER}</th>
				<th>{$TR_STATUS}</th>
				<th>{$TR_ACTION}</th>
			</tr>
			<!-- BDP: order -->
			<tr>
				<td>{$ID}</td>
				<td>{$DOMAIN}</td>
				<td>{$HP}</td>
				<td>{$USER}</td>
				<td>{$STATUS}</td>
				<td>
					<a href="{$LINK}" title="{$TR_ADD}" class="icon i_add_user"></a>
					<a href="#" onclick="delete_order('orders_delete.php?order_id={$ID}', '{$DOMAIN}')" title="{$TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- EDP: order -->
		</table>
		{/if}
		<div class="paginator">
			{if !isset($SCROLL_NEXT_GRAY)}
			<span class="icon i_next_gray">&nbsp;</span>
			{/if}
			{if !isset($SCROLL_NEXT)}
			<a href="orders.php?psi={$NEXT_PSI}" title="next" class="icon i_next">next</a>
			{/if}
			{if !isset($SCROLL_PREV_GRAY)}
			<span class="icon i_prev_gray">&nbsp;</span>
			{/if}
			{if !isset($SCROLL_PREV)}
			<a href="orders.php?psi={$PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			{/if}
		</div>
	</div>
{include file='footer.tpl'}
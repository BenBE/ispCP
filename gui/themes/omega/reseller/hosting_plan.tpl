{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", subject)))
				return false;
			location = url;
		}
	/* ]]> */
	</script>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="hosting_plans">{$TR_MENU_HOSTING_PLANS}</h1>
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
		{if isset($PLAN_NAME)}
		<h2 class="serverstatus"><span>{$TR_HOSTING_PLANS}</span></h2>
		<table>
			<tr>
				<th>{$TR_NOM}</th>
				<th>{$TR_PLAN_NAME}</th>
				<th>{$TR_PURCHASING}</th>
				<th>{$TR_ACTION}</th>
			</tr>
			<!-- BDP: hp_entry -->
			<tr>
				<td>{$PLAN_NOM}</td>
				<td><a href="../orderpanel/package_info.php?coid={$CUSTOM_ORDERPANEL_ID}&amp;user_id={$RESELLER_ID}&amp;id={$HP_ID}" title="{$PLAN_SHOW}">{$PLAN_NAME}</a></td>
				<td>{$PURCHASING}</td>
				<td>
					<a href="hosting_plan_edit.php?hpid={$HP_ID}" title="{$TR_EDIT}" class="icon i_edit"></a>
					<!-- BDP: hp_delete -->
					<a href="#" onclick="return action_delete('hosting_plan_delete.php?hpid={$HP_ID}', '{$PLAN_NAME2}')" title="{$PLAN_ACTION}" class="icon i_delete"></a>
					<!-- EDP: hp_delete -->
				</td>
			</tr>
			<!-- EDP: hp_entry -->
		</table>
		{/if}
	</div>
{include file='footer.tpl'}
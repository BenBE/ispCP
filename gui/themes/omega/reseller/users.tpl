{include file='header.tpl'}
<body>
	{literal}
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Target - begin
			$('a.i_goto').attr('rel', 'external').attr('target', '_blank');
			// Target - end

			// TableSorter - begin
			$('.tablesorter').tablesorter({cssHeader: 'tablesorter'});
			// TableSorter - end
		});

		function change_status(dom_id, dmn_name) {
			if (!confirm(sprintf("Are you sure you want to change the status of %s?", dmn_name)))
				return false;
				location = ("domain_status_change.php?domain_id=" + dom_id);
		}

		function action_delete(url, dmn_name) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE_ACCOUNT}", dmn_name)))
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
			<h1 class="manage_users">{$TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			<!-- <li><a class="help" href="#">Help</a></li> -->
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{$TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="users"><span>{$TR_MANAGE_USERS}</span></h2>
		<form action="users.php" method="post" id="reseller_users">
			<fieldset>
				<a href="#" onclick="return sbmt_details(document.forms[0],'{$SHOW_DETAILS}');" class="icon i_show_alias">{$TR_VIEW_DETAILS}</a>
				<input type="text" name="search_for" id="search_for" value="{$SEARCH_FOR}" />
				<select name="search_common">
					<option value="domain_name" {$M_DOMAIN_NAME_SELECTED}>{$M_DOMAIN_NAME}</option>
					<option value="customer_id" {$M_CUSTOMER_ID_SELECTED}>{$M_CUSTOMER_ID}</option>
					<option value="lname" {$M_LAST_NAME_SELECTED}>{$M_LAST_NAME}</option>
					<option value="firm" {$M_COMPANY_SELECTED}>{$M_COMPANY}</option>
					<option value="city" {$M_CITY_SELECTED}>{$M_CITY}</option>
					<option value="country" {$M_COUNTRY_SELECTED}>{$M_COUNTRY}</option>
				</select>
				<select name="search_status">
					<option value="all" {$M_ALL_SELECTED}>{$M_ALL}</option>
					<option value="ok" {$M_OK_SELECTED}>{$M_OK}</option>
					<option value="disabled" {$M_SUSPENDED_SELECTED}>{$M_SUSPENDED}</option>
				</select>
				<input type="hidden" name="details" value="" />
				<input type="hidden" name="uaction" value="go_search" />
				<input type="submit" name="Submit" value="{$TR_SEARCH}" />
			</fieldset>
		</form>
		{if isset($NAME)}
		<table class="tablesorter">
			<thead>
				<tr>
					<th style="width:50px">{$TR_USER_STATUS}</th>
					<th>{$TR_USERNAME}</th>
					<th style="width:100px">{$TR_CREATION_DATE}</th>
					<th>{$TR_DISK_USAGE}</th>
					<th style="width:200px">{$TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: user_entry -->
				<tr>
					<td><a href="#" onclick="change_status('{$URL_CHANGE_STATUS}', '{$NAME}')" title="{$STATUS_ICON}" class="icon i_{$STATUS_ICON}"></a></td>
					<td><a href="http://{$NAME}/" class="icon i_goto">{$NAME}</a></td>
					<td>{$CREATION_DATE}</td>
					<td>{$DISK_USAGE}</td>
					<td>
						<a href="domain_details.php?domain_id={$DOMAIN_ID}" title="{$TR_DETAILS}" class="icon i_identity"></a>
						{if !isset($EDIT_OPTION)}
						<a href="domain_edit.php?edit_id={$DOMAIN_ID}" title="{$TR_EDIT_DOMAIN}" class="icon i_domain" ></a>
						<a href="user_edit.php?edit_id={$USER_ID}" title="{$TR_EDIT_USER}" class="icon i_edit"></a>
						{/if}
						<a href="domain_statistics.php?month={$VL_MONTH}&amp;year={$VL_YEAR}&amp;domain_id={$DOMAIN_ID}" title="{$TR_STAT}" class="icon i_stats"></a>
						<a href="change_user_interface.php?to_id={$USER_ID}" title="{$CHANGE_INTERFACE}" class="icon i_details"></a>
						<!-- BDP: usr_delete_show -->
						<!-- EDP: usr_delete_show -->
						<!-- BDP: usr_delete_link -->
						<a href="domain_delete.php?domain_id={$DOMAIN_ID}" title="{$ACTION}" class="icon i_delete"></a>
						<!-- EDP: usr_delete_link -->
					</td>
				</tr>
				{if isset($ALIAS_DOMAIN)}
				<tr>
					<td style="width:50px">&nbsp;</td>
					<td colspan="4"><a href="http://www.{$ALIAS_DOMAIN}/" class="icon i_goto">{$ALIAS_DOMAIN}</a></td>
				</tr>
				{/if}
				<!-- EDP: user_entry -->
			</tbody>
		</table>
		{/if}
		<div class="paginator">
			{if !isset($SCROLL_NEXT_GRAY)}
			<span class="icon i_next_gray">&nbsp;</span>
			{/if}
			{if !isset($SCROLL_NEXT)}
			<a class="icon i_next" href="manage_users.php?psi={$NEXT_PSI}" title="next">next</a>
			{/if}
			{if !isset($SCROLL_PREV_GRAY)}
			<span class="icon i_prev_gray">&nbsp;</span>
			{/if}
			{if !isset($SCROLL_PREV)}
			<a class="icon i_prev" href="manage_users.php?psi={$PREV_PSI}" title="previous">previous</a>
			{/if}
		</div>
	</div>
{include file='footer.tpl'}

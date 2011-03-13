{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		jQuery(document).ready(function(){
			// Target - begin
			jQuery('#phpMyAdmin').attr('rel', 'external').attr('target', '_blank');
			// Target - end
		});

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
			<h1 class="database">{$TR_MENU_MANAGE_SQL}</h1>
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
		{if isset($DB_NAME)}
		<h2 class="sql"><span>{$TR_MANAGE_SQL}</span></h2>
		<table>
			<tr>
				<th>{$TR_DATABASE}</th>
				<th>{$TR_ACTION}</th>
			</tr>
			{section name=i loop=$DB_NAME}
			<tr>
				<td><span class="icon i_database_small">&nbsp;</span> {$DB_NAME[i]}</td>
				<td>
					<a href="sql_user_add.php?id={$DB_ID[i]}" title="{$TR_ADD_USER}" class="icon i_add_user"></a>
					<a href="#" onclick="action_delete('sql_database_delete.php?id={$DB_ID[i]}', '{$DB_NAME[i]}')" title="{$TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			{if $DB_MSG[i]}
			<tr>
				<td colspan="2">{$DB_MSG[i]}</td>
			</tr>
			{/if}
			{section name=user loop=$DB_USERLIST[i]}
			<tr>
				<td><span class="icon i_users">&nbsp;</span> {$DB_USERLIST[i][user].DB_USER}</td>
				<td>
					<a href="pma_auth.php?id={$DB_USERLIST[i][user].USER_ID}" id="phpMyAdmin" title="{$TR_PHP_MYADMIN}" class="icon i_pma"></a>
					<a href="sql_change_password.php?id={$DB_USERLIST[i][user].USER_ID}" title="{$TR_CHANGE_PASSWORD}" class="icon i_change_password"></a>
					<a href="#" onclick="action_delete('sql_delete_user.php?id={$DB_USERLIST[i][user].USER_ID}', '{$DB_USERLIST[i][user].DB_USER}')" title="{$TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			{/section}
			{/section}
		</table>
		{/if}
	</div>
{include file='footer.tpl'}
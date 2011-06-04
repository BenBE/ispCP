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
			<h1 class="database">{$TR_MENU_MANAGE_SQL}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="sql_manage.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_ADD_SQL_DATABASE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="sql"><span>{$TR_ADD_DATABASE}</span></h2>
		<form action="sql_database_add.php" method="post" id="client_sql_database_add">
			<table>
				<tr>
					<td>{$TR_DB_NAME}</td>
					<td><input type="text" name="db_name" id="db_name" value="{$DB_NAME}" /></td>
				</tr>
				<tr>
					<td>
						{if isset($MYSQL_PREFIX_YES)}
						<input type="checkbox" name="use_dmn_id" {$USE_DMN_ID} />
						{/if}
						{if isset($MYSQL_PREFIX_NO)}
						<input type="hidden" name="use_dmn_id" value="on" />
						{/if}
						{$TR_USE_DMN_ID}
					</td>
					<td>
						{if isset($MYSQL_PREFIX_ALL)}
						<input type="radio" name="id_pos" value="start" {$START_ID_POS_CHECKED} />&nbsp;{$TR_START_ID_POS}<br />
					   	<input type="radio" name="id_pos" value="end" {$END_ID_POS_CHECKED} />&nbsp;{$TR_END_ID_POS}
						{/if}
						{if isset($MYSQL_PREFIX_INFRONT)}
						<input type="hidden" name="id_pos" value="start" checked="checked" />{$TR_START_ID_POS}
						{/if}
						{if isset($MYSQL_PREFIX_BEHIND)}
						<input type="hidden" name="id_pos" value="end" checked="checked" />{$TR_END_ID_POS}
						{/if}
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_db" />
				<input type="submit"  name="Add_New" value="{$TR_ADD}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
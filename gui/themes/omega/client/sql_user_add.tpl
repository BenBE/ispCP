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
			<li><a>{$TR_ADD_SQL_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="sql"><span>{$TR_ADD_SQL_USER}</span></h2>
		<form action="sql_user_add.php" method="post" id="client_sql_user_add">
			{if isset($SHOW_SQLUSER_LIST)}
			<fieldset>
				<legend>{$TR_ADD_EXIST}</legend>
				<table>
					<tr>
						<td>{$TR_SQL_USER_NAME}</td>
						<td>
							<select name="sqluser_id" id="sqluser_id">
								{section name=i loop=$SQLUSER_ID}
								<option value="{$SQLUSER_ID[i]}" {$SQLUSER_SELECTED[i]}>{$SQLUSER_NAME[i]}</option>
								{/section}
							</select>
						</td>
					</tr>
				</table>
				<div class="buttons">
					<input type="hidden" name="id" value="{$ID}" />
					<input type="hidden" name="uaction" value="add_user" />
					<input name="Add_Exist" type="submit" id="Add_Exist" value="{$TR_ADD_EXIST}" />
				</div>
			</fieldset>
			{/if}
			{if isset($CREATE_SQLUSER)}
			<fieldset>
				<legend>{$TR_ADD_SQL_USER}</legend>
				<table>
					<tr>
						<td>{$TR_USER_NAME}</td>
						<td><input type="text" id="user_name" name="user_name" value="{$USER_NAME}" /></td>
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
							<input type="hidden" name="id_pos" value="start" checked="checked" />&nbsp;{$TR_START_ID_POS}
							{/if}
							{if isset($MYSQL_PREFIX_BEHIND)}
							<input type="hidden" name="id_pos" value="end" checked="checked" />&nbsp;{$TR_END_ID_POS}
							{/if}
						</td>
					</tr>
					<tr>
						<td>{$TR_PASS}</td>
						<td><input type="password" name="pass" id="pass" value="" /></td>
					</tr>
					<tr>
						<td>{$TR_PASS_REP}</td>
						<td><input type="password" name="pass_rep" id="pass_rep" value="" /></td>
					</tr>
				</table>
				<div class="buttons">
					<input type="hidden" name="id" value="{$ID}" />
					<input type="hidden" name="uaction" value="add_user" />
					<input type="submit" name="Submit" value="{$TR_ADD}" />
				</div>
			</fieldset>
			{/if}
		</form>
	</div>
{include file='footer.tpl'}
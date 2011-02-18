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
			<li><a>{$TR_CHANGE_SQL_USER_PASSWORD}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="password"><span>{$TR_CHANGE_SQL_USER_PASSWORD}</span></h2>
		<form action="sql_change_password.php" method="post" id="client_sql_change_password">
			<table>
				<tr>
					<td>{$TR_USER_NAME}</td>
					<td><input id="user_name" type="text" name="user_name" value="{$USER_NAME}" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>{$TR_PASS}</td>
					<td><input id="pass" type="password" name="pass" value="" /></td>
				</tr>
				<tr>
					<td>{$TR_PASS_REP}</td>
					<td><input id="pass_rep" type="password" name="pass_rep" value="" /></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="id" value="{$ID}" />
				<input type="hidden" name="uaction" value="change_pass" />
				<input type="submit" name="Submit" value="{$TR_CHANGE}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
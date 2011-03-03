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
			<h1 class="webtools">{$TR_MENU_WEBTOOLS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="webtools.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a href="protected_user_manage.php">{$TR_HTACCESS_USER}</a></li>
			<li><a>{$TR_ADD_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="users"><span>{$TR_ADD_USER}</span></h2>
		<form action="protected_user_add.php" method="post" id="client_protected_user_add">
			<table>
				<tr>
					<td>{$TR_USERNAME}</td>
					<td><input type="text" name="username" id="username" value="" /></td>
				</tr>
				<tr>
					<td>{$TR_PASSWORD}</td>
					<td><input type="password" id="pass" name="pass" value="" /></td>
				</tr>
				<tr>
					<td>{$TR_PASSWORD_REPEAT}</td>
					<td><input type="password" id="pass_rep" name="pass_rep" value="" /></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_user" />
				<input type="submit" name="Submit" value="{$TR_ADD_USER}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
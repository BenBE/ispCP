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
			<li>{$TR_ADD_GROUP}</li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="users"><span>{$TR_ADD_GROUP}</span></h2>
		<form action="protected_group_add.php" method="post" id="client_protected_group_add">
			<table>
				<tr>
					<td>{$TR_GROUPNAME}</td>
					<td><input type="text" name="groupname" id="groupname" value="" /></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_group" />
				<input type="submit" name="Submit" value="{$TR_ADD_GROUP}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
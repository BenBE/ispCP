<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_MANAGE_RESELLER_USERS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_MANAGE_RESELLER_USERS_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
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
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="manage_users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_USER_ASSIGNMENT}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="users2"><span>{TR_USER_ASSIGNMENT}</span></h2>
		<form action="manage_reseller_users.php" method="post" id="admin_user_assignment">
			<!-- BDP: src_reseller -->
			<div class="buttons">
				{TR_FROM_RESELLER}
				<select name="src_reseller" onchange="return sbmt(document.forms[0],'change_src');">
					<!-- BDP: src_reseller_option -->
					<option {SRC_RSL_SELECTED} value="{SRC_RSL_VALUE}">{SRC_RSL_OPTION}</option>
					<!-- EDP: src_reseller_option -->
				</select>
			</div>
			<!-- EDP: src_reseller -->
			<!-- BDP: reseller_list -->
			<table>
				<tr>
					<th>{TR_NUMBER}</th>
					<th>{TR_MARK}</th>
					<th>{TR_USER_NAME}</th>
				</tr>
				<!-- BDP: reseller_item -->
				<tr>
					<td>{NUMBER}</td>
					<td><input id="{CKB_NAME}" type="checkbox" name="{CKB_NAME}" /></td>
					<td><label for="{CKB_NAME}">{USER_NAME}</label></td>
				</tr>
				<!-- EDP: reseller_item -->
			</table>
			<!-- EDP: reseller_list -->
			<!-- BDP: dst_reseller -->
			<div class="buttons">
				{TR_TO_RESELLER}
				<select name="dst_reseller">
					<!-- BDP: dst_reseller_option -->
					<option {DST_RSL_SELECTED} value="{DST_RSL_VALUE}">{DST_RSL_OPTION}</option>
					<!-- EDP: dst_reseller_option -->
				</select>
				<input type="hidden" name="uaction" value="move_user" />
				<input type="submit" name="Submit" value="{TR_MOVE}" />
			</div>
			<!-- EDP: dst_reseller -->
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
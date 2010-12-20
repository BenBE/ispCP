<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_ADD_SQL_DATABASE_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_ADD_SQL_DATABASE_PAGE_TITLE}' />
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
			<h1 class="database">{TR_MENU_MANAGE_SQL}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="sql_manage.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_MENU_ADD_SQL_DATABASE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="sql"><span>{TR_ADD_DATABASE}</span></h2>
		<form action="sql_database_add.php" method="post" id="client_sql_database_add">
			<table>
				<tr>
					<td>{TR_DB_NAME}</td>
					<td><input type="text" name="db_name" id="db_name" value="{DB_NAME}" /></td>
				</tr>
				<tr>
					<td>
						<!-- BDP: mysql_prefix_yes -->
						<input type="checkbox" name="use_dmn_id" {USE_DMN_ID} />
						<!-- EDP: mysql_prefix_yes -->
						<!-- BDP: mysql_prefix_no -->
						<input type="hidden" name="use_dmn_id" value="on" />
						<!-- EDP: mysql_prefix_no -->
						{TR_USE_DMN_ID}
					</td>
					<td>
						<!-- BDP: mysql_prefix_all -->
						<input type="radio" name="id_pos" value="start" {START_ID_POS_CHECKED} />&nbsp;{TR_START_ID_POS}<br />
					   	<input type="radio" name="id_pos" value="end" {END_ID_POS_CHECKED} />&nbsp;{TR_END_ID_POS}
						<!-- EDP: mysql_prefix_all -->
						<!-- BDP: mysql_prefix_infront -->
						<input type="hidden" name="id_pos" value="start" checked="checked" />{TR_START_ID_POS}
						<!-- EDP: mysql_prefix_infront -->
						<!-- BDP: mysql_prefix_behind -->
						<input type="hidden" name="id_pos" value="end" checked="checked" />{TR_END_ID_POS}
						<!-- EDP: mysql_prefix_behind -->
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_db" />
				<input type="submit"  name="Add_New" value="{TR_ADD}" />
			</div>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
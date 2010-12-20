<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_ADD_FTP_ACC_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_ADD_FTP_ACC_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		<!-- BDP: js_to_all_domain -->
		function begin_js() {
			document.forms[0].als_id.disabled = true;
			document.forms[0].username.focus();
		}

		function changeDom(wath) {
			if (wath == "real") {
				document.forms[0].als_id.disabled = true;
			} else if (wath == "subdom") {
				document.forms[0].als_id.disabled = true;
			} else {
				document.forms[0].als_id.disabled = false;
			}
		}
		<!-- EDP: js_to_all_domain -->

		<!-- BDP: js_not_domain -->
		function begin_js() {
			document.forms[0].username.focus();
		}
		<!-- EDP: js_not_domain -->

		<!-- BDP: js_to_alias_domain -->
		function begin_js() {
			document.forms[0].als_id.disabled = true;
			document.forms[0].username.focus();
		}

		function changeDom(wath) {
			if (wath == "real") {
				document.forms[0].als_id.disabled = true;
			} else if (wath == "subdom") {
				document.forms[0].als_id.disabled = true;
			} else {
				document.forms[0].als_id.disabled = false;
			}
		}
		<!-- EDP: js_to_alias_domain -->
	/* ]]> */
	</script>
</head>
<body onload="begin_js();">
	<div class="header">
		{MAIN_MENU}
		<div class="logo">
			<img src="{THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="ftp">{TR_MENU_FTP_ACCOUNTS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="ftp_accounts.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_ADD_FTP_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="ftp"><span>{TR_ADD_FTP_USER}</span></h2>
		<form action="ftp_add.php" method="post" id="client_ftp_add">
			<table>
				<tr>
					<td>{TR_USERNAME}</td>
					<td><input type="text" name="username" id="username" value="{USERNAME}" /></td>
				</tr>
				<tr>
					<td><input type="radio" name="dmn_type" id="dmn_type" value="dmn" onfocus="changeDom('real');" {DMN_TYPE_CHECKED} />{TR_TO_MAIN_DOMAIN}</td>
					<td>{FTP_SEPARATOR}{DOMAIN_NAME}</td>
				</tr>
				<!-- BDP: to_alias_domain -->
				<tr>
					<td><input type="radio" name="dmn_type" id="als_type" value="als" onfocus="changeDom('alias');" {ALS_TYPE_CHECKED} />{TR_TO_DOMAIN_ALIAS}</td>
					<td>
						<select name="als_id" id="als_id">
							<!-- BDP: als_list -->
							<option value="{ALS_ID}" {ALS_SELECTED}>{FTP_SEPARATOR}{ALS_NAME}</option>
							<!-- EDP: als_list -->
						</select>
					</td>
				</tr>
				<!-- EDP: to_alias_domain -->
				<tr>
					<td>{TR_PASSWORD}</td>
					<td><input type="password" name="pass" id="pass" value="" /></td>
				</tr>
				<tr>
					<td>{TR_PASSWORD_REPEAT}</td>
					<td><input type="password" name="pass_rep" id="pass_rep" value="" /></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="use_other_dir" id="use_other_dir" {USE_OTHER_DIR_CHECKED} />&nbsp;{TR_USE_OTHER_DIR}</td>
					<td><input type="text" name="other_dir" id="other_dir" value="{OTHER_DIR}" /><a href="#" onclick="showFileTree();" class="icon i_bc_folder">{CHOOSE_DIR}</a></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_user" />
				<input type="submit" name="Submit" value="{TR_ADD}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
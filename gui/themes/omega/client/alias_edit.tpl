<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_EDIT_ALIAS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_EDIT_ALIAS_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function setForwardReadonly(obj){
			if(obj.value == 1) {
				document.getElementById('client_alias_edit').elements['forward'].readOnly = false;
				document.getElementById('client_alias_edit').elements['forward_prefix'].disabled = false;
			} else {
				document.getElementById('client_alias_edit').elements['forward'].readOnly = true;
				document.getElementById('client_alias_edit').elements['forward'].value = '';
				document.getElementById('client_alias_edit').elements['forward_prefix'].disabled = true;
			}
		}
	/* ]]> */
	</script>
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
			<h1 class="domains">{TR_MENU_MANAGE_DOMAINS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="domains_manage.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_EDIT_ALIAS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="domains"><span>{TR_EDIT_ALIAS}</span></h2>
		<form action="alias_edit.php?edit_id={ID}" method="post" id="client_alias_edit">
			<table>
				<tr>
					<td>{TR_DOMAIN_IP}</td>
					<td>{ALIAS_NAME}</td>
				</tr>
				<tr>
					<td>{TR_DOMAIN_IP}</td>
					<td>{DOMAIN_IP}</td>
				</tr>
				<tr>
					<td>{TR_ENABLE_FWD}</td>
					<td>
						<input type="radio" name="status" id="status_EN" value="1" onchange="setForwardReadonly(this);" {CHECK_EN} /> &nbsp; {TR_ENABLE}<br />
						<input type="radio" name="status" id="status_DIS" value="0" onchange="setForwardReadonly(this);" {CHECK_DIS} /> &nbsp;{TR_DISABLE}
					</td>
				</tr>
				<tr>
					<td>{TR_FORWARD}</td>
					<td>
						<select name="forward_prefix" style="vertical-align:middle"{DISABLE_FORWARD}>
							<option value="{TR_PREFIX_HTTP}" {HTTP_YES}>{TR_PREFIX_HTTP}</option>
							<option value="{TR_PREFIX_HTTPS}" {HTTPS_YES}>{TR_PREFIX_HTTPS}</option>
							<option value="{TR_PREFIX_FTP}" {FTP_YES}>{TR_PREFIX_FTP}</option>
						</select>
						<input type="text" name="forward" id="forward" value="{FORWARD}" {READONLY_FORWARD} />
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="modify" />
				<input type="submit" name="Submit" value="{TR_MODIFY}" />
			</div>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
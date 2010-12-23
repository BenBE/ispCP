<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_EDIT_SUBDOMAIN_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_EDIT_SUBDOMAIN_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function setForwardReadonly(obj){
			if(obj.value == 1) {
				document.getElementById('client_subdomain_add').elements['forward'].readOnly = false;
				document.getElementById('client_subdomain_add').elements['forward_prefix'].disabled = false;
			} else {
				document.getElementById('client_subdomain_add').elements['forward'].readOnly = true;
				document.getElementById('client_subdomain_add').elements['forward'].value = '';
				document.getElementById('client_subdomain_add').elements['forward_prefix'].disabled = true;
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
			<li><a href="domains_manage.php">{TR_MENU_MANAGE_DOMAINS}</a></li>
			<li><a href="domains_manage.php">{TR_MENU_OVERVIEW}</a></li>
			<li>{TR_EDIT_SUBDOMAIN}</li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="domains"><span>{TR_EDIT_SUBDOMAIN}</span></h2>
		<form action="subdomain_edit.php?edit_id={ID}" method="post" id="client_subdomain_edit">
			<table>
				<tr>
					<td>{TR_SUBDOMAIN_NAME}</td>
					<td>{SUBDOMAIN_NAME}</td>
				</tr>
				<tr>
					<td>{TR_ENABLE_FWD}</td>
					<td>
						<input type="radio" name="status" id="status1" {CHECK_EN} value="1" onchange="setForwardReadonly(this);" /> <label for="status1">{TR_ENABLE}</label><br />
						<input type="radio" name="status" id="status2" {CHECK_DIS} value="0" onchange="setForwardReadonly(this);" /> <label for="status2">{TR_DISABLE}</label>
					</td>
				</tr>
				<tr>
					<td>{TR_FORWARD}</td>
					<td>
						<select name="forward_prefix" style="vertical-align:middle"{DISABLE_FORWARD}>
							<option value="{TR_PREFIX_HTTP}"{HTTP_YES}>{TR_PREFIX_HTTP}</option>
							<option value="{TR_PREFIX_HTTPS}"{HTTPS_YES}>{TR_PREFIX_HTTPS}</option>
							<option value="{TR_PREFIX_FTP}"{FTP_YES}>{TR_PREFIX_FTP}</option>
						</select>
						<input name="forward" type="text" id="forward" value="{FORWARD}" />
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="dmn_type" value="{DMN_TYPE}" />
				<input type="hidden" name="uaction" value="modify" />
				<input name="Submit" type="submit"  value="{TR_MODIFY}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
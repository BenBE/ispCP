<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADD_USER_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADD_USER_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.ui.tooltip.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ispcpTooltips.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Tooltips - begin
			$('#dmn_help').ispCPtooltips({msg:"{TR_DMN_HELP}"});
			// Tooltips - end
			$('#users_done').click(function() {
				document.location.href = 'users.php';
			});
		});

		function makeUser() {
			var dname = document.getElementById('reseller_user_add4').elements['ndomain_name'].value;
			dname = dname.toLowerCase();
			document.getElementById('reseller_user_add4').elements['ndomain_mpoint'].value = "/" + dname;
		}

		function setForwardReadonly(obj){
			if(obj.value == 1) {
				document.forms[0].elements['forward'].readOnly = false;
				document.forms[0].elements['forward_prefix'].disabled = false;
			} else {
				document.forms[0].elements['forward'].readOnly = true;
				document.forms[0].elements['forward'].value = '';
				document.forms[0].elements['forward_prefix'].disabled = true;
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
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a href="user_add1.php">{TR_ADD_USER}</a></li>
			<li><a>{TR_ADD_ALIAS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="general"><span>{TR_ADD_USER}</span></h2>
		<!-- BDP: alias_list -->
		<table>
			<thead>
				<tr>
					<th>{TR_DOMAIN_ALIAS}</th>
					<th>{TR_STATUS}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: alias_entry -->
				<tr>
					<td>{DOMAIN_ALIAS}</td>
					<td>{STATUS}</td>
				</tr>
				<!-- EDP: alias_entry -->
			</tbody>
		</table>
		<div>&nbsp;</div>
		<!-- EDP: alias_list -->
		<!-- BDP: add_form -->
		<form action="user_add4.php" method="post" id="reseller_user_add4">
			<fieldset>
				<legend>{TR_ADD_ALIAS}</legend>
				<table>
					<tr>
						<td>{TR_DOMAIN_NAME} <span id="dmn_help" class="icon i_help">&nbsp;</span></td>
						<td><input type="text" name="ndomain_name" id="ndomain_name" value="{DOMAIN}" onblur="makeUser();" /></td>
					</tr>
					<tr>
						<td>{TR_MOUNT_POINT}</td>
						<td><input type="text" name="ndomain_mpoint" id="ndomain_mpoint" value='{MP}' /></td>
					</tr>
					<tr>
						<td>{TR_ENABLE_FWD}</td>
						<td>
							<input type="radio" name="status" id="status_EN" value="1" onchange="setForwardReadonly(this);" {CHECK_EN} /> {TR_ENABLE}<br />
							<input type="radio" name="status" id="status_DIS" value="0" onchange="setForwardReadonly(this);" {CHECK_DIS} /> {TR_DISABLE}</td>
					</tr>
					<tr>
						<td>{TR_FORWARD}</td>
						<td>
							<select name="forward_prefix" style="vertical-align:middle" {DISABLE_FORWARD}>
								<option value="{TR_PREFIX_HTTP}" {HTTP_YES}>{TR_PREFIX_HTTP}</option>
								<option value="{TR_PREFIX_HTTPS}" {HTTPS_YES}>{TR_PREFIX_HTTPS}</option>
								<option value="{TR_PREFIX_FTP}" {FTP_YES}>{TR_PREFIX_FTP}</option>
							</select>
							<input type="text" name="forward" id="forward" value="{FORWARD}" {READONLY_FORWARD} />
						</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_alias" />
				<input type="submit" name="Submit" value="{TR_ADD}" />
				<input type="button" name="users_done" id="users_done" value="{TR_GO_USERS}" />
			</div>
		</form>
		<!-- EDP: add_form -->
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
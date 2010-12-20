<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_SETTINGS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_SETTINGS_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, service) {
			if (!confirm(sprintf("{TR_MESSAGE_DELETE}", service)))
				return false;
				location = url;
		}
		function enable_for_post() {
			for (var i = 0; i < document.getElementById('admin_settings_ports').length; i++) {
				for (var j = 0; j < document.getElementById('admin_settings_ports').elements[i].length; j++) {
					if (document.getElementById('admin_settings_ports').elements[i].name == "port_type[]") {
						document.getElementById('admin_settings_ports').elements[i].disabled = false;
					}
				}
			}
			return true;
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
			<h1 class="settings">{TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_SERVERPORTS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="settings"><span>{TR_SERVERPORTS}</span></h2>
		<form action="settings_ports.php" method="post" id="admin_settings_ports" onsubmit="return enable_for_post();">
			<fieldset>
				<table>
					<thead>
						<tr>
							<th>{TR_SERVICE}</th>
							<th>{TR_IP}</th>
							<th>{TR_PORT}</th>
							<th>{TR_PROTOCOL}</th>
							<th>{TR_SHOW}</th>
							<th>{TR_ACTION}</th>
						</tr>
					</thead>
					<tbody>
						<!-- BDP: service_ports -->
						<tr>
							<td>
								{SERVICE}
								<input type="hidden" name="var_name[]" id="var_name{NUM}" value="{VAR_NAME}" />
								<input type="hidden" name="custom[]" id="custom{NUM}" value="{CUSTOM}" />
							</td>
							<td><input type="text" name="ip[]" id="ip{NUM}" value="{IP}" maxlength="15" {PORT_READONLY} /></td>
							<td><input type="text" name="port[]" id="port{NUM}" value="{PORT}" maxlength="5" {PORT_READONLY} /></td>
							<td>
								<select name="port_type[]" id="port_type{NUM}" {PROTOCOL_READONLY}>
									<option value="udp" {SELECTED_UDP}>{TR_UDP}</option>
									<option value="tcp" {SELECTED_TCP}>{TR_TCP}</option>
								</select>
							</td>
							<td>
								<select name="show_val[]" id="show_val{NUM}">
									<option value="1" {SELECTED_ON}>{TR_ENABLED}</option>
									<option value="0" {SELECTED_OFF}>{TR_DISABLED}</option>
								</select>
							</td>
							<td>
								<!-- BDP: port_delete_show -->
								{TR_DELETE}
								<!-- EDP: port_delete_show -->
								<!-- BDP: port_delete_link -->
								<a href="#" onclick="action_delete('{URL_DELETE}', '{NAME}')" title="{TR_DELETE}" class="icon i_delete">{TR_DELETE}</a>
								<!-- EDP: port_delete_link -->
							</td>
						</tr>
						<!-- EDP: service_ports -->
					</tbody>
				</table>
				<div class="buttons">
					<input type="hidden" name="uaction" value="update" />
					<input type="submit" name="Submit" value="{VAL_FOR_SUBMIT_ON_UPDATE}" />
					<input type="reset" name="Reset" value="{VAL_FOR_SUBMIT_ON_RESET}" />
				</div>
			</fieldset>
		</form>
		<form action="settings_ports.php" method="post" id="admin_settings_port_add">
			<fieldset>
				<legend>{TR_ADD_NEW_SERVICE_PORT}</legend>
				<table>
					<tr>
						<td><input type="text" name="name_new" id="name_new" maxlength="25" /></td>
						<td><input type="text" name="ip_new" id="ip_new" maxlength="15" /></td>
						<td><input type="text" name="port_new" id="port_new" maxlength="6" /></td>
						<td>
							<select name="port_type_new" id="port_type">
								<option value="udp">{TR_UDP}</option>
								<option value="tcp" selected="selected">{TR_TCP}</option>
							</select>
						</td>
						<td>
							<select name="show_val_new" id="show_val">
								<option value="1" selected="selected">{TR_ENABLED}</option>
								<option value="0">{TR_DISABLED}</option>
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add" />
				<input type="submit" name="Submit" value="{VAL_FOR_SUBMIT_ON_ADD}" />
			</div>
		</form>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
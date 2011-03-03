{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, service) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", service)))
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
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="settings">{$TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_SERVERPORTS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="settings"><span>{$TR_SERVERPORTS}</span></h2>
		<form action="settings_ports.php" method="post" id="admin_settings_ports" onsubmit="return enable_for_post();">
			<fieldset>
				<table>
					<thead>
						<tr>
							<th>{$TR_SERVICE}</th>
							<th>{$TR_IP}</th>
							<th>{$TR_PORT}</th>
							<th>{$TR_PROTOCOL}</th>
							<th>{$TR_SHOW}</th>
							<th>{$TR_ACTION}</th>
						</tr>
					</thead>
					<tbody>
						{section name=i loop=$SERVICE}
						<tr>
							<td>
								{$SERVICE[i]}
								<input type="hidden" name="var_name[]" id="var_name{$NUM[i]}" value="{$VAR_NAME[i]}" />
								<input type="hidden" name="custom[]" id="custom{$NUM[i]}" value="{$CUSTOM[i]}" />
							</td>
							<td><input type="text" name="ip[]" id="ip{$NUM[i]}" value="{$IP[i]}" maxlength="15" {$PORT_READONLY[i]} /></td>
							<td><input type="text" name="port[]" id="port{$NUM[i]}" value="{$PORT[i]}" maxlength="5" {$PORT_READONLY[i]} /></td>
							<td>
								<select name="port_type[]" id="port_type{$NUM[i]}" {$PROTOCOL_READONLY[i]}>
									<option value="udp" {$SELECTED_UDP[i]}>{$TR_UDP}</option>
									<option value="tcp" {$SELECTED_TCP[i]}>{$TR_TCP}</option>
								</select>
							</td>
							<td>
								<select name="show_val[]" id="show_val{$NUM[i]}">
									<option value="1" {$SELECTED_ON[i]}>{$TR_ENABLED}</option>
									<option value="0" {$SELECTED_OFF[i]}>{$TR_DISABLED}</option>
								</select>
							</td>
							<td>
								{if isset($URL_DELETE[i])}
									{if $URL_DELETE[i] == false}
										N/A
									{else}
										<a href="#" onclick="action_delete('{$URL_DELETE[i]}', '{$NAME[i]}')" title="{$TR_DELETE}" class="icon i_delete">{$TR_DELETE}</a>
									{/if}
								{/if}
							</td>
						</tr>
						{/section}
					</tbody>
				</table>
				<div class="buttons">
					<input type="hidden" name="uaction" value="update" />
					<input type="submit" name="Submit" value="{$VAL_FOR_SUBMIT_ON_UPDATE}" />
					<input type="reset" name="Reset" value="{$VAL_FOR_SUBMIT_ON_RESET}" />
				</div>
			</fieldset>
		</form>
		<form action="settings_ports.php" method="post" id="admin_settings_port_add">
			<fieldset>
				<legend>{$TR_ADD_NEW_SERVICE_PORT}</legend>
				<table>
					<tr>
						<td><input type="text" name="name_new" id="name_new" maxlength="25" /></td>
						<td><input type="text" name="ip_new" id="ip_new" maxlength="15" /></td>
						<td><input type="text" name="port_new" id="port_new" maxlength="6" /></td>
						<td>
							<select name="port_type_new" id="port_type">
								<option value="udp">{$TR_UDP}</option>
								<option value="tcp" selected="selected">{$TR_TCP}</option>
							</select>
						</td>
						<td>
							<select name="show_val_new" id="show_val">
								<option value="1" selected="selected">{$TR_ENABLED}</option>
								<option value="0">{$TR_DISABLED}</option>
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add" />
				<input type="submit" name="Submit" value="{$VAL_FOR_SUBMIT_ON_ADD}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
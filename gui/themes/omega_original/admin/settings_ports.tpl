<script type="text/javascript">
/*<![CDATA[*/
function action_delete(url, service) {
	if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", service)))
		return false;
	location = url;
}

function enable_for_post() {
	for (var i = 0; i < document.frm_to_updt.length; i++) {
		for (var j = 0; j < document.frm_to_updt.elements[i].length; j++) {
			if (document.frm_to_updt.elements[i].name == 'port_type[]') {
				document.frm_to_updt.elements[i].disabled = false;
			}
		}
	}
	return true;
}

var error_fields_ids = {$ERROR_FIELDS_IDS};

$(document).ready(function(){

 $.each(error_fields_ids, function(){
  $('#'+this).css({ 'border' : '1px solid red', 'font-weight' : 'bolder' });
 });

 $('input[name=submitForReset]').click(
  function(){ $('input[name=uaction]').val('reset'); }
 );

});
/*]]>*/
</script>

						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="left">
									<table width="100%" cellpadding="5" cellspacing="5">
										<tr>
											<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_serverstatus.png" width="25" height="25" alt="" /></td>
											<td colspan="2" class="title">{$TR_SERVERPORTS}</td>
										</tr>
									</table>
								</td>
								<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
	<form name="frm_to_updt" method="post" action="settings_ports.php" onSubmit="return enable_for_post();">
										<table width="100%" cellpadding="5" cellspacing="5">
											{if $MESSAGE}
											<tr>
												<td width="25">&nbsp;</td>
												<td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
											</tr>
											{/if}
											<tr>
												<td width="25">&nbsp;</td>
												<td colspan="6" class="content3"><strong>{$TR_SHOW_UPDATE_SERVICE_PORT}</strong></td>
											</tr>
											<tr>
												<td width="25">&nbsp;</td>
												<td width="230" class="content3"><strong>{$TR_SERVICE}</strong></td>
												<td class="content3"><strong>{$TR_IP}</strong></td>
												<td class="content3"><strong>{$TR_PORT}</strong></td>
												<td class="content3"><strong>{$TR_PROTOCOL}</strong></td>
												<td class="content3"><strong>{$TR_SHOW}</strong></td>
												<td class="content3"><strong>{$TR_ACTION}</strong></td>
											</tr>
											{section name=i loop=$CLASS}
											<tr class="hl">
												<td width="25">&nbsp;</td>
												<td class="{$CLASS[i]}">
													{$SERVICE[i]}
													<input name="var_name[]" type="hidden" id="var_name{$NUM[i]}" value="{$VAR_NAME[i]}" />
													<input name="custom[]" type="hidden" id="custom{$NUM[i]}" value="{$CUSTOM[i]}" />
												</td>
												<td class="{$CLASS[i]}">
													<input name="ip[]" type="text" class="textinput" id="ip{$NUM[i]}" value="{$IP[i]}" maxlength="15" {$PORT_READONLY[i]} />
												</td>
												<td class="{$CLASS[i]}">
													<input name="port[]" type="text" class="textinput" id="port{$NUM[i]}" style="width:50px" value="{$PORT[i]}" maxlength="5" {$PORT_READONLY[i]} />
												</td>
												<td class="{$CLASS[i]}">
													<select name="port_type[]" id="port_type{$NUM[i]}" {$PROTOCOL_READONLY[i]}>
														<option value="udp" {$SELECTED_UDP[i]}>{$TR_UDP}</option>
														<option value="tcp" {$SELECTED_TCP[i]}>{$TR_TCP}</option>
													</select>
												</td>
												<td class="{$CLASS[i]}">
													<select name="show_val[]" id="show_val{$NUM[i]}">
														<option value="1" {$SELECTED_ON[i]}>{$TR_ENABLED}</option>
														<option value="0" {$SELECTED_OFF[i]}>{$TR_DISABLED}</option>
													</select>
												</td>
												<td class="{$CLASS[i]}" width="100" nowrap="nowrap">
													{if $PORT_DELETE_SHOW[i]}
													{$TR_DELETE}
													{/if}
													{if $PORT_DELETE_LINK[i]}
													<a href="#" onClick="action_delete('{$URL_DELETE[i]}', '{$NAME[i]}')" class="link">
													<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />{$TR_DELETE}</a>
													{/if}
												</td>
											</tr>
											{/section}
											<tr>
												<td>&nbsp;</td>
												<td colspan="6">
												<input type="hidden" name="uaction" value="update" />
												<input name="submitForUpdate" type="submit" class="button" value="{$VAL_FOR_SUBMIT_ON_UPDATE}" />
												<input name="submitForReset" type="submit" class="button" value="{$VAL_FOR_SUBMIT_ON_RESET}"/>
												</td>
											</tr>
										</table>
									</form>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
									<form name="frm_to_add" method="post" action="settings_ports.php">
										<table width="100%" cellpadding="5" cellspacing="5">
											<tr>
												<td width="25">&nbsp;</td>
												<td colspan="6" class="content3"><strong>{$TR_ADD_NEW_SERVICE_PORT}</strong></td>
											</tr>
											<tr>
												<td width="25">&nbsp;</td>
												<td width="230" class="content3"><strong>{$TR_SERVICE}</strong></td>
												<td class="content3"><strong>{$TR_IP}</strong></td>
												<td class="content3"><strong>{$TR_PORT}</strong></td>
												<td class="content3"><strong>{$TR_PROTOCOL}</strong></td>
												<td class="content3"><strong>{$TR_SHOW}</strong></td>
											</tr>
											<tr>
												<td width="25">&nbsp;</td>
												<td class="{$CLASS}"><input name="name_new" type="text" class="textinput" id="name" value="{$VAL_FOR_NAME_NEW}" maxlength="25"/></td>
												<td class="{$CLASS}"><input name="ip_new" type="text" class="textinput" id="ip" style="" value="{$VAL_FOR_IP_NEW}" maxlength="15" /></td>
												<td class="{$CLASS}"><input name="port_new" type="text" class="textinput" id="port" style="width:50px" value="{$VAL_FOR_PORT_NEW}" maxlength="6" /></td>
												<td class="{$CLASS}">
													<select name="port_type_new" id="port_type">
														<option value="udp">{$TR_UDP}</option>
														<option value="tcp" selected="selected">{$TR_TCP}</option>
													</select>
												</td>
												<td class="{$CLASS}">
													<select name="show_val_new" id="show_val">
														<option value="1" selected="selected">{$TR_ENABLED}</option>
														<option value="0">{$TR_DISABLED}</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td colspan="6">
												<input type="hidden" name="uaction" value="add" />
												<input name="submitForAdd" type="submit" class="button" value="{$VAL_FOR_SUBMIT_ON_ADD}" />
												</td>
											</tr>
										</table>
									</form>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					

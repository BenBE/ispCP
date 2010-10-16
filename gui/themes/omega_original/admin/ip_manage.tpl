<script type="text/javascript">
/*<![CDATA[*/
function action_delete(url, ip) {
	if (url == "#" || !confirm(sprintf("{$TR_MESSAGE_DELETE}", ip)))
		return false;

	location = url;
}
/*]]>*/
</script>

						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="left">
									<table width="100%" cellpadding="5" cellspacing="5">
										<tr>
											<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_ip.png" width="25" height="25" alt="" /></td>
											<td colspan="2" class="title">{$MANAGE_IPS}</td>
										</tr>
									</table>
								</td>
								<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
									<table width="100%" cellpadding="6" cellspacing="5">
										{if $MESSAGE}
										<tr>
											<td width="25">&nbsp;</td>
											<td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
										</tr>
										{/if}
										<tr>
											<td width="25">&nbsp;</td>
											<td colspan="5" class="content3"><b>{$TR_AVAILABLE_IPS}</b></td>
										</tr>
										<tr align="center">
											<td width="25">&nbsp;</td>
											<td align="left" class="content3"><strong>{$TR_IP}</strong></td>
											<td class="content3"><strong>{$TR_DOMAIN}</strong></td>
											<td class="content3"><strong>{$TR_ALIAS}</strong></td>
											<td class="content3"><strong>{$TR_NETWORK_CARD}</strong></td>
											<td width="103" class="content3"><strong>{$TR_ACTION}</strong></td>
										</tr>
										{section name=i loop=$IP_CLASS}
										<tr>
											<td width="25" nowrap="nowrap">&nbsp;</td>
											<td align="left" nowrap="nowrap" class="{$IP_CLASS[i]}">{$IP[i]}</td>
											<td align="center" nowrap="nowrap" class="{$IP_CLASS[i]}">{$DOMAIN[i]}</td>
											<td class="{$IP_CLASS[i]}" nowrap="nowrap" align="center">{$ALIAS[i]}</td>
											<td class="{$IP_CLASS[i]}" nowrap="nowrap" align="center">{$NETWORK_CARD[i]}</td>
											<td class="{$IP_CLASS[i]}" nowrap="nowrap" align="center">
											{if $IP_DELETE_SHOW[i] != 'no'}
												{$IP_ACTION[i]}
											{/if}
											{if $IP_DELETE_LINK[i] != 'no'}
												<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" onClick="action_delete('{$IP_ACTION_SCRIPT[i]}', '{$IP[i]}')"  title="{$IP_ACTION[i]}" class="link">{$IP_ACTION[i]}</a>
											{/if}
											</td>
										</tr>
										{/section}
									</table>
									<br />
									<form name="add_new_ip_frm" method="post" action="ip_manage.php">
										<table width="100%" cellpadding="5" cellspacing="5">
											<tr>
												<td width="25">&nbsp;</td>
												<td colspan="2" class="content3"><b>{$TR_ADD_NEW_IP}</b></td>
											</tr>
											<tr>
												<td width="25" nowrap="nowrap">&nbsp;</td>
												<td width="200" class="content2" nowrap="nowrap">{$TR_IP}</td>
												<td nowrap="nowrap" class="content"><input name="ip_number_1" type="text" class="textinput" style="width:31px" value="{$VALUE_IP1}" maxlength="3" />
													.
													<input name="ip_number_2" type="text" class="textinput" style="width:31px" value="{$VALUE_IP2}" maxlength="3" />
													.
													<input name="ip_number_3" type="text" class="textinput" style="width:31px" value="{$VALUE_IP3}" maxlength="3" />
													.
													<input name="ip_number_4" type="text" class="textinput" style="width:31px" value="{$VALUE_IP4}" maxlength="3" />
												</td>
											</tr>
											<tr>
												<td width="25" nowrap="nowrap">&nbsp;</td>
												<td width="200" class="content2" nowrap="nowrap">{$TR_DOMAIN}</td>
												<td nowrap="nowrap" class="content">
													<input type="text" name="domain" value="{$VALUE_DOMAIN}" style="width:180px" class="textinput" />
												</td>
											</tr>
											<tr>
												<td width="25" nowrap="nowrap">&nbsp;</td>
												<td width="200" class="content2" nowrap="nowrap">{$TR_ALIAS}</td>
												<td nowrap="nowrap" class="content">
													<input type="text" name="alias" value="{$VALUE_ALIAS}" style="width:180px" class="textinput" />
												</td>
											</tr>
											<tr>
												<td width="25" nowrap="nowrap">&nbsp;</td>
												<td width="200" class="content2" nowrap="nowrap">{$TR_NETWORK_CARD}</td>
												<td nowrap="nowrap" class="content">
													<select name="ip_card">
														{section name=i loop=$NETWORK_CARDS}
														<option>{$NETWORK_CARDS[i]}</option>
														{/section}
													</select>
												</td>
											</tr>
											<tr>
												<td nowrap="nowrap">&nbsp;</td>
												<td colspan="2" nowrap="nowrap">
													<input name="Submit" type="submit" class="button" value="  {$TR_ADD}  " />
												</td>
											</tr>
										</table>
										<input type="hidden" name="uaction" value="add_ip" />
									</form>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					

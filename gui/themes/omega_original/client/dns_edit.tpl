						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="left">
									<table width="100%" cellpadding="5" cellspacing="5">
										<tr>
											<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
											<td colspan="2" class="title">{$TR_MANAGE_DOMAIN_DNS}</td>
										</tr>
									</table>
								</td>
								<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<form name="edit_alias_frm" method="post" action="{$ACTION_MODE}">
										<table width="100%" cellpadding="5" cellspacing="5">
											<tr>
												<td width="25">&nbsp;</td>
												<td colspan="2" class="content3"><b>{$TR_EDIT_DNS}</b></td>
											</tr>
											{if $MESSAGE}
											<tr>
												<td>&nbsp;</td>
												<td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
											</tr>
											{/if}
											{if $ADD_RECORD != 'no'}
											<tr>
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DOMAIN}</td>
												<td class="content"><select name="alias_id">{$SELECT_ALIAS}</select></td>
											</tr>
											{/if}
											<tr>
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_TYPE}</td>
												<td class="content"><select id="dns_type" onChange="dns_type_changed(this.value)" name="type">{$SELECT_DNS_TYPE}</select></td>
											</tr>
											<tr>
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_CLASS}</td>
												<td class="content"><select name="class">{$SELECT_DNS_CLASS}</select></td>
											</tr>
											<tr id="tr_dns_name">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_NAME}</td>
												<td class="content"><input type="text" name="dns_name" value="{$DNS_NAME}" /></td>
											</tr>
											<tr id="tr_dns_srv_name">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_NAME}</td>
												<td class="content"><input type="text" name="dns_srv_name" value="{$DNS_SRV_NAME}" /></td>
											</tr>
											<tr id="tr_dns_ip_address">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_IP_ADDRESS}</td>
												<td class="content"><input type="text" onKeyPress="return filterChars(event, IPADDRESS);" name="dns_A_address" value="{$DNS_ADDRESS}" /></td>
											</tr>
											<tr id="tr_dns_ip_address_v6">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_IP_ADDRESS_V6}</td>
												<td class="content"><input type="text" onKeyPress="return filterChars(event, IPv6ADDRESS);" name="dns_AAAA_address" value="{$DNS_ADDRESS_V6}" /></td>
											</tr>
											<tr id="tr_dns_srv_protocol">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_PROTOCOL}</td>
												<td class="content"><select name="srv_proto" id="srv_protocol">{$SELECT_DNS_SRV_PROTOCOL}</select></td>
											</tr>
											<tr id="tr_dns_srv_ttl">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_TTL}</td>
												<td class="content"><input type="text" onKeyPress="return filterChars(event, NUMBERS);" name="dns_srv_ttl" value="{$DNS_SRV_TTL}" /></td>
											</tr>
											<tr id="tr_dns_srv_prio">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_PRIO}</td>
												<td class="content"><input type="text" onKeyPress="return filterChars(event, NUMBERS);" name="dns_srv_prio" value="{$DNS_SRV_PRIO}" /></td>
											</tr>
											<tr id="tr_dns_srv_weight">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_WEIGHT}</td>
												<td class="content"><input type="text" onKeyPress="return filterChars(event, NUMBERS);" name="dns_srv_weight" value="{$DNS_SRV_WEIGHT}" /></td>
											</tr>
											<tr id="tr_dns_srv_host">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_HOST}</td>
												<td class="content"><input type="text" name="dns_srv_host" value="{$DNS_SRV_HOST}" /></td>
											</tr>
											<tr id="tr_dns_srv_port">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_SRV_PORT}</td>
												<td class="content"><input type="text" onKeyPress="return filterChars(event, NUMBERS);" name="dns_srv_port" value="{$DNS_SRV_PORT}" /></td>
											</tr>
											<tr id="tr_dns_cname">
												<td width="25">&nbsp;</td>
												<td width="200" class="content2">{$TR_DNS_CNAME}</td>
												<td class="content"><input type="text" name="dns_cname" value="{$DNS_CNAME}" /></td>
											</tr>
											<tr>
												<td width="25">&nbsp;</td>
												<td colspan="2">
													{if $FORM_EDIT_MODE != 'no'}
													<input name="Submit" type="submit" class="button" value="  {$TR_MODIFY}  " />
													<input type="hidden" name="uaction" value="modify" />
													{/if}
													{if $FORM_ADD_MODE != 'no'}
													<input name="Submit" type="submit" class="button" value="  {$TR_ADD}  " />
													<input type="hidden" name="uaction" value="add" />
													{/if}
													&nbsp;&nbsp;&nbsp;
													<input name="Submit" type="submit" class="button" onClick="MM_goToURL('parent','domains_manage.php');return document.MM_returnValue" value=" {$TR_CANCEL} " />
												</td>
											</tr>
										</table>
									</form>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
/* <![CDATA[ */

	dns_type_changed(document.getElementById('dns_type').value);

/* ]]> */
</script>
</body>
</html>

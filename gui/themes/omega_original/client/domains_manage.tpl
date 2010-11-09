<script type="text/javascript">
<!--
function action_delete(url, object_type) {
	if (url == 'protected' || !confirm(sprintf("{$TR_MESSAGE_DELETE}", object_type)))
		return false;

	location = url;
}
//-->
</script>
					{if $ALIAS_ADD}
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="left">
									<table width="100%" cellpadding="5" cellspacing="5">
										{if $MESSAGE}
										<tr>
											<td class="title" nowrap="nowrap" colspan="5"><span class="message">{$MESSAGE}</span></td>
										</tr>
										{/if}
										<tr>
											<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
											<td colspan="2" class="title">{$TR_DOMAIN_ALIASES}</td>
										</tr>
									</table>
								</td>
								<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="40">&nbsp;</td>
											<td valign="top">
												<table width="100%" cellpadding="5" cellspacing="5">
													{if $ALS_MSG}
													<tr>
														<td class="title" nowrap="nowrap" colspan="5"><span class="message">{$ALS_MSG}</span></td>
													</tr>
													{/if}
													{if $ALS_NAME}
													<tr>
														<td class="content3" nowrap="nowrap"><b>{$TR_ALS_NAME}</b></td>
														<td class="content3" nowrap="nowrap"><b>{$TR_ALS_MOUNT}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALS_FORWARD}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALS_STATUS}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALS_ACTION}</b></td>
													</tr>
													{section name=i loop=$ALS_NAME}
													<tr class="hl">
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap"><img src="{$THEME_COLOR_PATH}/images/icons/domain_icon.png" width="16" height="16" style="vertical-align:middle" alt="" /> <a href="http://{$ALS_NAME[i]}/" class="link" title="{$ALS_NAME[i]}">{$ALS_NAME[i]}</a></td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap">{$ALS_MOUNT[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALS_FORWARD[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALS_STATUS[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$ALS_EDIT_LINK[i]}" class="link" title="{$ALS_EDIT[i]}">{$ALS_EDIT[i]}</a> - <img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="action_delete('{$ALS_ACTION_SCRIPT[i]}', '{$ALS_NAME[i]}')" title="{$ALS_ACTION[i]}">{$ALS_ACTION[i]}</a></td>
													</tr>
													{/section}
													{/if}
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					{/if}
					{if $SUBDOMAIN_ADD}
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="left">
									<table width="100%" cellpadding="5" cellspacing="5">
										<tr>
											<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
											<td colspan="2" class="title">{$TR_SUBDOMAINS}</td>
										</tr>
									</table>
								</td>
								<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="40">&nbsp;</td>
											<td valign="top">
												<table width="100%" cellspacing="7">
													{if $SUB_MSG}
													<tr>
														<td class="title" nowrap="nowrap" colspan="5"><span class="message">{$SUB_MSG}</span></td>
													</tr>
													{/if}
													{if $SUB_NAME}
													<tr>
														<td class="content3" nowrap="nowrap"><b>{$TR_SUB_NAME}</b></td>
														<td class="content3" nowrap="nowrap"><b>{$TR_SUB_MOUNT}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_SUB_FORWARD}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_SUB_STATUS}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_SUB_ACTION}</b></td>
													</tr>
													{section name=i loop=$SUB_NAME}
													<tr class="hl">
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap">
															<img src="{$THEME_COLOR_PATH}/images/icons/domain_icon.png" width="16" height="16" style="vertical-align:middle" alt="" />
															&nbsp;
															<a href="http://{$SUB_NAME[i]}.{$SUB_ALIAS_NAME[i]}/" class="link" title="{$SUB_NAME[i]}.{$SUB_ALIAS_NAME[i]}">
																{$SUB_NAME[i]}.{$SUB_ALIAS_NAME[i]}
															</a>
														</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap">{$SUB_MOUNT[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SUB_FORWARD[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SUB_STATUS[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">
															<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
															&nbsp;
															<a href="#" class="link" onclick="action_delete('{$SUB_ACTION_SCRIPT[i]}', '{$SUB_NAME[i]}')">
																{$SUB_ACTION[i]}
															</a>
															&nbsp;-&nbsp;
															<img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
															&nbsp;
															<a href="{$SUB_EDIT_LINK[i]}" class="link" title="{$SUB_EDIT[i]}">
																{$SUB_EDIT[i]}
															</a>
														</td>
													</tr>
													{/section}
													{/if}
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
						{/if}
						{if $ISACTIVE_DNS}
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
									<td align="left">
										<table width="100%" cellpadding="5" cellspacing="5">
											<tr>
												<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
												<td colspan="2" class="title">{$TR_DNS}</td>
											</tr>
										</table>
									</td>
									<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td valign="top">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="40">&nbsp;</td>
											<td valign="top">
												<table width="100%" cellspacing="7">
													{if $DNS_MSG}
													<tr>
														<td class="title" nowrap="nowrap" colspan="5"><span class="message">{$DNS_MSG}</span></td>
													</tr>
													{/if}
													{if $DNS_DOMAIN}
													<tr>
														<td class="content3" colspan="2" nowrap="nowrap"><b>{$TR_DOMAIN_NAME}</b></td>
														<td class="content3" nowrap="nowrap"><b>{$TR_DNS_NAME}</b></td>
														<td class="content3" nowrap="nowrap"><b>{$TR_DNS_CLASS}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_DNS_TYPE}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_DNS_DATA}</b></td>
														<td class="content3" nowrap="nowrap" align="center"><b>{$TR_DNS_ACTION}</b></td>
													</tr>
													{section name=i loop=$DNS_DOMAIN}
													<tr>
														<td class="{$ITEM_CLASS[i]}" colspan="2" nowrap="nowrap"><img src="{$THEME_COLOR_PATH}/images/icons/domain_icon.png" width="15" height="14" align="left" alt="" />{$DNS_DOMAIN[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap">{$DNS_NAME[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap">{$DNS_CLASS[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$DNS_TYPE[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$DNS_DATA[i]}</td>
														<td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">
															<img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a class="link" href="{$DNS_ACTION_SCRIPT_EDIT[i]}" title="{$DNS_ACTION_EDIT[i]}">{$DNS_ACTION_EDIT[i]}</a> - <img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="action_delete('{$DNS_ACTION_SCRIPT_DELETE[i]}', '{$DNS_TYPE_RECORD[i]}')" title="{$DNS_ACTION_DELETE[i]}">{$DNS_ACTION_DELETE[i]}</a>
														</td>
													</tr>
													{/section}
													{/if}
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
						{/if}

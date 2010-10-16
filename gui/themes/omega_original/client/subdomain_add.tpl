		<script type="text/javascript">
			/*<![CDATA[*/
				$(document).ready(function(){
					// Tooltips - begin
					$('#dmn_help').ispCPtooltips({ msg:"{$TR_DMN_HELP}" });
					// Tooltips - end
				});

				function makeUser() {
					var subname  = document.forms[0].elements['subdomain_name'].value;
					subname = subname.toLowerCase();
					document.forms[0].elements['subdomain_mnt_pt'].value = "/" + subname;
				}

				function setRatioAlias(){
					document.forms[0].elements['dmn_type'][1].checked = true;
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

			/*]]>*/
		</script>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td align="left">
											<table width="100%" cellpadding="5" cellspacing="5">
												<tr>
													<td width="25">
														<img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" />
													</td>
													<td colspan="2" class="title">
														{$TR_ADD_SUBDOMAIN}
													</td>
												</tr>
											</table>
										</td>
										<td width="27" align="right">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td valign="top">
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="40">
														&nbsp;
													</td>
													<td valign="top">
														<form name="client_add_subdomain_frm" method="post" action="subdomain_add.php">
															<table width="100%" cellspacing="5">
                                                                {if $MESSAGE}
																<tr>
																	<td colspan="2" class="title">
																		<span class="message">
																			{$MESSAGE}
																		</span>
																	</td>
																</tr>
                                                                {/if}
																<tr>
																	<td width="250" class="content2">
																		<label for="subdomain_name">
																			{$TR_SUBDOMAIN_NAME}
																		</label>
																		&nbsp;
																		<img id="dmn_help" src="{$THEME_COLOR_PATH}/images/icons/help.png" width="16" height="16" alt="" />
																	</td>
																	<td class="content">
																		<input type="text" name="subdomain_name" id="subdomain_name" value="{$SUBDOMAIN_NAME}" style="width:170px" class="textinput" onBlur="makeUser();" />
																		<input type="radio" name="dmn_type" value="dmn" {$SUB_DMN_CHECKED} />{$DOMAIN_NAME}
                                                                        {if $TO_ALIAS_DOMAIN != 'no'}
																		<input type="radio" name="dmn_type" value="als" {$SUB_ALS_CHECKED} />
																		<select name="als_id" onFocus="setRatioAlias();">
                                                                            {section name=i loop=$ALS_NAME}
																			<option value="{$ALS_ID[i]}" {$ALS_SELECTED[i]}>.{$ALS_NAME[i]}</option>
                                                                            {/section}
																		</select>
                                                                        {/if}
																	</td>
																</tr>
																<tr>
																	<td width="250" class="content2">
																		<label for="subdomain_mnt_pt">
																			{$TR_DIR_TREE_SUBDOMAIN_MOUNT_POINT}
																		</label>
																	</td>
																	<td class="content">
																		<input type="text" name="subdomain_mnt_pt" id="subdomain_mnt_pt" value="{$SUBDOMAIN_MOUNT_POINT}" style="width:170px" class="textinput" />
																	</td>
																</tr>
																<tr>
																	<td width="250" class="content2">
																		{$TR_ENABLE_FWD}
																	</td>
																	<td class="content">
																		<input type="radio" name="status" {$CHECK_EN} value="1" onChange='setForwardReadonly(this);' />
																		&nbsp;{$TR_ENABLE}<br />
																		<input type="radio" name="status" {$CHECK_DIS} value="0" onChange='setForwardReadonly(this);' />
																		&nbsp;{$TR_DISABLE}
																	</td>
																</tr>
																<tr>
																	<td width="250" class="content2">
																		<label for="forward">
																			{$TR_FORWARD}
																		</label>
																	</td>
																	<td class="content">
																		<select name="forward_prefix" style="vertical-align:middle"{$DISABLE_FORWARD}>
																			<option value="{$TR_PREFIX_HTTP}"{$HTTP_YES}>
																				{$TR_PREFIX_HTTP}
																			</option>
																			<option value="{$TR_PREFIX_HTTPS}"{$HTTPS_YES}>
																				{$TR_PREFIX_HTTPS}
																			</option>
																			<option value="{$TR_PREFIX_FTP}"{$FTP_YES}>
																				{$TR_PREFIX_FTP}
																			</option>
																		</select>
																		<input name="forward" type="text" class="textinput" id="forward" style="width:170px" value="{$FORWARD}"{$READONLY_FORWARD} />
																	</td>
																</tr>
																<tr>
																	<td colspan="2">
																		&nbsp;
																	</td>
																</tr>
																<tr>
																	<td colspan="2">
																		<input name="Submit" type="submit" class="button" value="{$TR_ADD}" />
																		<input type="hidden" name="uaction" value="add_subd" />
																	</td>
																</tr>
															</table>
														</form>
													</td>
												</tr>
											</table>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>

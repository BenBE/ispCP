						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="left">
									<table width="100%" cellpadding="5" cellspacing="5">
										<tr>
											<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_layout.png" width="25" height="25" alt="" /></td>
											<td colspan="2" class="title">{$TR_LAYOUT_SETTINGS}</td>
										</tr>
									</table>
								</td>
								<td width="27" align="right">&nbsp;</td>
							</tr>
							<tr>
								<td>
									<!-- BDP: props_list -->
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td width="40">&nbsp;</td>
											<td align="left">
											{if $MESSAGE}
												<div align="left" class="title"><span class="message">{$MESSAGE}</span></div>
											{/if}
												<table width="100%" cellpadding="5" cellspacing="5">
													<tr>
														<td colspan="2" class="content3"><b>{$TR_UPLOAD_LOGO}</b></td>
													</tr>
													<tr>
														<td width="230" class="content2" nowrap="nowrap">{$TR_LOGO_FILE}</td>
														<td class="content" nowrap="nowrap">
															<form enctype="multipart/form-data" name="set_layout" method="post" action="settings_layout.php">
																<input type="file" name="logo_file" size="40" />
																<input type="hidden" name="uaction" value="upload_logo" />
																<input name="Submit" type="submit" class="button" value=" {$TR_UPLOAD} " />
															</form>
														</td>
													</tr>
													<tr>
														<td nowrap="nowrap">&nbsp;</td>
														<td nowrap="nowrap">&nbsp;</td>
													</tr>
													{if $LOGO_REMOVE_BUTTON}
													<tr>
														<td class="content2"><img src="{$OWN_LOGO}" alt="admin logo" /></td>
														<td class="content">
															<form method="post" action="settings_layout.php">
																<input type="hidden" name="uaction" value="delete_logo" />
																<input name="Submit" type="submit" class="button" value=" {$TR_REMOVE} " />
															</form>
														</td>
													</tr>
													{/if}
												</table>
												<!-- end of content -->
											</td>
										</tr>
									</table>
									<!-- EDP: props_list -->
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					

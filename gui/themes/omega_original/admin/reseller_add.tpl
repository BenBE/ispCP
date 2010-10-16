<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_user.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_ADD_RESELLER}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form name="admin_add_reseller" method="post" action="reseller_add.php">
                          <table width="750" cellpadding="5" cellspacing="5">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="content3"><b>{$TR_CORE_DATA}</b></td>
                            </tr>
                            {if $MESSAGE}
                            <tr align="left">
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_USERNAME}</td>
                              <td class="content"><input type="text" name="username" value="{$USERNAME}" style="width:210px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_PASSWORD}</td>
                              <td class="content"><input type="password" name="pass" value="{$GENPAS}" style="width:210px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_PASSWORD_REPEAT}</td>
                              <td class="content"><input type="password" name="pass_rep" value="{$GENPAS}" style="width:210px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_EMAIL}</td>
                              <td class="content"><input type="text" name="email" value="{$EMAIL}" style="width:210px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_DOMAIN_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_domain_cnt" value="{$MAX_DOMAIN_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_SUBDOMAIN_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_subdomain_cnt" value="{$MAX_SUBDOMAIN_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_ALIASES_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_alias_cnt" value="{$MAX_ALIASES_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_MAIL_USERS_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_mail_cnt" value="{$MAX_MAIL_USERS_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_FTP_USERS_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_ftp_cnt" value="{$MAX_FTP_USERS_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_SQLDB_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_sql_db_cnt" value="{$MAX_SQLDB_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_SQL_USERS_COUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_sql_user_cnt" value="{$MAX_SQL_USERS_COUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_TRAFFIC_AMOUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_traffic" value="{$MAX_TRAFFIC_AMOUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2" width="200">{$TR_MAX_DISK_AMOUNT}</td>
                              <td class="content"><input type="text" name="nreseller_max_disk" value="{$MAX_DISK_AMOUNT}" style="width:140px" class="textinput" />
                              </td>
                            </tr>
							<tr>
								<td width="25">&nbsp;</td>
								<td class="content2" width="200">{$TR_SUPPORT_SYSTEM}</td>
								<td class="content">
									<input name="support_system" value="yes" checked="checked" type="radio" />{$TR_YES}
									<input name="support_system" value="no" type="radio" />{$TR_NO}
								</td>
							</tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><table cellpadding="5" cellspacing="5" border="0" width="100%">
                                  <tr>
                                    <td colspan="4" class="content3"><strong>{$TR_RESELLER_IPS}</strong></td>
                                  </tr>
                                  {if $RSL_IP_MESSAGE}
                                  <tr>
                                    <td colspan="4" class="title" nowrap="nowrap" align="center"><b>{$RSL_IP_MESSAGE}</b></td>
                                  </tr>
                                  {/if}
                                  {if $RSL_IP_CLASS}
                                  <tr>
                                    <td width="10%" align="center" class="content3">{$TR_RSL_IP_NUMBER}</td>
                                    <td width="20%" align="center" class="content3">{$TR_RSL_IP_ASSIGN}</td>
                                    <td width="35%" class="content3">{$TR_RSL_IP_LABEL}</td>
                                    <td width="35%" class="content3">{$TR_RSL_IP_IP}</td>
                                  </tr>
                                  {section name=i loop=$RSL_IP_CLASS}
                                  <tr>
                                    <td width="10%" align="center" class="{$RSL_IP_CLASS[i]}">{$RSL_IP_NUMBER[i]}</td>
                                    <td width="20%" align="center" class="{$RSL_IP_CLASS[i]}"><input type="checkbox" name="{$RSL_IP_CKB_NAME[i]}" value="{$RSL_IP_CKB_VALUE[i]}" {$RSL_IP_ITEM_ASSIGNED[i]} /></td>
                                    <td width="35%" class="{$RSL_IP_CLASS[i]}">{$RSL_IP_LABEL[i]}</td>
                                    <td width="35%" class="{$RSL_IP_CLASS[i]}">{$RSL_IP_IP[i]}</td>
                                  </tr>
                                  {/section}
                                  {/if}
                              </table></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2" class="content3"><b>{$TR_ADDITIONAL_DATA}</b></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_CUSTOMER_ID}</td>
                              <td class="content"><input type="text" name="customer_id" value="{$CUSTOMER_ID}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_FIRST_NAME}</td>
                              <td class="content"><input type="text" name="fname" value="{$FIRST_NAME}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_LAST_NAME}</td>
                              <td class="content"><input type="text" name="lname" value="{$LAST_NAME}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_GENDER}</td>
                              <td class="content"><select name="gender" size="1">
                                      <option value="M" {$VL_MALE}>{$TR_MALE}</option>
                                      <option value="F" {$VL_FEMALE}>{$TR_FEMALE}</option>
                                      <option value="U" {$VL_UNKNOWN}>{$TR_UNKNOWN}</option>
                                    </select></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_COMPANY}</td>
                              <td class="content"><input type="text" name="firm" value="{$FIRM}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_STREET_1}</td>
                              <td class="content"><input type="text" name="street1" value="{$STREET_1}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_STREET_2}</td>
                              <td class="content"><input type="text" name="street2" value="{$STREET_2}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_ZIP_POSTAL_CODE}</td>
                              <td class="content"><input type="text" name="zip" value="{$ZIP}" style="width:80px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_CITY}</td>
                              <td class="content"><input type="text" name="city" value="{$CITY}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_STATE}</td>
                              <td class="content"><input type="text" name="state" value="{$STATE}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_COUNTRY}</td>
                              <td class="content"><input type="text" name="country" value="{$COUNTRY}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_PHONE}</td>
                              <td class="content"><input type="text" name="phone" value="{$PHONE}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_FAX}</td>
                              <td class="content"><input type="text" name="fax" value="{$FAX}" style="width:210px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><input name="Submit" type="submit" class="button" value="  {$TR_ADD}  " /></td>
                            </tr>
                            <tr>
                              <td colspan="3">&nbsp;</td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="add_reseller" />
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

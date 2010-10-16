<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_stats.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_RESELLER_USER_STATISTICS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" cellspacing="7">
                    <tr>
                      <td width="40" nowrap="nowrap">&nbsp;&nbsp;&nbsp;</td>
                      <td><!-- BDP: props_list -->
                          <form name="rs_frm" method="post" action="user_statistics.php?psi={$POST_PREV_PSI}">
                            <table width="100%">
                              <tr>
                                <td width="80" class="content">{$TR_MONTH}</td>
                                <td width="80" class="content"><select name="month">
                                    {section name=i loop=$MONTH_VALUE}
                                    <option {$MONTH_SELECTED[i]}>{$MONTH_VALUE[i]}</option>
                                    {/section}
                                  </select>
                                </td>
                                <td width="80" class="content">{$TR_YEAR}</td>
                                <td width="80" class="content"><select name="year">
                                    {section name=i loop=$YEAR_VALUE}
                                    <option {$YEAR_SELECTED[i]}>{$YEAR_VALUE[i]}</option>
                                    {/section}
                                  </select>
                                </td>
                                <td class="content"><input name="Submit" type="submit" class="button" value=" {$TR_SHOW} " />
                                </td>
                              </tr>
                            </table>
                            <input type="hidden" name="uaction" value="show" />
                            <input type="hidden" name="name" value="{$VALUE_NAME}" />
                            <input type="hidden" name="rid" value="{$VALUE_RID}" />
                          </form>
                        <br />
                          <table width="100%" cellspacing="3">
                            {if !$DOMAIN_NAME}
                            <tr>
                              <td class="title" colspan="13" width="550" align="center"><span style="color:red;"> {$TR_NO_DOMAINS}</span></td>
                            </tr>
                            {else}
                            <tr>
                              <td height="25" colspan="13" nowrap="nowrap" class="content">{$RESELLER_NAME}</td>
                            </tr>
                            <tr align="center">
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DOMAIN_NAME}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DISK}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_WEB}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_FTP_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SMTP}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_POP3}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SUBDOMAIN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_ALIAS}</b> </td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_MAIL}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_FTP}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SQL_DB}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SQL_USER}</b></td>
                            </tr>
                            {section name=i loop=$DOMAIN_NAME}
                            <tr class="hl">
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b><a href="domain_statistics.php?month={$MONTH[i]}&amp;year={$YEAR[i]}&amp;domain_id={$DOMAIN_ID[i]}" class="link">{$DOMAIN_NAME[i]}</a></b></td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_left.png" width="3" height="20" alt="" /></td>
                                    <td class="statsBar"><table border="0" cellspacing="0" cellpadding="0" align="left">
                                        <tr>
                                          <td class="statsBar"><img src="{$THEME_COLOR_PATH}/images/bars/stats_progress.png" width="{$TRAFF_PERCENT[i]}" height="20" alt="" /></td>
                                        </tr>
                                    </table></td>
                                    <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_right.png" width="3" height="20" alt="" /></td>
                                  </tr>
                                </table>
                                  <b>{$TRAFF_SHOW_PERCENT[i]}&nbsp;%</b><br />
                                {$TRAFF_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_left.png" width="3" height="20" alt="" /></td>
                                    <td class="statsBar"><table border="0" cellspacing="0" cellpadding="0" align="left">
                                        <tr>
                                          <td class="statsBar"><img src="{$THEME_COLOR_PATH}/images/bars/stats_progress.png" width="{$DISK_PERCENT[i]}" height="20" alt="" /></td>
                                        </tr>
                                    </table></td>
                                    <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_right.png" width="3" height="20" alt="" /></td>
                                  </tr>
                                </table>
                                  <b>{$DISK_SHOW_PERCENT[i]}&nbsp;%</b><br />
                                {$DISK_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$WEB[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$FTP[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SMTP[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$POP3[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SUB_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALS_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$MAIL_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$FTP_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SQL_DB_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SQL_USER_MSG[i]}</td>
                            </tr>
                            {/section}
							{/if} 
                          </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td><div align="left"><br />
								{if $PREV_PSI || $PREV_PSI===0}
								<a href="user_statistics.php?psi={$PREV_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
								{else}
								<img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
								{/if}
                                &nbsp;
                                {if $NEXT_PSI}
                                <a href="user_statistics.php?psi={$NEXT_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
                                {else}
                                <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
                                {/if}
                              </div></td>
                              <td><div align="right"><br />
								{if $PREV_PSI || $PREV_PSI===0}
                                <a href="user_statistics.php?psi={$PREV_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
								{else}
                                <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
								{/if}
                                &nbsp;
                                {if $NEXT_PSI}
                                <a href="user_statistics.php?psi={$NEXT_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
								{else}
                                <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
								{/if}
                              </div></td>
                            </tr>
                        </table>
                        <!-- EDP: props_list -->
                      </td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_stats.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_RESELLER_STATISTICS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top">{if $MESSAGE}
                            <table width="100%" border="0" cellspacing="5" cellpadding="5">
                             <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
                             </tr>
                            </table>
                           {/if}
                          {if $RESELLER_NAME}
                          <form action="reseller_statistics.php?psi={$POST_PREV_PSI}" method="post" name="rs_frm" id="rs_frm">
                            <table width="100%">
                              <tr>
                                <td width="40">&nbsp;</td>
                                <td width="69" class="content">{$TR_MONTH}</td>
                                <td width="64" class="content"><select name="month">
                                    {section name=i loop=$MONTH_VALUE}
                                    <option {$MONTH_SELECTED[i]}>{$MONTH_VALUE[i]}</option>
                                    {/section}
                                  </select>
                                </td>
                                <td width="65" class="content">{$TR_YEAR}</td>
                                <td width="72" class="content"><select name="year">
                                    {section name=i loop=$YEAR_VALUE}
                                    <option {$YEAR_SELECTED[i]}>{$YEAR_VALUE[i]}</option>
                                    {/section}
                                  </select>
                                </td>
                                <td class="content"><input name="Submit" type="submit" class="button" value="{$TR_SHOW}" />
                                </td>
                              </tr>
                            </table>
                            <input type="hidden" name="uaction" value="show" />
                          </form>
                        <br />
                          <table width="100%" cellspacing="3">
                            <tr align="center">
                              <td width="20" nowrap="nowrap">&nbsp;</td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_RESELLER_NAME}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DISK}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DOMAIN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SUBDOMAIN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_ALIAS}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_MAIL}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_FTP}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SQL_DB}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SQL_USER}</b></td>
                            </tr>
                            {section name=i loop=$RESELLER_NAME}
                            <tr class="hl">
                              <td nowrap="nowrap" align="center">&nbsp;</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b><a href="reseller_user_statistics.php?rid={$RESELLER_ID[i]}&amp;name={$RESELLER_NAME[i]}&amp;month={$MONTH[i]}&amp;year={$YEAR[i]}" title="{$RESELLER_NAME[i]}" class="link">{$RESELLER_NAME[i]}</a></b></td>
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
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$DMN_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SUB_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALS_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$MAIL_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$FTP_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SQL_DB_MSG[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SQL_USER_MSG[i]}</td>
                            </tr>
                            {/section}
                          </table>
                        {/if}
                          <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="30">&nbsp;</td>
                              <td><div align="left"><br />
								{if $PREV_PSI || $PREV_PSI===0}
								<a href="reseller_statistics.php?psi={$PREV_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
								{else}
								<img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
								{/if}
                                &nbsp;
                                {if $NEXT_PSI}
                                <a href="reseller_statistics.php?psi={$NEXT_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
                                {else}
                                <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
                                {/if}
                              </div></td>
                              <td><div align="right"><br />
								{if $PREV_PSI || $PREV_PSI===0}
                                <a href="reseller_statistics.php?psi={$PREV_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
								{else}
                                <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
								{/if}
                                &nbsp;
                                {if $NEXT_PSI}
                                <a href="reseller_statistics.php?psi={$NEXT_PSI}&amp;month={$MONTH}&amp;year={$YEAR}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
								{else}
                                <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
								{/if}
                              </div></td>
                            </tr>
                        </table></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

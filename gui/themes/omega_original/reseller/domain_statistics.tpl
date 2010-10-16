<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_stats.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_DOMAIN_STATISTICS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="domain_statistics_frm" method="post" action="domain_statistics.php">
                          <table width="100%">
                            <tr>
                              <td width="80" class="content">{$TR_MONTH}</td>
                              <td width="80" class="content"><span class="content2"><select name="month">
                                    {section name=i loop=$MONTH_VALUE}
                                    <option {$MONTH_SELECTED[i]}>{$MONTH_VALUE[i]}</option>
                                    {/section}
                                </select></span></td>
                              <td width="80" class="content">{$TR_YEAR}</td>
                              <td width="80" class="content"><span class="content2"><select name="year">
                                    {section name=i loop=$YEAR_VALUE}
                                    <option {$YEAR_SELECTED[i]}>{$YEAR_VALUE[i]}</option>
                                    {/section}
                                </select></span></td>
                              <td class="content"><input name="Submit" type="submit" class="button" value="{$TR_SHOW}" /></td>
                            </tr>
                          </table>
                        <table width="100%">
                            <tr align="center">
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DAY}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_WEB_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_FTP_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SMTP_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_POP3_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_ALL_TRAFFIC}</b></td>
                            </tr>
                                    {section name=i loop=$DATE}
                                    <tr class="hl">
                                      <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b>{$DATE[i]}</b></td>
                                      <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$WEB_TRAFFIC[i]}</td>
                                      <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$FTP_TRAFFIC[i]}</td>
                                      <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SMTP_TRAFFIC[i]}</td>
                                      <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$POP3_TRAFFIC[i]}</td>
                                      <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALL_TRAFFIC[i]}</td>
                                    </tr>
                                    {/section}
                            <tr>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$ALL_WEB_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$ALL_FTP_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$ALL_SMTP_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$ALL_POP3_TRAFFIC}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$ALL_ALL_TRAFFIC}</b></td>
                            </tr>
                          </table>
                        <!-- end of content -->
                          <input name="uaction" type="hidden" value="show_traff" />
                          <input type="hidden" name="domain_id" value="{$DOMAIN_ID}" />
                      </form></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

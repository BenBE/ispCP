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
                              <td width="80" class="content"><select name="month">
                                  {section name=i loop=$MONTH}
                                  <option {$MONTH_SELECTED[i]}>{$MONTH[i]}</option>
                                  {/section}
                                </select></td>
                              <td width="80" class="content">{$TR_YEAR}</td>
                              <td width="80" class="content"><select name="year">
                                  {section name=i loop=$YEAR}
                                  <option {$YEAR_SELECTED[i]}>{$YEAR[i]}</option>
                                  {/section}
                                </select></td>
                              <td class="content"><input name="Submit" type="submit" class="button" value="{$TR_SHOW}" />
                              </td>
                            </tr>
                          </table>
                        <table width="100%" cellspacing="3">
                            <tr align="center">
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DATE}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_WEB_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_FTP_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SMTP_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_POP_TRAFF}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SUM}</b></td>
                            </tr>
                            {if $MESSAGE}
                            <tr>
                              <td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <!-- BDP: traff_list -->
                            {section name=i loop=$DATE}
                            <tr class="hl">
                              <td class="{$CONTENT[i]}" nowrap="nowrap" align="center">{$DATE[i]}</td>
                              <td class="{$CONTENT[i]}" nowrap="nowrap" align="center" valign="top">{$WEB_TRAFF[i]}</td>
                              <td class="{$CONTENT[i]}" nowrap="nowrap" align="center" valign="top">{$FTP_TRAFF[i]}</td>
                              <td class="{$CONTENT[i]}" nowrap="nowrap" align="center" valign="top">{$SMTP_TRAFF[i]}</td>
                              <td class="{$CONTENT[i]}" nowrap="nowrap" align="center" valign="top">{$POP_TRAFF[i]}</td>
                              <td class="{$CONTENT[i]}" nowrap="nowrap" align="center">{$SUM_TRAFF[i]}</td>
                            </tr>
                            {/section}
                            <tr>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center" valign="top"><b>{$WEB_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center" valign="top"><b>{$FTP_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center" valign="top"><b>{$SMTP_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center" valign="top"><b>{$POP_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$SUM_ALL}</b></td>
                            </tr>
                            <!-- EDP: traff_list -->
                          </table>
                        <!-- end of content -->
                          <input name="uaction" type="hidden" value="show_traff" /></form></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

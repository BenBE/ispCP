<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_stats.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_SERVER_STATISTICS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><form action="server_statistic.php" method="post" name="reseller_user_statistics" id="reseller_user_statistics">
                          <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="45">&nbsp;</td>
                              <td width="80" class="content"><label for="month">{$TR_MONTH}</label></td>
                              <td width="80" class="content"><select name="month" id="month">
                                  {section name=i loop=$MONTH_VALUE}
                                  <option {$MONTH_SELECTED[i]}>{$MONTH_VALUE[i]}</option>
                                  {/section}
                                </select>
                              </td>
                              <td width="80" class="content"><label for="year">{$TR_YEAR}</label></td>
                              <td width="80" class="content"><select name="year" id="year">
                                  {section name=i loop=$YEAR_VALUE}
                                  <option {$YEAR_SELECTED[i]}>{$YEAR_VALUE[i]}</option>
                                  {/section}
                                </select>
                              </td>
                              <td align="left" class="content"><input name="Submit" type="submit" class="button" value="  {$TR_SHOW}  " />
                              </td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="change_data" />
                        </form>
                          <br />
                          <table width="100%">
                            <tr align="center">
                              <td width="35" nowrap="nowrap">&nbsp;</td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DAY}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_WEB_IN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_WEB_OUT}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SMTP_IN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_SMTP_OUT}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_POP_IN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_POP_OUT}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_OTHER_IN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_OTHER_OUT}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_ALL_IN}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_ALL_OUT}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" height="25"><b>{$TR_DAY}</b></td>
                            </tr>
                            {section name=i loop=$WEB_IN}
                            <tr class="hl">
                              <td align="center">&nbsp;</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b><a href="server_statistic_day.php?year={$YEAR[i]}&amp;month={$MONTH[i]}&amp;day={$DAY[i]}" class="link">{$DAY[i]}</a></b></td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$WEB_IN[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$WEB_OUT[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SMTP_IN[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$SMTP_OUT[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$POP_IN[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$POP_OUT[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$OTHER_IN[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$OTHER_OUT[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALL_IN[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALL_OUT[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center">{$ALL[i]}</td>
                              <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b><a href="server_statistic_day.php?year={$YEAR[i]}&amp;month={$MONTH[i]}&amp;day={$DAY[i]}" class="link">{$DAY[i]}</a></b></td>
                            </tr>
                            {/section}
                            <tr>
                              <td nowrap="nowrap" align="center">&nbsp;</td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALL}</b></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$WEB_IN_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$WEB_OUT_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$SMTP_IN_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$SMTP_OUT_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$POP_IN_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$POP_OUT_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$OTHER_IN_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$OTHER_OUT_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$ALL_IN_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$ALL_OUT_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><span class="content2"><strong>{$ALL_ALL}</strong></span></td>
                              <td class="content3" nowrap="nowrap" align="center"><b>{$TR_ALL}</b></td>
                            </tr>
                        </table></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

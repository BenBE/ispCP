<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_stats.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_SERVER_DAY_STATISTICS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><table>
                          <tr>
                            <td width="40" nowrap="nowrap">&nbsp;</td>
                            <td height="25" colspan="13" nowrap="nowrap" class="content">{$TR_YEAR} {$YEAR}&nbsp;&nbsp;&nbsp;&nbsp; {$TR_MONTH} {$MONTH}&nbsp;&nbsp;&nbsp;{$TR_DAY} {$DAY}</td>
                          </tr>
                          <tr align="center">
                            <td nowrap="nowrap">&nbsp;</td>
                            <td class="content3" nowrap="nowrap" height="25"><b>{$TR_HOUR}</b></td>
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
                            <td class="content3" nowrap="nowrap" height="25"><b>{$TR_HOUR}</b></td>
                          </tr>
                          {section name=i loop=$HOUR}
                          <tr class="hl">
                            <td nowrap="nowrap" align="center">&nbsp;</td>
                            <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b>{$HOUR[i]}</b></td>
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
                            <td class="{$ITEM_CLASS[i]}" nowrap="nowrap" align="center"><b>{$HOUR[i]}</b></td>
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

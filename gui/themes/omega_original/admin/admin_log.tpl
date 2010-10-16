<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_adminlog.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_ADMIN_LOG}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form name="admin_lod" method="post" action="admin_log.php">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr align="left">
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="title"><span class="message">{$PAG_MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content3"><b>{$TR_DATE}</b></td>
                              <td class="content3"><b>{$TR_MESSAGE}</b></td>
                            </tr>
                            {section name=i loop=$ROW_CLASS}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="{$ROW_CLASS[i]}">{$DATE[i]}</td>
                              <td class="{$ROW_CLASS[i]}">{$MESSAGE[i]}</td>
                            </tr>
                            {/section}
                          </table>
                        <div align="right"><br />
                          {if $PREV_PSI || $PREV_PSI===0}
                          <a href="admin_log.php?psi={$PREV_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
                          {else}
                          <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
                          {/if}
                          &nbsp;
                          {if $NEXT_PSI}
                          <a href="admin_log.php?psi={$NEXT_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
                          {else}
                          <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
                          {/if}
                        </div>
                        {if $ROW_CLASS}
                          <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                              <td width="80">&nbsp;</td>
                              <td><label for="uaction_clear">{$TR_CLEAR_LOG_MESSAGE}</label>
                                <select name="uaction_clear" id="uaction_clear">
                                    <option value="0" selected="selected">{$TR_CLEAR_LOG_EVERYTHING}</option>
                                    <option value="2">{$TR_CLEAR_LOG_LAST2}</option>
                                    <option value="4">{$TR_CLEAR_LOG_LAST4}</option>
                                    <option value="12">{$TR_CLEAR_LOG_LAST12}</option>
                                    <option value="26">{$TR_CLEAR_LOG_LAST26}</option>
                                    <option value="52">{$TR_CLEAR_LOG_LAST52}</option>
                                </select>
                                <input name="Submit" type="submit" class="button" value="  {$TR_CLEAR_LOG}  " /></td>
                            </tr>
                          </table>
                        {/if}
                          <input type="hidden" name="uaction" value="clear_log" />
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

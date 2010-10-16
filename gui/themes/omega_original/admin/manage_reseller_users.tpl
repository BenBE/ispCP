<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users2.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_USER_ASSIGNMENT}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form action="manage_reseller_users.php" method="post" name="admin_user_assignment" id="admin_user_assignment">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="40">&nbsp;</td>
                              <td><table width="100%" cellpadding="5" cellspacing="5">
                                  {if $MESSAGE}
                                  <tr>
                                    <td colspan="3" class="title"><span class="message">{$MESSAGE}</span></td>
                                  </tr>
                                  {/if}
                                  <tr>
                                    <td colspan="3"><b>{$TR_FROM_RESELLER}</b>
                                        <select name="src_reseller" onChange="return sbmt(document.forms[0],'change_src');;">
                                          {section name=i loop=$SRC_RSL_VALUE}
                                          <option {$SRC_RSL_SELECTED[i]} value="{$SRC_RSL_VALUE[i]}">{$SRC_RSL_OPTION[i]}</option>
                                          {/section}
                                        </select>
                                    </td>
                                  </tr>
                                  {if $RSL_CLASS}
                                  <tr>
                                    <td class="content3" width="80" align="center"><b>{$TR_NUMBER}</b></td>
                                    <td class="content3" width="80" align="center"><b>{$TR_MARK}</b></td>
                                    <td class="content3"><b>{$TR_USER_NAME}</b></td>
                                  </tr>
                                  {section name=i loop=$RSL_CLASS}
                                  <tr class="hl">
                                    <td class="{$RSL_CLASS[i]}" width="80" align="center">{$NUMBER[i]}</td>
                                    <td class="{$RSL_CLASS[i]}" width="80" align="center"><input type="checkbox" name="{$CKB_NAME[i]}" />
                                    </td>
                                    <td class="{$RSL_CLASS[i]}">{$USER_NAME[i]}</td>
                                  </tr>
                                  {/section}
                                  {/if}
                                </table>
                                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="200"><b>{$TR_TO_RESELLER}</b>
                                          <select name="dst_reseller">
                                            {section name=i loop=$DST_RSL_VALUE}
                                            <option {$DST_RSL_SELECTED[i]} value="{$DST_RSL_VALUE[i]}">{$DST_RSL_OPTION[i]}</option>
                                            {/section}
                                          </select>
                                      </td>
                                      <td><input name="Submit" type="submit" class="button" value="  {$TR_MOVE}  " />
                                      </td>
                                    </tr>
                                  </table>
                                <input type="hidden" name="uaction" value="move_user" /></td>
                            </tr>
                          </table>
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users2.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_RESELLER_ASSIGNMENT}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form action="manage_reseller_owners.php" method="post" name="admin_reseller_assignment" id="admin_reseller_assignment">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="4" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            {if $RSL_CLASS}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content3" width="50" align="center"><b>{$TR_NUMBER}</b></td>
                              <td class="content3" width="80" align="center"><b>{$TR_MARK}</b></td>
                              <td class="content3" width="200"><b>{$TR_RESELLER_NAME}</b></td>
                              <td class="content3"><b>{$TR_OWNER}</b></td>
                            </tr>
                            {section name=i loop=$RSL_CLASS}
                            <tr class="hl">
                              <td width="25" align="center">&nbsp;</td>
                              <td class="{$RSL_CLASS[i]}" width="50" align="center">{$NUMBER[i]}</td>
                              <td class="{$RSL_CLASS[i]}" width="80" align="center"><input type="checkbox" name="{$CKB_NAME[i]}" />
                              </td>
                              <td class="{$RSL_CLASS[i]}" width="200">{$RESELLER_NAME[i]}</td>
                              <td class="{$RSL_CLASS[i]}">{$OWNER[i]}</td>
                            </tr>
                            {/section}
                            {/if}
                            <tr>
                              <td colspan="4" align="right">{$TR_TO_ADMIN}
                                {if $VALUE}
                                  <select name="dest_admin">
                                    {section name=i loop=$VALUE}
                                    <option {$SELECTED[i]} value="{$VALUE[i]}">{$OPTION[i]}</option>
                                    {/section}
                                  </select>
                                  {/if}
                              </td>
                              <td><input name="Submit" type="submit" class="button" value="{$TR_MOVE}" />
                              </td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="reseller_owner" />
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

<form name="puser_assign" method="post" action="protected_user_assign.php?uname={$UNAME}"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_USER_ASSIGN}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
                    {if $MESSAGE}
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="4" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="3" class="content3"><strong>{$UNAME}</strong></td>
                    </tr>
                    {if $IN_GROUP != 'no'}
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td width="200" class="content2"> {$TR_MEMBER_OF_GROUP}</td>
                      <td class="content"><select name="groups_in">
                          {section name=i loop=$GRP_IN}
                          <option value="{$GRP_IN_ID[i]}">{$GRP_IN[i]}</option>
                          {/section}
                      </select></td>
                      <td class="content"><!-- BDP: remove_button -->
                          <input name="Submit" type="submit" class="button" value="  {$TR_REMOVE}  " onClick="return sbmt(document.forms[0],'remove');" />
                          <!-- EDP: remove_button -->
                      </td>
                    </tr>
                    {/if}
                    {if $NOT_IN_GROUP != 'no'}
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td width="200" class="content2"> {$TR_SELECT_GROUP}</td>
                      <td class="content"><select name="groups">
                          {section name=i loop=$GRP_NAME}
                          <option value="{$GRP_ID[i]}">{$GRP_NAME[i]}</option>
                          {/section}
                        </select>
                      </td>
                      <td class="content"><!-- BDP: add_button -->
                          <input name="Submit" type="submit" class="button" value="  {$TR_ADD}  " onClick="return sbmt(document.forms[0],'add');" />
                          <!-- EDP: add_button -->
                      </td>
                    </tr>
                    {/if}
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="3"><input type="hidden" name="nadmin_name" value="{$UID}" />
                          <input type="hidden" name="uaction" value="" />
                          <input name="Submit" type="submit" class="button" value="  {$TR_BACK}  " onClick="MM_goToURL('parent','protected_user_manage.php');return document.MM_returnValue" />
                      </td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              </table></form>

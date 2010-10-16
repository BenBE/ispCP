<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_htaccess.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_HTACCESS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top">&nbsp;
                    <form name="edit_ftp_acc_frm" method="post" action="protected_areas_add.php">
                      <table width="100%" cellpadding="5" cellspacing="5">
                        <tr>
                          <td width="25" nowrap="nowrap">&nbsp;</td>
                          <td colspan="2" nowrap="nowrap" class="content3"><b>{$TR_PROTECT_DIR}</b></td>
                        </tr>
                        {if $MESSAGE}
                        <tr>
                          <td width="25" nowrap="nowrap">&nbsp;</td>
                          <td colspan="2" nowrap="nowrap" class="title"><span class="message">{$MESSAGE}</span></td>
                        </tr>
                        {/if}
                        <tr>
                          <td nowrap="nowrap">&nbsp;</td>
                          <td colspan="2" nowrap="nowrap" class="content"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="80">{$TR_PATH} </td>
                                <td><input name="other_dir" type="text" class="textinput" id="path" style="width:170px" value="{$PATH}" />
                                    <input type="hidden" name="use_other_dir" />
                                  <a href="#" onClick="showFileTree();" class="link">{$CHOOSE_DIR}</a></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap">&nbsp;</td>
                          <td colspan="2" nowrap="nowrap" class="content"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="80">{$TR_AREA_NAME}</td>
                                <td><input name="paname" type="text" class="textinput" id="paname" style="width:170px" value="{$AREA_NAME}" /></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td width="25" nowrap="nowrap">&nbsp;</td>
                          <td nowrap="nowrap" class="content2"><strong>{$TR_USER}</strong></td>
                          <td nowrap="nowrap" class="content2"><strong>{$TR_GROUPS}</strong></td>
                        </tr>
                        <tr align="center">
                          <td width="25" nowrap="nowrap">&nbsp;</td>
                          <td nowrap="nowrap" class="content"><input type="radio" name="ptype" value="user" {$USER_CHECKED} onFocus="changeType('user');" />
                            {$TR_USER_AUTH}</td>
                          <td nowrap="nowrap" class="content"><input type="radio" name="ptype" value="group" {$GROUP_CHECKED} onFocus="changeType('group');" />
                            {$TR_GROUP_AUTH}</td>
                        </tr>
                        <tr>
                          <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
                          <td align="center" nowrap="nowrap" class="content"><select name="users[]" multiple="multiple" size="5" class="textinput2">
                              {section name=i loop=$USER_LABEL}
                              <option value="{$USER_VALUE[i]}" {$USER_SELECTED[i]}>{$USER_LABEL[i]}</option>
                              {/section}
                            </select>
                          </td>
                          <td align="center" nowrap="nowrap" class="content"><select name="groups[]" multiple="multiple" size="5" class="textinput2">
                              {section name=i loop=$GROUP_LABEL}
                              <option value="{$GROUP_VALUE[i]}" {$GROUP_SELECTED[i]}>{$GROUP_LABEL[i]}</option>
                              {/section}
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <td nowrap="nowrap">&nbsp;</td>
                          <td colspan="2" nowrap="nowrap"><input name="Button" type="button" class="button" value="{$TR_PROTECT_IT}" onClick="return sbmt(document.forms[0],'protect_it');" />
                            &nbsp;&nbsp;&nbsp;
                            {if $UNPROTECT_IT != 'no'}
                            <input name="Button" type="button" class="button" onClick="MM_goToURL('parent','protected_areas_delete.php?id={$CDIR}');return document.MM_returnValue" value="{$TR_UNPROTECT_IT}" />
                            &nbsp;&nbsp;&nbsp;
                            {/if}
                            <br />
                            <br />
                            <input name="Button" type="button" class="button" onClick="MM_goToURL('parent','protected_user_manage.php');return document.MM_returnValue" value="{$TR_MANAGE_USRES}" />
                            &nbsp;&nbsp;&nbsp;
                            <input name="Button" type="button" class="button" onClick="MM_goToURL('parent','protected_areas.php');return document.MM_returnValue" value="{$TR_CANCEL}" />
                          </td>
                        </tr>
                      </table>
                      <input type="hidden" name="sub" value="YES" />
                      <input type="hidden" name="cdir" value="{$CDIR}" />
                      <input type="hidden" name="uaction" value="" />
                  </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

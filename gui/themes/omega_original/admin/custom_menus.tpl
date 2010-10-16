
<script type="text/javascript">
<!--
function action_delete(url, subject) {
	return confirm(sprintf("{$TR_MESSAGE_DELETE}", subject));
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_flash.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_TITLE_CUSTOM_MENUS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><table width="100%" cellpadding="5" cellspacing="5">
                          {if $MESSAGE}
                          <tr>
                            <td width="25">&nbsp;</td>
                            <td colspan="4" class="title"><span class="message">{$MESSAGE}</span></td>
                          </tr>
                          {/if}
                          {if $CONTENT}
                          <tr>
                            <td width="25">&nbsp;</td>
                            <td class="content3"><b>{$TR_MENU_NAME}</b></td>
                            <td class="content3" align="center"><b>{$TR_LEVEL}</b></td>
                            <td colspan="2" align="center" class="content3"><b>{$TR_ACTON}</b></td>
                          </tr>
                          {section name=i loop=$CONTENT}
                          <tr>
                            <td>&nbsp;</td>
                            <td class="{$CONTENT[i]}"><a href="{$LINK[i]}" class="link" target="_blank"><strong>{$MENU_NAME[i]}</strong></a><br />
                              {$LINK[i]}</td>
                            <td class="{$CONTENT[i]}" align="center">{$LEVEL[i]}</td>
                            <td width="100" class="{$CONTENT[i]}" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="custom_menus.php?edit_id={$BTN_ID[i]}" class="link">{$TR_EDIT}</a></td>
                            <td width="100" class="{$CONTENT[i]}" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="custom_menus.php?delete_id={$BTN_ID[i]}" onClick="return action_delete('custom_menus.php?delete_id={$BTN_ID[i]}', '{$MENU_NAME2[i]}')" class="link">{$TR_DELETE}</a></td>
                          </tr>
                          {/section}
                          {/if}
                        </table>
                          <br />
                          <form name="add_new_button_frm" method="post" action="custom_menus.php">
                            {if $ADD_BUTTON != 'no'}
                            <table width="100%" cellpadding="5" cellspacing="5">
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td colspan="2" class="content3"><b>{$TR_ADD_NEW_BUTTON}</b></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_BUTTON_NAME}</td>
                                <td class="content"><input name="bname" type="text" class="textinput" id="bname" style="width:210px" /></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_BUTTON_LINK}</td>
                                <td class="content"><input name="blink" type="text" class="textinput" id="blink" style="width:210px" /></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_BUTTON_TARGET}</td>
                                <td class="content"><input name="btarget" type="text" class="textinput" id="btarget" style="width:210px" /></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_VIEW_FROM}</td>
                                <td class="content"><select name="bview" id="bview">
                                    <option value="admin">{$ADMIN}</option>
                                    <option value="reseller">{$RESELLER}</option>
                                    <option value="user">{$USER}</option>
                                    <option value="all">{$RESSELER_AND_USER}</option>
                                </select></td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td colspan="2"><input name="Button" type="button" class="button" value="  {$TR_SAVE}  " onClick="return sbmt(document.forms[0],'new_button');" /></td>
                              </tr>
                            </table>
                            {/if}
                            {if $EDIT_BUTTON != 'no'}
                            <table width="100%" cellpadding="5" cellspacing="5">
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td colspan="2" class="content3"><b>{$TR_EDIT_BUTTON}</b></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_BUTTON_NAME}</td>
                                <td class="content"><input name="bname" type="text" class="textinput" id="bname" style="width:210px" value="{$BUTTON_NAME}" /></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_BUTTON_LINK}</td>
                                <td class="content"><input name="blink" type="text" class="textinput" id="blink" style="width:210px" value="{$BUTTON_LINK}" /></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_BUTTON_TARGET}</td>
                                <td class="content"><input name="btarget" type="text" class="textinput" id="btarget" style="width:210px" value="{$BUTTON_TARGET}" /></td>
                              </tr>
                              <tr>
                                <td width="25">&nbsp;</td>
                                <td width="200" class="content2">{$TR_VIEW_FROM}</td>
                                <td class="content"><select name="bview" id="bview">
                                    <option value="admin" {$ADMIN_VIEW}>{$ADMIN}</option>
                                    <option value="reseller" {$RESELLER_VIEW}>{$RESELLER}</option>
                                    <option value="user" {$USER_VIEW}>{$USER}</option>
                                    <option value="all" {$ALL_VIEW}>{$RESSELER_AND_USER}</option>
                                </select></td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td colspan="2"><input name="Button" type="button" class="button" value="  {$TR_SAVE}  " onClick="return sbmt(document.forms[0],'edit_button');" /></td>
                              </tr>
                            </table>
                            <input type="hidden" name="eid" value="{$EID}" />
                            {/if}
                            <input type="hidden" name="uaction" value="" />
                          </form>
                        <!-- end of content --></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

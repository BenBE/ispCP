<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_CIRCULAR}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form name="admin_email_setup" method="post" action="circular.php">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="content3"><b>{$TR_CORE_DATA}</b></td>
                            </tr>
                            {if $MESSAGE}
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td>&nbsp;</td>
                              <td class="content2">{$TR_SEND_TO}</td>
                              <td class="content"><select name="rcpt_to">
                                  <option value="usrs">{$TR_ALL_USERS}</option>
                                  <option value="rslrs">{$TR_ALL_RESELLERS}</option>
                                  <option value="usrs_rslrs">{$TR_ALL_USERS_AND_RESELLERS}</option>
                              </select></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="content2" width="200">{$TR_MESSAGE_SUBJECT}</td>
                              <td class="content"><input type="text" name="msg_subject" value="{$MESSAGE_SUBJECT}" style="width:270px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="content2" style="width:200px; vertical-align:top;">{$TR_MESSAGE_TEXT}</td>
                              <td class="content"><textarea name="msg_text" style="width:80%" class="textinput2" cols="80" rows="20">{$MESSAGE_TEXT}</textarea></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2" class="content3"><b>{$TR_ADDITIONAL_DATA}</b></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_SENDER_EMAIL}</td>
                              <td class="content"><input type="text" name="sender_email" value="{$SENDER_EMAIL}" style="width:270px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_SENDER_NAME}</td>
                              <td class="content"><input type="text" name="sender_name" value="{$SENDER_NAME}" style="width:270px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_SEND_MESSAGE}" /></td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="send_circular" />
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

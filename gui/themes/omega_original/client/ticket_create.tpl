<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_NEW_TICKET}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="question_frm" method="post" action="ticket_create.php">
                          <table width="100%" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td class="content2" width="150">{$TR_URGENCY}</td>
                              <td class="content"><select name="urgency">
                                  <option value="1" {$OPT_URGENCY_1}>{$TR_LOW}</option>
                                  <option value="2" {$OPT_URGENCY_2}>{$TR_MEDIUM}</option>
                                  <option value="3" {$OPT_URGENCY_3}>{$TR_HIGH}</option>
                                  <option value="4" {$OPT_URGENCY_4}>{$TR_VERI_HIGH}</option>
                                </select>
                              </td>
                            </tr>
                            <tr>
                              <td class="content2" width="150">{$TR_SUBJECT}</td>
                              <td class="content"><input type="text" name="subj" style="width:80%" class="textinput" value="{$SUBJECT}" />
                              </td>
                            </tr>
                            <tr>
                              <td class="content2" width="150">{$TR_YOUR_MESSAGE}</td>
                              <td class="content"><textarea name="user_message" style="width:80%" class="textinput2" cols="80" rows="12">{$USER_MESSAGE}</textarea>
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_SEND_MESSAGE}" />
                                  <input name="uaction" type="hidden" value="send_msg" /></td>
                            </tr>
                          </table>
                        <!-- end of content -->
                      </form></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

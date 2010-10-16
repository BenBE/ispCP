<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_EDIT_MAIL_AUTORESPONDER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="manage_users_common_frm" method="post" action="mail_autoresponder_enable.php">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td nowrap="nowrap" class="content2">{$TR_ARSP_MESSAGE}</td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content"><textarea name="arsp_message" cols="50" rows="15" style="width:80%">{$ARSP_MESSAGE}</textarea>
                              </td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="enable_arsp" />
                          <input type="hidden" name="id" value="{$ID}" />
                          <input name="Submit" type="submit" class="button" value="{$TR_ENABLE}" />
                          <input type="button" name="Submit2" value="{$TR_CANCEL}" class="button" onClick="location = 'mail_accounts.php'" />
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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_EMAIL_SETUP}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="admin_email_setup" method="post" action="settings_welcome_mail.php">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_MESSAGE_TEMPLATE_INFO}</b></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_USER_LOGIN_NAME}</td>
                        <td class="content">{ldelim}USERNAME{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_USER_PASSWORD}</td>
                        <td class="content">{ldelim}PASSWORD{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_USER_REAL_NAME}</td>
                        <td class="content">{ldelim}NAME{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_USERTYPE}</td>
                        <td class="content">{ldelim}USERTYPE{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_BASE_SERVER_VHOST}</td>
                        <td class="content">{ldelim}BASE_SERVER_VHOST{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_BASE_SERVER_VHOST_PREFIX}</td>
                        <td class="content">{ldelim}BASE_SERVER_VHOST_PREFIX{rdelim}</td>
                      </tr>
                    </table>
                  <br />
                    <table width="100%" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_MESSAGE_TEMPLATE}</b></td>
                      </tr>
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2" width="200">{$TR_SUBJECT}</td>
                        <td class="content"><input type="text" name="auto_subject" value="{$SUBJECT_VALUE}" style="width:90%" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2" style="width:200px;vertical-align:top;">{$TR_MESSAGE}</td>
                        <td class="content"><textarea name="auto_message" style="width:90%" class="textinput2" cols="80" rows="20">{$MESSAGE_VALUE}</textarea>
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_SENDER_EMAIL}</td>
                        <td class="content">{$SENDER_EMAIL_VALUE} </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_SENDER_NAME}</td>
                        <td class="content">{$SENDER_NAME_VALUE}</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_APPLY_CHANGES}" /></td>
                      </tr>
                    </table>
                  <input type="hidden" name="uaction" value="email_setup" />
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

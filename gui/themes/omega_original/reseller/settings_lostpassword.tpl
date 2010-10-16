<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_LOSTPW_EMAIL}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form action="settings_lostpassword.php" method="post" name="frmlostpassword" id="frmlostpassword">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="4" class="content3"><b>{$TR_MESSAGE_TEMPLATE_INFO}</b></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="48%" colspan="2" class="content3">{$TR_ACTIVATION_EMAIL}</td>
                        <td colspan="2" class="content3">{$TR_PASSWORD_EMAIL}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="24%" class="content2">{$TR_USER_LOGIN_NAME}</td>
                        <td width="24%" class="content">{ldelim}USERNAME{rdelim}</td>
                        <td width="24%" class="content2">{$TR_USER_LOGIN_NAME}</td>
                        <td class="content">{ldelim}USERNAME{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_LOSTPW_LINK}</td>
                        <td class="content">{ldelim}LINK{rdelim}</td>
                        <td class="content2">{$TR_USER_PASSWORD}</td>
                        <td class="content">{ldelim}PASSWORD{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_USER_REAL_NAME}</td>
                        <td class="content">{ldelim}NAME{rdelim}</td>
                        <td class="content2">{$TR_USER_REAL_NAME}</td>
                        <td class="content">{ldelim}NAME{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_BASE_SERVER_VHOST}</td>
                        <td class="content">{ldelim}BASE_SERVER_VHOST{rdelim}</td>
                        <td class="content2">{$TR_BASE_SERVER_VHOST}</td>
                        <td class="content">{ldelim}BASE_SERVER_VHOST{rdelim}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_BASE_SERVER_VHOST_PREFIX}</td>
                        <td class="content">{ldelim}BASE_SERVER_VHOST_PREFIX{rdelim}</td>
                        <td class="content2">{$TR_BASE_SERVER_VHOST_PREFIX}</td>
                        <td class="content">{ldelim}BASE_SERVER_VHOST_PREFIX{rdelim}</td>
                      </tr>
                    </table>
                  <br />
                    <table width="100%" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="3" class="content3"><b>{$TR_MESSAGE_TEMPLATE}</b></td>
                      </tr>
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="3" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2" width="200">{$TR_SUBJECT}</td>
                        <td class="content" width="35%"><input name="subject1" type="text" class="textinput" id="subject1" style="width:90%" value="{$SUBJECT_VALUE1}" /></td>
                        <td class="content" width="35%"><input type="text" name="subject2" value="{$SUBJECT_VALUE2}" style="width:90%" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2" style="width:200px;vertical-align:top;">{$TR_MESSAGE}</td>
                        <td class="content" width="35%"><textarea name="message1" cols="40" rows="20" class="textinput2" id="message1" style="width:90%">{$MESSAGE_VALUE1}</textarea></td>
                        <td class="content" width="35%"><textarea name="message2" cols="40" rows="20" class="textinput2" id="message2" style="width:90%">{$MESSAGE_VALUE2}</textarea></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_SENDER_EMAIL}</td>
                        <td colspan="2" class="content">{$SENDER_EMAIL_VALUE}
                          <input type="hidden" name="sender_email" value="{$SENDER_EMAIL_VALUE}" style="width:270px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_SENDER_NAME}</td>
                        <td colspan="2" class="content">{$SENDER_NAME_VALUE}
                          <input type="hidden" name="sender_name" value="{$SENDER_NAME_VALUE}" style="width:270px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="3"><input name="Submit" type="submit" class="button" value="{$TR_APPLY_CHANGES}" /></td>
                      </tr>
                    </table>
                  <input type="hidden" name="uaction" value="apply" />
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

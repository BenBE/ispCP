<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_password.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_CHANGE_PASSWORD}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><form name="client_change_pass_frm" method="post" action="password_change.php">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      {if $MESSAGE}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2"><label for="curr_pass">{$TR_CURR_PASSWORD}</label></td>
                        <td class="content"><input type="password" name="curr_pass" id="curr_pass" value="" style="width:170px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="20">&nbsp;</td>
                        <td width="203" class="content2"><label for="pass">{$TR_PASSWORD}</label></td>
                        <td class="content"><input type="password" name="pass" id="pass" value="" style="width:170px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2"><label for="pass_rep">{$TR_PASSWORD_REPEAT}</label></td>
                        <td width="516" class="content"><input type="password" name="pass_rep" id="pass_rep" value="" style="width:170px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input type="hidden" name="uaction" value="updt_pass" />
                            <input name="Submit" type="submit" class="button" value="{$TR_UPDATE_PASSWORD}" /></td>
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

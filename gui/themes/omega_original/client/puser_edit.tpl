<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_user.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_UPDATE_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top">
                <form name="edit_user" method="post" action="protected_user_edit.php">
                <table width="100%" cellpadding="5" cellspacing="5">
                    {if $MESSAGE}
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="3" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    <tr>
                      <td>&nbsp;</td>
                      <td width="200" class="content2">{$TR_USERNAME}</td>
                      <td class="content">{$UNAME}</td>
                    </tr>
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td class="content2"> {$TR_PASSWORD}</td>
                      <td class="content"><input type="password" name="pass" value="" style="width:170px" class="textinput" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="content2"> {$TR_PASSWORD_REPEAT}</td>
                      <td class="content"><input type="password" name="pass_rep" value="" style="width:170px" class="textinput" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="2"><input type="hidden" name="nadmin_name" value="{$UID}" />
                          <input type="hidden" name="uaction" value="modify_user" />
                          <input name="Submit" type="submit" class="button" value="  {$TR_UPDATE}  " />
                        &nbsp;&nbsp;
                        <input name="Button" type="button" class="button" onClick="MM_goToURL('parent','protected_user_manage.php');return document.MM_returnValue" value="{$TR_CANCEL}" /></td>
                    </tr>
                </table></form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

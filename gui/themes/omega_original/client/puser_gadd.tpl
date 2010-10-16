<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users2.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_GROUP}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top">
                <form name="add_user_group" method="post" action="protected_group_add.php">
				<table width="100%" cellpadding="5" cellspacing="5">
                    {if $MESSAGE}
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="3" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td colspan="3" class="content3">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td width="200" class="content2">{$TR_GROUPNAME}</td>
                      <td colspan="2" class="content"><input name="groupname" type="text" class="textinput" id="groupname" style="width:170px" value="" />
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td colspan="3"><input type="hidden" name="uaction" value="add_group" />
                          <input name="Submit" type="submit" class="button" value="{$TR_ADD_GROUP}" />
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

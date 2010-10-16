
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
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_htaccess.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_HTACCESS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" align="left" cellpadding="5" cellspacing="5">
                    {if $MESSAGE}
                    <tr>
                      <td width="25" nowrap="nowrap">&nbsp;</td>
                      <td colspan="4" nowrap="nowrap" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    {if $AREA_NAME}
                    <tr>
                      <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
                      <td class="content3" nowrap="nowrap"><b>{$TR_HTACCESS}</b></td>
                      <td width="80" align="center" nowrap="nowrap" class="content3"><strong>{$TR_STATUS}</strong></td>
                      <td width="" colspan="2" align="center" nowrap="nowrap" class="content3"><b>{$TR__ACTION}</b></td>
                    </tr>
                    {section name=i loop=$AREA_NAME}
                    <tr class="hl">
                      <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
                      <td class="{$CLASS[i]}" nowrap="nowrap">{$AREA_NAME[i]}<br />
                          <u>{$AREA_PATH[i]}</u></td>
                      <td width="80" class="{$CLASS[i]}" nowrap="nowrap" align="center">{$STATUS[i]}</td>
                      <td width="60" class="{$CLASS[i]}" nowrap="nowrap" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="protected_areas_add.php?id={$PID[i]}" class="link">{$TR_EDIT[i]}</a> </td>
                      <td width="60" class="{$CLASS[i]}" nowrap="nowrap" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="protected_areas_delete.php?id={$PID[i]}" onClick="return action_delete('protected_areas_delete.php?id={$PID[i]}', '{$JS_AREA_NAME[i]}')" class="link">{$TR_DELETE}</a></td>
                    </tr>
                    {/section}
                    {/if}
                    <tr>
                      <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
                      <td colspan="4" nowrap="nowrap"><input name="Button" type="button" class="button" onClick="MM_goToURL('parent','protected_areas_add.php');return document.MM_returnValue" value="{$TR_ADD_AREA}" />
                        &nbsp;&nbsp;&nbsp;
                        <input name="Button2" type="button" class="button" onClick="MM_goToURL('parent','protected_user_manage.php');return document.MM_returnValue" value="{$TR_MANAGE_USRES}" /></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

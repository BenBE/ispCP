<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_tools.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_CRON_MANAGER}</td>
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
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td class="content3"><strong>{$TR_CRONJOBS}</strong></td>
                      <td align="center" class="content3"><strong>{$TR_ACTIVE}</strong></td>
                      <td colspan="2" align="center" class="content3"><strong>{$TR_ACTION}</strong></td>
                    </tr>
                    <tr class="hl">
                      <!-- BDP: cronjobs -->
                      <td nowrap="nowrap">&nbsp;</td>
                      <td nowrap="nowrap" class="{$ITEM_CLASS}"><strong>{$NAME}</strong><br />
                        {$DESCRIPTION}</td>
                      <td width="100" align="center" nowrap="nowrap" class="{$ITEM_CLASS}">{$ACTIVE}</td>
                      <td width="100" nowrap="nowrap" class="{$ITEM_CLASS}"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" style="vertical-align:middle" alt="" /> <a href="cronjobs_edit.php?cron_id={$ID}" class="link">{$TR_EDIT}</a></td>
                      <td width="100" nowrap="nowrap" class="{$ITEM_CLASS}"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="action_delete('cronjobs_delete.php?cron_id={$ID}', '{$NAME}')">{$TR_DELETE}</a></td>
                      <!-- EDP: cronjobs -->
                    </tr>
                    <tr>
                      <td nowrap="nowrap">&nbsp;</td>
                      <td colspan="4"><input name="button" type="button" class="button" onClick="MM_goToURL('parent','cronjobs_add.php');return document.MM_returnValue" value="{$TR_ADD}" /></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

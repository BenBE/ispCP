
<script type="text/javascript">
<!--
function action_delete(url, name) {
	if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", name)))
		return false;
	location = url;
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_ftp.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_FTP_USERS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><table width="100%" cellspacing="7">
                          {if $MESSAGE}
                          <tr>
                            <td colspan="3" nowrap="nowrap" class="title"><span class="message">{$MESSAGE}</span></td>
                          </tr>
                          {/if}
                          {if $FTP_MSG}
                          <tr>
                            <td colspan="3" class="title"><span class="message">{$FTP_MSG}</span></td>
                          </tr>
                          {/if}
                          {if $FTP_ACCOUNT}
                          <tr>
                            <td nowrap="nowrap" class="content3"><b>{$TR_FTP_ACCOUNT}</b></td>
                            <td nowrap="nowrap" class="content3" align="center" colspan="2"><b>{$TR_FTP_ACTION}</b></td>
                          </tr>
                          {section name=i loop=$FTP_ACCOUNT}
                          <tr class="hl">
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}"><span class="content"><img src="{$THEME_COLOR_PATH}/images/icons/ftp_account.png" width="16" height="16" style="vertical-align:middle" alt="" /></span>{$FTP_ACCOUNT[i]}</td>
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="100"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" style="vertical-align:middle" alt="" /> <a href="ftp_edit.php?id={$UID[i]}" class="link">{$TR_EDIT}</a></td>
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="100"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="action_delete('ftp_delete.php?id={$UID[i]}', '{$FTP_ACCOUNT[i]}')">{$TR_DELETE}</a></td>
                          </tr>
                          {/section}
                          <!-- BDP: ftps_total -->
                          <tr>
                            <td colspan="3" align="right" nowrap="nowrap" class="content3">{$TR_TOTAL_FTP_ACCOUNTS}&nbsp;<b>{$TOTAL_FTP_ACCOUNTS}</b></td>
                          </tr>
                          <!-- EDP: ftps_total -->
                          {/if}
                      </table></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

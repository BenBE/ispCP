
<script type="text/javascript">
<!--
function action_delete(url, mailacc) {
	if (url.indexOf("delete")==-1) {
		location = url;
	} else {
		if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", mailacc)))
			return false;
		location = url;
	}
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_CATCHALL_MAIL_USERS}</td>
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
                            <td colspan="4" nowrap="nowrap" class="title"><span class="message">{$MESSAGE}</span></td>
                          </tr>
                          {/if}
                          <tr>
                            <td nowrap="nowrap" class="content3"><b>{$TR_DOMAIN}</b></td>
                            <td nowrap="nowrap" class="content3"><b>{$TR_CATCHALL}</b></td>
                            <td nowrap="nowrap" class="content3" align="center" width="100"><b>{$TR_STATUS}</b></td>
                            <td nowrap="nowrap" class="content3" align="center" width="200"><b>{$TR_ACTION}</b></td>
                          </tr>
                          {if $CATCHALL_MSG}
                          <tr>
                            <td colspan="4" class="title"><span class="message">{$CATCHALL_MSG}</span></td>
                          </tr>
                          {/if}
                          {section name=i loop=$CATCHALL_DOMAIN}
                          <tr>
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}">{$CATCHALL_DOMAIN[i]}</td>
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}">{$CATCHALL_ACC[i]}</td>
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="100">{$CATCHALL_STATUS[i]}</td>
                            <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="200">
                                <!-- BDP: del_icon -->
                                <img src="{$THEME_COLOR_PATH}/images/icons/users.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
                                <!-- EDP: del_icon -->
                              <a href="#" class="link" onClick="action_delete('{$CATCHALL_ACTION_SCRIPT[i]}', '{$CATCHALL_ACC[i]}')">{$CATCHALL_ACTION[i]}</a>
                            </td>
                          </tr>
                          {/section}
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

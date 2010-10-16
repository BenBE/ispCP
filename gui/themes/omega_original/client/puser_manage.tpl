
<script type="text/javascript">
<!--
function action_delete(url, mailacc) {
	if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", mailacc)))
		return false;
	location = url;
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_user.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_USER_MANAGE}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
      {if $USER_MESSAGE}
      <tr>
        <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
        <td class="title" colspan="5"><span class="message">{$USER_MESSAGE}</span></td>
      </tr>
      {/if}
      {if $UNAME}
      <tr>
        <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
        <td nowrap="nowrap" class="content3" colspan="2"><b>{$TR_USERNAME}</b></td>
        <td width="80" nowrap="nowrap" align="center" class="content3"><b>{$TR_STATUS}</b></td>
        <td colspan="3" align="center" nowrap="nowrap" class="content3"><b>{$TR_ACTION}</b></td>
      </tr>
      {section name=i loop=$UNAME}
      <tr class="hl">
        <td nowrap="nowrap" align="center">&nbsp;</td>
        <td nowrap="nowrap" class="content" colspan="2">{$UNAME[i]}</td>
        <td width="80" align="center" nowrap="nowrap" class="content">{$USTATUS[i]}</td>
        <td width="60" class="content" nowrap="nowrap" align="center">
        	<img src="{$THEME_COLOR_PATH}/images/icons/users.png" width="16" height="16" style="vertical-align:middle" alt="" />
        	<a href="protected_user_assign.php?uname={$USER_ID[i]}" class="link">{$TR_GROUP}</a>
        </td>
        <td width="60" class="content" nowrap="nowrap" align="center">
        	<img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
        	<a href="{$USER_EDIT_SCRIPT[i]}" class="link">{$USER_EDIT[i]}</a>
        </td>
        <td width="60" align="center" nowrap="nowrap" class="content">
        	<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
        	<a href="#" class="link" onClick="{$USER_DELETE_SCRIPT[i]}">{$USER_DELETE[i]}</a>
        </td>
      </tr>
      {/section}
      {/if}
      <tr>
        <td>&nbsp;</td>
        <td colspan="5"><input name="Button" type="button" class="button" onClick="MM_goToURL('parent','protected_user_add.php');return document.MM_returnValue" value="{$TR_ADD_USER}" />
          &nbsp;&nbsp; </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users2.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_GROUPS}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
      {if $GROUP_MESSAGE}
      <tr>
        <td nowrap="nowrap">&nbsp;</td>
        <td colspan="5" nowrap="nowrap" class="title"><span class="message">{$GROUP_MESSAGE}</span></td>
      </tr>
      {/if}
      {if $GNAME}
      <tr>
        <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
        <td width="203" nowrap="nowrap" class="content3"><b>{$TR_GROUPNAME}</b></td>
        <td nowrap="nowrap" class="content3"><b>{$TR_GROUP_MEMBERS}</b></td>
        <td nowrap="nowrap" align="center" class="content3"><b>{$TR_STATUS}</b></td>
        <td width="100" colspan="2" align="center" nowrap="nowrap" class="content3"><b>{$TR_ACTION}</b></td>
      </tr>
      {section name=i loop=$GNAME}
      <tr class="hl">
        <td nowrap="nowrap" align="center">&nbsp;</td>
        <td nowrap="nowrap" class="content">{$GNAME[i]}</td>
        <td nowrap="nowrap" class="content">
          {section name=uname loop=$MEMBER[i]}
          {$MEMBER[i][uname]}
          {/section}
        </td>
        <td width="80" align="center" nowrap="nowrap" class="content">{$GSTATUS[i]}</td>
        <td width="100" colspan="2" align="center" nowrap="nowrap" class="content">
        	<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
        	<a href="#" class="link" onClick="{$GROUP_DELETE_SCRIPT[i]}">{$GROUP_DELETE[i]}</a>
        </td>
      </tr>
      {/section}
      {/if}
      <tr>
        <td>&nbsp;</td>
        <td colspan="3"><input name="Button2" type="button" class="button" value="{$TR_ADD_GROUP}" onClick="MM_goToURL('parent','protected_group_add.php');return document.MM_returnValue" />
          &nbsp; </td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

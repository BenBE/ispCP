
<script type="text/javascript">
<!--
function action_delete(url, mailacc) {
	if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", mailacc)))
		return false;
	location = url;
}
//-->
</script>
<style type="text/css">
<!--
.style1 { font-size: 9px }
-->
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_MAIL_USERS}</td>
	</tr>
</table>
			</td>
            <td width="27" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25">&nbsp;</td>
                  <td valign="top"><table width="100%" cellspacing="7">
                    {if $MESSAGE}
                <tr>
                  <td colspan="5" nowrap="nowrap" class="title"><span class="message">{$MESSAGE}</span></td>
                </tr>
                    {/if}
                <!-- BDP: table_list -->
                <tr>
                   <td nowrap="nowrap" class="content3" align="center" width="200"><b>{$TR_MAIL}</b></td>
                   <td nowrap="nowrap" class="content3" align="center" width="210"><b>{$TR_TYPE}</b></td>
                   <td nowrap="nowrap" class="content3" align="center" width="100"><b>{$TR_STATUS}</b></td>
                   <td nowrap="nowrap" class="content3" align="center" width="180" colspan="5"><b>{$TR_ACTION}</b></td>
                </tr>
                <!-- EDP: table_list -->
                {if $MAIL_MSG}
                <tr>
                   <td colspan="5" class="title"><span class="message">{$MAIL_MSG}</span></td>
                </tr>
                {/if}
                {section name=i loop=$MAIL_ACC}
                <tr class="hl">
                   <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" width="200"><img src="{$THEME_COLOR_PATH}/images/icons/mail_icon.png" width="16" height="16" style="vertical-align:middle" alt="" />&nbsp;{$MAIL_ACC[i]}
                   	<!-- BDP: auto_respond -->
			<div style="display: {$AUTO_RESPOND_VIS[i]};">
				<br />
				<span class="style1">
					{$TR_AUTORESPOND}: [&nbsp;&nbsp;
                    <a href="{$AUTO_RESPOND_DISABLE_SCRIPT[i]}" class="link">{$AUTO_RESPOND_DISABLE[i]}</a>&nbsp;&nbsp;
					{if $AUTO_RESPOND_EDIT[i]}<a href="{$AUTO_RESPOND_EDIT_SCRIPT[i]}" class="link">{$AUTO_RESPOND_EDIT[i]}</a>&nbsp;&nbsp;{/if}]
				 </span>
			</div>
			<!-- EDP: auto_respond -->
                      </td>
                   <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" width="210">{$MAIL_TYPE[i]}</td>
                   <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="100">{$MAIL_STATUS[i]}</td>
                   <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="85">
                   	<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="action_delete('{$MAIL_DELETE_SCRIPT[i]}', '{$MAIL_ACC[i]}')">{$MAIL_DELETE[i]}</a>
                   </td>
                   <td nowrap="nowrap" class="{$ITEM_CLASS[i]}" align="center" width="85">
                   	<img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$MAIL_EDIT_SCRIPT[i]}" class="link">{$MAIL_EDIT[i]}</a>
                   	</td>
                    </tr>
                    {/section}
                    {if $TOTAL_MAIL_ACCOUNTS}
                    <tr>
                      <td colspan="5" align="right" nowrap="nowrap" class="content3">{$TR_TOTAL_MAIL_ACCOUNTS}:&nbsp;<b>{$TOTAL_MAIL_ACCOUNTS}</b>/{$ALLOWED_MAIL_ACCOUNTS}</td>
                    </tr>
		            {/if}
		    {if $VL_DEFAULT_EMAILS_BUTTON}
		    <tr>
		    	<td colspan="2">
		    		<form action="mail_accounts.php" method="post" name="showdefault" id="showdefault">
		    			<input type="hidden" name="uaction" value="{$VL_DEFAULT_EMAILS_BUTTON}" />
		    			<input name="Submit" type="submit" class="button" value="{$TR_DEFAULT_EMAILS_BUTTON}" />
		    		</form>
		    	</td>
		    </tr>
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

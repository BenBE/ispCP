<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_support.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_VIEW_SUPPORT_TICKET}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="40">&nbsp;</td>
        <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
          {if $MESSAGE}
          <tr>
            <td class="title"><span class="message">{$MESSAGE}</span></td>
          </tr>
          {/if}
          {if $FROM}
          <tr>
            <td nowrap="nowrap" class="content3">{$TR_TICKET_URGENCY}: {$URGENCY}<br />
              {$TR_TICKET_SUBJECT}: {$SUBJECT}</td>
          </tr>
          {section name=i loop=$FROM}
          <tr>
            <td nowrap="nowrap" class="content2"><span class="content">{$TR_TICKET_FROM}: {$FROM[i]}</span><br />
              {$TR_TICKET_DATE}: {$DATE[i]}</td>
          </tr>
          <tr>
            <td nowrap="nowrap" class="content">{$TICKET_CONTENT[i]}</td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_NEW_TICKET_REPLY}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="40">&nbsp;</td>
        <td valign="top"><form name="question_frm" method="post" action="ticket_view.php?ticket_id={$ID}">
          <table width="100%" cellspacing="5">
            <tr>
              <td colspan="2" class="content"><textarea name="user_message" style="width:80%" class="textinput2" cols="80" rows="20"></textarea>
                      <input name="subject" type="hidden" value="{$SUBJECT}" />
                      <input name="urgency" type="hidden" value="{$URGENCY_ID}" />
              </td>
            </tr>
            <tr>
              <td width="100"><input name="Button" type="button" class="button" value="{$TR_REPLY}" onClick="return sbmt(document.forms[0],'send_msg');" />
              </td>
              <td width="383"><input name="Button" type="button" class="button" value="{$TR_ACTION}" onClick="return sbmt(document.forms[0],'{$ACTION}');" />
              </td>
            </tr>
            {/if}
          </table>
          <!-- end of content -->
          <input name="uaction" type="hidden" value="" />
          <input name="screenwidth" type="hidden" value="{$SCREENWIDTH}" />
        </form></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

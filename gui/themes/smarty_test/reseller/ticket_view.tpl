{foreach from=$tickets_list item=ticket}          
		<tr>
			<td nowrap="nowrap" class="content3">{$TR_TICKET_URGENCY}: {$urgencies[$ticket.ticket_urgency]}<br />
				{$TR_TICKET_SUBJECT}: {$ticket.ticket_subject|escape}
			</td>
		</tr>
	{foreach from=$ticket.items item=item}
          <tr>
            <td nowrap="nowrap" class="content2">
              <span class="content">{$TR_TICKET_FROM}: 
              {$item.from.first_name|escape} {$item.from.last_name|escape} ({$item.from.user_name|escape})</span>
              <br />
              {$TR_TICKET_DATE}: {$item.ticket_date|date_format:$date_format}</td>
          </tr>
          <tr>
            <td nowrap="nowrap" class="content">{$item.ticket_message|escape|nl2br}</td>
          </tr>
	{/foreach}
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
        <td valign="top"><form name="question_frm" method="post" action="ticket_view.php?ticket_id={$ticket.ticket_id}">
          <table width="100%" cellspacing="5">
            <tr>
              <td colspan="2" class="content"><textarea name="user_message" style="width:80%" class="textinput2" cols="80" rows="20"></textarea>
                      <input name="subject" type="hidden" value="{$ticket.ticket_subject|escape}" />
                      <input name="urgency" type="hidden" value="{$urgencies[$ticket.ticket_urgency]}" />
              </td>
            </tr>
            <tr>
              <td width="100"><input name="Button" type="button" class="button" value="{$TR_REPLY}" onclick="return sbmt(document.forms[0],'send_msg');" />
              </td>
              <td width="383"><input name="Button" type="button" class="button" value="{$ticket.tr_action}" onclick="return sbmt(document.forms[0],'{$ticket.action}');" />
              </td>
            </tr>
{/foreach}
          </table>

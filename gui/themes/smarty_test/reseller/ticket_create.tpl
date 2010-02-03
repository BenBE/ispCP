<table style="width: 100%; padding:0;margin:0;" cellspacing="0">
  <tr style="height:95px;">
    <td style="padding-left:30px; width: 100%; background-image: url({$THEME_COLOR_PATH}/images/top/middle_bg.jpg);">{$MAIN_MENU}</td>
    <td style="padding:0;margin:0;text-align: right; width: 73px;vertical-align: top;"><img src="{$THEME_COLOR_PATH}/images/top/middle_right.jpg" width="73" height="95" border="0" alt="" /></td>
  </tr>
  <tr>
    <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
            <tr>
              <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_support.png" width="25" height="25" alt="" /></td>
              <td colspan="2" class="title">{$TR_NEW_TICKET}</td>
            </tr>
        </table></td>
        <td width="27" align="right">&nbsp;</td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40">&nbsp;</td>
              <td valign="top"><form name="question_frm" method="post" action="ticket_create.php">
                  <table width="100%" cellspacing="5">
{if $MESSAGE != ''}
                    <tr>
                      <td colspan="2" class="title"><span class="message">{$MESSAGE|escape}</span></td>
                    </tr>
{/if}
                    <tr>
                      <td class="content2" style="width:200px;">{$TR_URGENCY}</td>
                      <td class="content">{control_input_select name=urgency options=$urgency_options value=$OPT_URGENCY}
                      </td>
                    </tr>
                    <tr>
                      <td class="content2" style="width:200px;">{$TR_SUBJECT}</td>
                      <td class="content">{control_input_text name=subj style="width:80%" value=$SUBJECT}
                      </td>
                    </tr>
                    <tr>
                      <td class="content2" style="width:200px;vertical-align:top;">{$TR_YOUR_MESSAGE}</td>
                      <td class="content"><textarea name="user_message" style="width:80%" class="textinput2" cols="80" rows="12">{$USER_MESSAGE}</textarea>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_SEND_MESSAGE}" />
                          <input name="uaction" type="hidden" value="send_msg" /></td>
                    </tr>
                  </table>
                <!-- end of content -->
              </form></td>
            </tr>
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

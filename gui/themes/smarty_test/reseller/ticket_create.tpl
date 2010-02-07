    <tr>
      <td class="content2" style="width:200px;">{$TR_URGENCY}</td>
      <td class="content">{control_input_select name=urgency options=$urgencies value=$OPT_URGENCY}
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

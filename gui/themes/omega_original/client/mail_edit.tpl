
<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(function(){
		// Tooltips - begin
		$('#fwd_help').ispCPtooltips({ msg:"{$TR_FWD_HELP}" });
		// Tooltips - end
	});

	function begin_js() {
		if (typeof(document.forms[0].elements['mail_forward']) != 'undefined') {
			if (document.forms[0].elements['mail_forward'].checked == false) {
				document.forms[0].elements['forward_list'].disabled = true;
			}
		}
	}

	function changeType(what) {
		if (what == "forward") {
			if (document.forms[0].elements['forward_list'].disabled == true) {
			 	document.forms[0].elements['forward_list'].disabled = false;
			} else {
				document.forms[0].elements['forward_list'].disabled = true;
			}
		}
	}
/*]]>*/
</script>

       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td align="left">
          <table width="100%" cellpadding="5" cellspacing="5">
           <tr>
            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
            <td colspan="2" class="title">{$TR_EDIT_EMAIL_ACCOUNT}</td>
           </tr>
          </table>
         </td>
         <td width="27" align="right">&nbsp;</td>
        </tr>
        <tr>
         <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
            <td width="40">&nbsp;</td>
             <td valign="top">
              <form name="edit_mail_acc_frm" method="post" action="mail_edit.php?id={$MAIL_ID}">
              <table width="100%" cellpadding="3" cellspacing="3">
               {if $MESSAGE}
               <tr>
                <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
               </tr>
               {/if}
               <tr>
                <td class="title">{$EMAIL_ACCOUNT}</td>
               </tr>
              </table>
              {if $NORMAL_MAIL != 'no'}
              <table width="100%" cellpadding="5" cellspacing="5">
               <tr>
                <td width="200" class="content2"><label for="pass">{$TR_PASSWORD}</label></td>
                <td class="content">
                 <input type="password" name="pass" id="pass" value="" style="width:210px" class="textinput" />
                </td>
               </tr>
               <tr>
                <td width="200" class="content2"><label for="pass_rep">{$TR_PASSWORD_REPEAT}</label></td>
                <td class="content">
                 <input type="password" name="pass_rep" id="pass_rep" value="" style="width:210px" class="textinput" />
                </td>
               </tr>
               <tr>
                <td nowrap="nowrap" class="content2" colspan="2">
                 &nbsp;&nbsp;<input type="checkbox" name="mail_forward" id="mail_forward" value="1" {$FORWARD_MAIL_CHECKED} onClick="changeType('forward');" /><label for="mail_forward">{$TR_FORWARD_MAIL}</label>
                </td>
               </tr>
               <tr>
                <td class="content2" style="width:200px;vertical-align:top;">
                 <label for="forward_list">{$TR_FORWARD_TO}</label> <img id="fwd_help" src="{$THEME_COLOR_PATH}/images/icons/help.png" width="16" height="16" alt="" />
                </td>
                <td nowrap="nowrap" class="content">
                 <textarea name="forward_list" id="forward_list" cols="35" rows="10" style="width:400px">{$FORWARD_LIST}</textarea>
                </td>
               </tr>
              </table>
              {/if}
              {if $FORWARD_MAIL != 'no'}
              <table width="100%" cellpadding="5" cellspacing="5">
               <tr>
                <td class="content2" style="width:125px;vertical-align:top;">
                 {$TR_FORWARD_TO} <img id="fwd_help" src="{$THEME_COLOR_PATH}/images/icons/help.png" width="16" height="16" />
                </td>
                <td class="content"><textarea name="forward_list" cols="35" rows="5" style="width:210px">{$FORWARD_LIST}</textarea></td>
               </tr>
              </table>
              {/if}
              <br />
              <input name="Button" type="button" class="button" value="  {$TR_SAVE}  " onClick="return sbmt(document.forms[0],'{$ACTION}');" />
              <input type="hidden" name="id" value="{$MAIL_ID}" />
              <input type="hidden" name="mail_type" value="{$MAIL_TYPE}" />
              <input type="hidden" name="mail_account" value="{$EMAIL_ACCOUNT}" />
              <input type="hidden" name="uaction" value="{$ACTION}" />
              </form>
             </td>
            </tr>
           </table>
          </td>
          <td>&nbsp;</td>
         </tr>
         <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
         </tr>
        </table>
       

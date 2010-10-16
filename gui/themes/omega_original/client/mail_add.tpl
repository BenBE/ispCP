
<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(function(){
		// Tooltips - begin
		$('#fwd_help').ispCPtooltips({ msg:"{$TR_FWD_HELP}" });
		// Tooltips - end
	});

	function changeType() {
		if (document.forms[0].elements['mail_type_normal'].checked == true) {
			document.forms[0].pass.disabled = false;
			document.forms[0].pass_rep.disabled = false;
		} else {
			document.forms[0].pass.disabled = true;
			document.forms[0].pass_rep.disabled = true;
		}
		if (document.forms[0].elements['mail_type_forward'].checked == true) {
			document.forms[0].forward_list.disabled = false;
		} else {
			document.forms[0].forward_list.disabled = true;
		}
	}

	function begin_js() {
		if (document.getElementsByName('als_id').length !== 0) {
			if (document.getElementById('dmn_type2').checked) {
				document.forms[0].als_id.disabled = false;
			} else {
				document.forms[0].als_id.disabled = true;
			}
		}
		if (document.getElementsByName('sub_id').length !== 0) {
			if (document.getElementById('dmn_type3').checked) {
				document.forms[0].sub_id.disabled = false;
			} else {
				document.forms[0].sub_id.disabled = true;
			}
		}
		if (document.getElementsByName('als_sub_id').length !== 0) {
			if (document.getElementById('dmn_type4').checked) {
				document.forms[0].als_sub_id.disabled = false;
			} else {
				document.forms[0].als_sub_id.disabled = true;
			}
		}
//		document.forms[0].pass.disabled = false;
//		document.forms[0].pass_rep.disabled = false;
//		document.forms[0].forward_list.disabled = true;
		changeType();
		document.forms[0].username.focus();
	}

	function changeDom(what) {
		if (document.getElementsByName('als_id').length !== 0) {
			if (what == "alias") {
				document.forms[0].als_id.disabled = false;
			} else {
				document.forms[0].als_id.disabled = true;
			}
		}
		if (document.getElementsByName('sub_id').length !== 0) {
			if (what == "subdom") {
				document.forms[0].sub_id.disabled = false;
			} else  {
				document.forms[0].sub_id.disabled = true;
			}
		}
		if (document.getElementsByName('als_sub_id').length !== 0) {
			if (what == "als_subdom") {
				document.forms[0].als_sub_id.disabled = false;
			} else {
				document.forms[0].als_sub_id.disabled = true;
			}
		}
	}
/*]]>*/
</script>

<style type="text/css">
<!--
.style1 { font-size: 9px }
-->
</style>

	<form name="add_mail_acc_frm" method="post" action="mail_add.php">
	<input type="hidden" name="uaction" value="add_user" />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_email.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_ADD_MAIL_USER}</td>
	</tr>
</table>
			</td>
            <td width="27" align="right">&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="40">&nbsp;</td>
                  <td valign="top">
            <table width="100%" cellpadding="5" cellspacing="5">
              {if $MESSAGE}
              <tr>
                <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
              </tr>
              {/if}
              <tr>
                <td nowrap="nowrap" class="content2" width="200">
                  <label for="username">{$TR_USERNAME}</label>
                </td>
                <td valign="middle" nowrap="nowrap" class="content">
                  <input type="text" name="username" id="username" value="{$USERNAME}" style="width:210px" class="textinput" />
                </td>
              </tr>
              <tr>
                <td nowrap="nowrap" class="content2" width="200">
                  <input type="radio" name="dmn_type" id="dmn_type1" value="dmn" {$MAIL_DMN_CHECKED} onClick="changeDom('real');" />
                  <label for="dmn_type1">{$TR_TO_MAIN_DOMAIN}</label>
                </td>
                <td nowrap="nowrap" class="content" colspan="2">@{$DOMAIN_NAME}</td>
              </tr>
			  {if $TO_ALIAS_DOMAIN != 'no'}
              <tr>
                <td nowrap="nowrap" class="content2" width="200">
                  <input type="radio" name="dmn_type" id="dmn_type2" value="als" {$MAIL_ALS_CHECKED} onClick="changeDom('alias');" />
                  <label for="dmn_type2">{$TR_TO_DMN_ALIAS}</label>
                </td>
                <td nowrap="nowrap" class="content"><select name="als_id">
                    {section name=i loop=$ALS_NAME}
                    <option value="{$ALS_ID[i]}" {$ALS_SELECTED[i]}>@{$ALS_NAME[i]}</option>
                    {/section}
                  </select></td>
              </tr>
			  {/if}
			  {if $TO_SUBDOMAIN != 'no'}
              <tr>
                <td nowrap="nowrap" class="content2" width="200">
                  <input type="radio" name="dmn_type" id="dmn_type3" value="sub" {$MAIL_SUB_CHECKED} onClick="changeDom('subdom');" />
                  <label for="dmn_type3">{$TR_TO_SUBDOMAIN}</label>
                </td>
                <td nowrap="nowrap" class="content"><select name="sub_id">
                    {section name=i loop=$SUB_NAME}
                    <option value="{$SUB_ID[i]}" {$SUB_SELECTED[i]}>@{$SUB_NAME[i]}</option>
                    {/section}
                  </select></td>
              </tr>
			  {/if}
			  {if $TO_ALIAS_SUBDOMAIN != 'no'}
              <tr>
                <td nowrap="nowrap" class="content2" width="200">
                  <input type="radio" name="dmn_type" id="dmn_type4" value="als_sub" {$MAIL_ALS_SUB_CHECKED} onClick="changeDom('als_subdom');" />
                  <label for="dmn_type4">{$TR_TO_ALS_SUBDOMAIN}</label>
                </td>
                <td nowrap="nowrap" class="content"><select name="als_sub_id">
                    {section name=i loop=$ALS_SUB_NAME}
                    <option value="{$ALS_SUB_ID[i]}" {$ALS_SUB_SELECTED[i]}>@{$ALS_SUB_NAME[i]}</option>
                    {/section}
                  </select></td>
              </tr>
			  {/if}
              <tr>
                <td nowrap="nowrap" class="content2" colspan="2">
                  &nbsp;&nbsp;<input type="checkbox" name="mail_type_normal" value="1" onClick="changeType();" {$NORMAL_MAIL_CHECKED} />{$TR_NORMAL_MAIL}</td>
              </tr>
              <tr>
                <td nowrap="nowrap" class="content2" width="200">&nbsp;&nbsp;&nbsp;&nbsp;{$TR_PASSWORD}</td>
                <td nowrap="nowrap" class="content"><input type="password" name="pass" value="" style="width:210px" class="textinput" /></td>
              </tr>
              <tr>
                <td nowrap="nowrap" class="content2" width="200">&nbsp;&nbsp;&nbsp;&nbsp;{$TR_PASSWORD_REPEAT}</td>
                <td nowrap="nowrap" class="content"><input type="password" name="pass_rep" value="" style="width:210px" class="textinput" /></td>
              </tr>
              <tr>
                <td nowrap="nowrap" class="content2" colspan="2">
                  &nbsp;&nbsp;<input type="checkbox" name="mail_type_forward" value="1" {$FORWARD_MAIL_CHECKED} onClick="changeType();" />{$TR_FORWARD_MAIL}</td>
              </tr>
              <tr>
                <td class="content2" style="width:200px;vertical-align:top;">
				  {$TR_FORWARD_TO} <img id="fwd_help" src="{$THEME_COLOR_PATH}/images/icons/help.png" width="16" height="16" alt="" /></td>
                <td nowrap="nowrap" class="content"><textarea name="forward_list" cols="35" rows="10" style="width:400px">{$FORWARD_LIST}</textarea></td>
	          </tr>
              <tr>
             <td colspan="2"><input name="Submit" type="submit" class="button" value=" {$TR_ADD} " /></td>
                </tr>
            </table></td>
          </tr>
            </table></td>
	</tr>
        </table></form>

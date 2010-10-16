
<script type="text/javascript">
<!--
function makeUser() {
	var dname = document.forms[0].elements['ndomain_name'].value;
	dname = dname.toLowerCase();
	dname = dname.replace(/�/gi, "ae");
	dname = dname.replace(/�/gi, "ue");
	dname = dname.replace(/�/gi, "oe");
	dname = dname.replace(/�/gi, "ss");
	document.forms[0].elements['ndomain_mpoint'].value = "/" + dname;
}
function setForwardReadonly(obj){
	if(obj.value == 1) {
		document.forms[0].elements['forward'].readOnly = false;
		document.forms[0].elements['forward_prefix'].disabled = false;
	} else {
		document.forms[0].elements['forward'].readOnly = true;
		document.forms[0].elements['forward'].value = '';
		document.forms[0].elements['forward_prefix'].disabled = true;
	}
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_user.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><form name="add_alias_frm" method="post" action="user_add4.php">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      {if $MESSAGE}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      {if $CLASS}
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content3"><strong>{$TR_DOMAIN_ALIAS}</strong></td>
                        <td class="content3"><strong>{$TR_STATUS}</strong></td>
                      </tr>
                      {section name=i loop=$CLASS}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="{$CLASS[i]}">{$DOMAIN_ALIAS[i]}</td>
                        <td width="100" class="{$CLASS[i]}">{$STATUS[i]}</td>
                      </tr>
                      {/section}
                      {/if}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2">&nbsp;</td>
                      </tr>
                    </table>
                  <table width="100%" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_ADD_ALIAS}</b></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_DOMAIN_NAME}</td>
                        <td class="content"><input name="ndomain_name" type="text" class="textinput" style="width:170px" value="{$DOMAIN}" onBlur="makeUser();" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_MOUNT_POINT}</td>
                        <td class="content"><input name="ndomain_mpoint" type="text" class="textinput" id="ndomain_mpoint" value="{$MP}" style="width:170px" /></td>
                      </tr>
					  <tr>
						<td width="25" nowrap="nowrap">&nbsp;</td>
						<td width="200" nowrap="nowrap" class="content2">{$TR_ENABLE_FWD}</td>
						<td class="content">
						<input type="radio" name="status" {$CHECK_EN} value="1" onChange="setForwardReadonly(this);" /> {$TR_ENABLE}<br />
						<input type="radio" name="status" {$CHECK_DIS} value="0" onChange="setForwardReadonly(this);" /> {$TR_DISABLE}</td>
                      </tr>
                      <tr>
                        <td width="25" nowrap="nowrap">&nbsp;</td>
                        <td width="200" nowrap="nowrap" class="content2">{$TR_FORWARD}</td>
                        <td class="content">
							<select name="forward_prefix" style="vertical-align:middle"{$DISABLE_FORWARD}>
								<option value="{$TR_PREFIX_HTTP}"{$HTTP_YES}>{$TR_PREFIX_HTTP}</option>
								<option value="{$TR_PREFIX_HTTPS}"{$HTTPS_YES}>{$TR_PREFIX_HTTPS}</option>
								<option value="{$TR_PREFIX_FTP}"{$FTP_YES}>{$TR_PREFIX_FTP}</option>
							</select>
							<input name="forward" type="text" class="textinput" id="forward" style="width:170px" value="{$FORWARD}"{$READONLY_FORWARD} />
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2"><input name="Submit" type="submit" class="button" value="  {$TR_ADD}  " />
                          &nbsp;&nbsp;&nbsp;
                          <input name="Button" type="button" class="button" onClick="MM_goToURL('parent','users.php');return document.MM_returnValue" value="  {$TR_GO_USERS}  " />
                        </td>
                      </tr>
                    </table>
                  <input type="hidden" name="uaction" value="add_alias" />
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

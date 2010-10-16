<script type="text/javascript">
<!--
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
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_MANAGE_DOMAIN_ALIAS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="edit_alias_frm" method="post" action="alias_edit.php?edit_id={$ID}">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_EDIT_ALIAS}</b></td>
                      </tr>
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_ALIAS_NAME}</td>
                        <td class="content">{$ALIAS_NAME} </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_DOMAIN_IP}</td>
                        <td class="content">{$DOMAIN_IP}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2" style="vertical-align:top;">{$TR_ENABLE_FWD}</td>
                        <td class="content">
                            <input type="radio" name="status" {$CHECK_EN} value="1" onChange="setForwardReadonly(this);" /> {$TR_ENABLE}<br />
                            <input type="radio" name="status" {$CHECK_DIS} value="0" onChange="setForwardReadonly(this);" /> {$TR_DISABLE}
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_FORWARD}</td>
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
                        <td colspan="2"><input name="Submit" type="submit" class="button" value="  {$TR_MODIFY}  " />
                          &nbsp;&nbsp;&nbsp;
                          <input name="Submit" type="submit" class="button" onClick="MM_goToURL('parent','alias.php');return document.MM_returnValue" value=" {$TR_CANCEL} " /></td>
                      </tr>
                    </table>
                  <input type="hidden" name="uaction" value="modify" />
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

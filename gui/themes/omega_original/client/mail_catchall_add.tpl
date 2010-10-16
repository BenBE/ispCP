
<script type="text/javascript">
<!--
	function changeType(what) {
		if (what == "normal") {
			document.forms[0].mail_id.disabled = false;
			document.forms[0].forward_list.disabled = true;
		} else {
			document.forms[0].mail_id.disabled = true;
			document.forms[0].forward_list.disabled = false;
		}
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
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_CREATE_CATCHALL_MAIL_ACCOUNT}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="create_catchall_frm" method="post" action="mail_catchall_add.php">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr style="display:none;" id="normal_mail_block">
                              <td nowrap="nowrap" class="content2" width="200"><script type="text/javascript">
                              <!--
                              if ("{$NORMAL_MAIL_CHECK}" == 'checked') {
                                  document.getElementById('normal_mail_block').style.display = 'block';
                              }
                              //-->
                              </script><input type="radio" name="mail_type" id="mail_type1" value="normal" {$NORMAL_MAIL} onClick="changeType('normal');" />
                                <label for="mail_type1">{$TR_MAIL_LIST}</label></td>
                              <td nowrap="nowrap" class="content"><select name="mail_id">
                                  {section name=i loop=$MAIL_ID}
                                  <option value="{$MAIL_ID[i]};{$MAIL_ACCOUNT_PUNNY[i]};">{$MAIL_ACCOUNT[i]}</option>
                                  {/section}
                                </select></td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" colspan="2"><input type="radio" name="mail_type" id="mail_type2" value="forward" {$FORWARD_MAIL} onClick="changeType('forward');" />
                                <label for="mail_type2">{$TR_FORWARD_MAIL}</label></td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><label for="forward_list">{$TR_FORWARD_TO}</label></td>
                              <td nowrap="nowrap" class="content"><textarea name="forward_list" id="forward_list" cols="35" rows="5" style="width:210px"></textarea></td>
                            </tr>
                          </table>
                        <input name="Submit" type="submit" class="button" value="{$TR_CREATE_CATCHALL}" />
                          <input type="hidden" name="uaction" value="create_catchall" />
                          <input type="hidden" name="id" value="{$ID}" />
                      </form></td>
                    </tr>
                </table></td>
              </tr>
            </table>


<script type="text/javascript">
<!--
function delete_account(url, name) {
	if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", name)))
		return false;
	location = url;
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_MANAGE_ALIAS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
                	<!-- BDP: table_header -->
                    <tr>
                      <td height="25" colspan="6" nowrap="nowrap"><!-- search starts here-->
                          <form name="search_alias_frm" method="post" action="alias.php?psi={$PSI}">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="40" nowrap="nowrap">&nbsp;</td>
                                <td width="300" nowrap="nowrap" class="content"><input name="search_for" type="text" class="textinput" value="{$SEARCH_FOR}" style="width:140px" />
                                    <select name="search_common" class="textinput">
                                      <option value="alias_name"{$M_DOMAIN_NAME_SELECTED}>{$M_ALIAS_NAME}</option>
                                      <option value="account_name"{$M_ACCOUN_NAME_SELECTED}>{$M_ACCOUNT_NAME}</option>
                                    </select>
                                </td>
                                <td nowrap="nowrap" class="content"><input name="Submit" type="submit" class="button" value="  {$TR_SEARCH}  " />
                                </td>
                              </tr>
                            </table>
                            <input type="hidden" name="uaction" value="go_search" />
                          </form>
                        <!-- search end here -->
					 </td>
					</tr>
                    <tr>
                      <td width="25" align="center" nowrap="nowrap">&nbsp;</td>
                      <td height="25" nowrap="nowrap" class="content3"><b>{$TR_NAME}</b></td>
                      <td height="25" nowrap="nowrap" class="content3"><strong>{$TR_REAL_DOMAIN}</strong></td>
                      <td width="80" height="25" align="center" nowrap="nowrap" class="content3"><b>{$TR_FORWARD}</b></td>
                      <td width="80" height="25" align="center" nowrap="nowrap" class="content3"><b>{$TR_STATUS}</b></td>
                      <td width="80" height="25" align="center" nowrap="nowrap" class="content3"><b>{$TR_ACTION}</b></td>
                    </tr>
                    <!-- EDP: table_header -->
                    {if $MESSAGE}
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    {section name=i loop=$CONTENT}
                    <tr class="hl">
                      <td width="25" align="center">&nbsp;</td>
                      <td class="{$CONTENT[i]}" nowrap="nowrap"><a href="http://www.{$NAME[i]}/" target="_blank" class="link"><img src="{$THEME_COLOR_PATH}/images/icons/domain_icon.png" width="16" height="16" border="0" style="float:left; vertical-align:middle" alt="" /> {$NAME[i]}</a><br />
                        {$ALIAS_IP[i]}</td>
                      <td class="{$CONTENT[i]}" nowrap="nowrap">{$REAL_DOMAIN[i]}<br />
                        {$REAL_DOMAIN_MOUNT[i]}</td>
                      <td align="center" nowrap="nowrap" class="{$CONTENT[i]}">{$FORWARD[i]}</td>
                      <td class="{$CONTENT[i]}" nowrap="nowrap" align="center">{$STATUS[i]}</td>
                      <td class="{$CONTENT[i]}" nowrap="nowrap" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" onClick="delete_account('{$DELETE_LINK[i]}', '{$NAME[i]}')" class="link" title="{$DELETE[i]}">{$DELETE[i]}</a>  - <img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$EDIT_LINK[i]}" class="link" title="{$EDIT[i]}">{$EDIT[i]}</a></td>
                    </tr>
                    {/section}
                  </table>
                    <table width="100%" border="0" cellspacing="3" cellpadding="0">
                      <tr>
                        <td width="30">&nbsp;</td>
                        {if $ALS_ADD_BUTTON != 'no'}<td><input name="Submit" type="submit" class="button" onClick="MM_goToURL('parent','alias_add.php');return document.MM_returnValue" value="   {$TR_ADD_ALIAS}   " /></td>{/if}
        <div align="right"><br />
          {if $PREV_PSI || $PREV_PSI===0}
          <a href="alias.php?psi={$PREV_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
          {else}
          <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
          {/if}
          &nbsp;
          {if $NEXT_PSI}
          <a href="alias.php?psi={$NEXT_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
          {else}
          <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
          {/if}
      </div></td>
                      </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

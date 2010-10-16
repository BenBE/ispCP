
<script type="text/javascript">
<!--
function change_status(dom_id, dmn_name) {
	if (!confirm(sprintf("{$TR_MESSAGE_CHANGE_STATUS}", dmn_name)))
		return false;
	location = ("domain_status_change.php?domain_id=" + dom_id);
}

function delete_account(url, dmn_name) {
	if (!confirm(sprintf("{$TR_MESSAGE_DELETE_ACCOUNT}", dmn_name)))
		return false;
	location = url;
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_MANAGE_USERS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="search_user" method="post" action="users.php">
                    <table width="100%" cellspacing="3">
                      <tr>
                        <td colspan="9" nowrap="nowrap">&nbsp;</td>
                      </tr>
                      {if $MESSAGE}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="8" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                        {/if}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="6"><table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td nowrap="nowrap"><input name="search_for" type="text" class="textinput" value="{$SEARCH_FOR}" style="width:140px" />
                                  <select name="search_common" class="textinput">
                                    <option value="domain_name" {$M_DOMAIN_NAME_SELECTED}>{$M_DOMAIN_NAME}</option>
                                    <option value="customer_id" {$M_CUSTOMER_ID_SELECTED}>{$M_CUSTOMER_ID}</option>
                                    <option value="lname" {$M_LAST_NAME_SELECTED}>{$M_LAST_NAME}</option>
                                    <option value="firm" {$M_COMPANY_SELECTED}>{$M_COMPANY}</option>
                                    <option value="city" {$M_CITY_SELECTED}>{$M_CITY}</option>
                                    <option value="state" {$M_STATE_SELECTED}>{$M_STATE}</option>
                                    <option value="country" {$M_COUNTRY_SELECTED}>{$M_COUNTRY}</option>
                                  </select>
                                  <select name="search_status" class="textinput">
                                    <option value="all" {$M_ALL_SELECTED}>{$M_ALL}</option>
                                    <option value="ok" {$M_OK_SELECTED}>{$M_OK}</option>
                                    <option value="disabled" {$M_SUSPENDED_SELECTED}>{$M_SUSPENDED}</option>
                                  </select></td>
                              <td nowrap="nowrap"><input name="Submit" type="submit" class="button" value=" {$TR_SEARCH} " />
                              </td>
                            </tr>
                        </table></td>
                        <td colspan="5" align="right"><input type="hidden" name="details" value="" />
                            <img src="{$THEME_COLOR_PATH}/images/icons/show_alias.png" width="16" height="16" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="return sbmt_details(document.forms[0],'{$SHOW_DETAILS}');">{$TR_VIEW_DETAILS}</a></td>
                      </tr>
                      {if $NAME}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content3" width="20" align="center"><b>{$TR_USER_STATUS}</b></td>
                        <td class="content3"><b>{$TR_USERNAME}</b></td>
                        <td class="content3" width="90" align="center"><b>{$TR_CREATION_DATE}</b></td>
                        <td class="content3" width="90" align="center"><b>{$TR_EXPIRE_DATE}</b></td>
                        <td class="content3" width="90" align="center"><b>{$TR_DISK_USAGE}</b></td>
                        <td colspan="6" align="center" class="content3"><b>{$TR_ACTION}</b></td>
                      </tr>
                      {section name=i loop=$NAME}
                      <tr class="hl">
                        <td align="center">&nbsp;</td>
                        <td class="{$CLASS_TYPE_ROW[i]}" align="center"><a href="#" onClick="change_status('{$URL_CHANGE_STATUS[i]}', '{$NAME[i]}')"><img src="{$THEME_COLOR_PATH}/images/icons/{$STATUS_ICON[i]}" width="16" height="16" border="0" alt="" /></a></td>
                        <td class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/goto.png" width="16" height="16" border="0" alt="" /> <a href="http://www.{$NAME[i]}/" target="_blank" class="link">{$NAME[i]}</a></td>
                        <td class="{$CLASS_TYPE_ROW[i]}" width="90" align="center">{$CREATION_DATE[i]}</td>
                        <td class="{$CLASS_TYPE_ROW[i]}" width="90" align="center">{$EXPIRE_DATE[i]}</td>
						<td class="{$CLASS_TYPE_ROW[i]}" width="90" align="center">{$DISK_USAGE[i]}</td>
                        <td nowrap="nowrap" width="80" align="center" class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/identity.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="domain_details.php?domain_id={$DOMAIN_ID[i]}" class="link">{$TR_DETAILS}</a></td>
                        {if $EDIT_OPTION}
                        <td nowrap="nowrap" width="80" align="center" class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="domain_edit.php?edit_id={$DOMAIN_ID[i]}" class="link">{$TR_EDIT_DOMAIN}</a></td>
                        <td nowrap="nowrap" width="80" align="center" class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/users.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="user_edit.php?edit_id={$USER_ID[i]}" class="link">{$TR_EDIT_USER}</a></td>
                        {/if}
                        <td nowrap="nowrap" width="80" align="center" class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/stats.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="domain_statistics.php?month={$VL_MONTH}&amp;year={$VL_YEAR}&amp;domain_id={$DOMAIN_ID[i]}" class="link">{$TR_STAT}</a></td>
                        <td nowrap="nowrap" width="80" align="center" class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/details.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="change_user_interface.php?to_id={$USER_ID[i]}" class="link">{$CHANGE_INTERFACE[i]}</a></td>
                        <td nowrap="nowrap" width="80" align="center" class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="domain_delete.php?domain_id={$DOMAIN_ID[i]}" class="link">{$ACTION[i]}</a></td>
                      </tr>
                      {section name=alias loop=$USR_DETAILS[i]}
                      <tr>
                        <td align="center">&nbsp;</td>
                        <td class="content4" align="center">&nbsp;</td>
                        <td colspan="10" class="content4"><img src="{$THEME_COLOR_PATH}/images/icons/goto.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="http://www.{$USR_DETAILS[i][alias]}/" target="_blank" class="link">{$USR_DETAILS[i][alias]}</a>&nbsp;</td>
                      </tr>
                      {/section}
                      {/section}
                      {/if}
                    </table>
                  <input type="hidden" name="uaction" value="go_search" />
                  </form>
                    <div align="right"><br />
                      {if $PREV_PSI || $PREV_PSI===0}
                      <a href="users.php?psi={$PREV_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
                      {else}
                      <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
                      {/if}
                      &nbsp;
                      {if $NEXT_PSI}
                      <a href="users.php?psi={$NEXT_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
                      {else}
                      <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
                      {/if}
                  </div></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

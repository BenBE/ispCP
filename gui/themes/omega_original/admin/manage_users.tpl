<script type="text/javascript">
<!--
function action_status(url, dmn_name) {
  if (!confirm(sprintf("{$TR_MESSAGE_CHANGE_STATUS}", dmn_name)))
    return false;
  location = url;
}

function action_delete(url, dmn_name) {
  if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", dmn_name)))
    return false;
  location = url;
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
    <table width="100%" cellpadding="5" cellspacing="5">
        {if $MESSAGE}
        <tr>
            <td width="25">&nbsp;</td>
            <td colspan="3" class="title"><span class="message">{$MESSAGE}</span></td>
        </tr>
        {/if}
	    <tr>
		    <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users.png" width="25" height="25" alt="" /></td>
		    <td colspan="2" class="title">{$TR_ADMINISTRATORS}</td>
	    </tr>
    </table></td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><!-- BDP: props_list -->
        <table width="100%" cellpadding="5" cellspacing="5">
          {if $ADMIN_MESSAGE}
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="3" class="title"><span class="message">{$ADMIN_MESSAGE}</span></td>
          </tr>
          {else}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content3"><b>{$TR_ADMIN_USERNAME}</b></td>
            <td class="content3"><b>{$TR_CREATED_ON}</b></td>
            <td class="content3" align="center"><b>{$TR_ADMIN_CREATED_BY}</b></td>
            <td colspan="2" align="center" class="content3"><b>{$TR_ADMIN_OPTIONS}</b></td>
          </tr>
          {section name=i loop=$ADMIN_USERNAME}
          <tr class="hl">
            <td width="25">&nbsp;</td>
            <td class="{$ADMIN_CLASS[i]}">{$ADMIN_USERNAME[i]}</td>
            <td class="{$ADMIN_CLASS[i]}" align="center">{$ADMIN_CREATED_ON[i]}</td>
            <td class="{$ADMIN_CLASS[i]}" align="center">{$ADMIN_CREATED_BY[i]}</td>
            <td width="100" class="{$ADMIN_CLASS[i]}" align="center">
              <img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$URL_EDIT_ADMIN[i]}" class="link">{$TR_EDIT}</a>
			</td>
            <td width="100" class="{$ADMIN_CLASS[i]}" align="center">
            {if $ADMIN_DELETE_LINK[i]}
              <img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" onClick="action_delete('{$ADMIN_DELETE_LINK[i].URL_DELETE_ADMIN}', '{$ADMIN_USERNAME[i]}')" class="link">{$TR_DELETE}</a>
            {else}
              -
            {/if}
            </td>
          </tr>
          {/section}
          {/if}
        </table>
      <!-- EDP: props_list -->
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_RESELLERS}</td>
	</tr>
</table></td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellpadding="5" cellspacing="5">
      {if $RSL_MESSAGE}
      <tr>
        <td width="25">&nbsp;</td>
        <td colspan="5" class="title"><span class="message">{$RSL_MESSAGE}</span></td>
      </tr>
      {else}
      <tr>
        <td width="25">&nbsp;</td>
        <td class="content3"><b>{$TR_RSL_USERNAME}</b></td>
        <td width="150" align="center" class="content3"><b>{$TR_CREATED_ON}</b></td>
        <td width="150" align="center" class="content3"><b>{$TR_RSL_CREATED_BY}</b></td>
        <td colspan="3" align="center" class="content3"><b>{$TR_RSL_OPTIONS}</b></td>
      </tr>
      {section name=i loop=$RSL_USERNAME}
      <tr class="hl">
        <td width="25">&nbsp;</td>
        <td class="{$RSL_CLASS[i]}">{$RSL_USERNAME[i]} </td>
        <td class="{$RSL_CLASS[i]}" align="center">{$RESELLER_CREATED_ON[i]}</td>
        <td class="{$RSL_CLASS[i]}" align="center">{$RSL_CREATED_BY[i]}</td>
        <td width="100" align="center" class="{$RSL_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/details.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$URL_CHANGE_INTERFACE[i]}" class="link" title="{$TR_CHANGE_USER_INTERFACE}">{$GO_TO_USER_INTERFACE}</a></td>
        <td width="100" align="center" class="{$RSL_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$URL_EDIT_RSL[i]}" class="link">{$TR_EDIT}</a></td>
        <td width="100" align="center" class="{$RSL_CLASS[i]}">
          {if $RSL_DELETE_LINK[i]}
          <img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" onClick="action_delete('{$RSL_DELETE_LINK[i].URL_DELETE_RSL}', '{$RSL_USERNAME[i]}')" class="link">{$TR_DELETE}</a>
          {/if}
        </td>
      </tr>
      {/section}
      {/if}
    </table>
        <br /></td>
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
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_USERS}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><form action="manage_users.php" method="post" name="search_user" id="search_user">
      <table width="100%" cellpadding="5" cellspacing="5">
        <tr>
          <td width="25">&nbsp;</td>
          <td colspan="6" class="title"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><input name="search_for" type="text" class="textinput" value="{$SEARCH_FOR}" style="width:140px" />
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
              <td><input name="Submit" type="submit" class="button" value="  {$TR_SEARCH}  " /></td>
            </tr>
          </table>
		  </td>
          <td align="right"><input type="hidden" name="details" value="" />
            <img src="{$THEME_COLOR_PATH}/images/icons/show_alias.png" width="16" height="16" style="vertical-align:middle" alt="" /> <a href="#" class="link" onClick="return sbmt_details(document.forms[0],'{$SHOW_DETAILS}');">{$TR_VIEW_DETAILS}</a>
		  </td>
        </tr>
        {if $USR_MESSAGE}
        <tr>
          <td width="25">&nbsp;</td>
          <td colspan="7" class="title"><span class="message">{$USR_MESSAGE}</span></td>
        </tr>
        {else}
        <tr>
          <td width="25">&nbsp;</td>
          <td width="25" align="center" class="content3"><b>{$TR_USER_STATUS}</b></td>
          <td class="content3"><b>{$TR_USR_USERNAME}</b></td>
          <td width="100" align="center" class="content3"><b>{$TR_CREATED_ON}</b></td>
          <td width="100" align="center" class="content3"><b>{$TR_EXPIRES_ON}</b></td>
          <td width="100" align="center" class="content3"><b>{$TR_USR_CREATED_BY}</b></td>
          <td colspan="5" align="center" class="content3"><b>{$TR_USR_OPTIONS}</b></td>
        </tr>
        {section name=i loop=$USR_USERNAME}
        <tr class="hl">
          <td width="25" align="center">&nbsp;</td>
          <td class="{$USR_CLASS[i]}" align="center"><a href="#" onClick="action_status('{$URL_CHANGE_STATUS[i]}', '{$USR_USERNAME[i]}')" class="link"><img src="{$THEME_COLOR_PATH}/images/icons/{$STATUS_ICON[i]}" width="16" height="16" border="0" alt="" /></a></td>
          <td class="{$USR_CLASS[i]}"> <a href="http://www.{$USR_USERNAME[i]}/" target="_blank" class="link"><img src="{$THEME_COLOR_PATH}/images/icons/goto.png" width="16" height="16" border="0" alt="" />{$USR_USERNAME[i]}</a></td>
          <td class="{$USR_CLASS[i]}" align="center">{$USER_CREATED_ON[i]}</td>
          <td class="{$USR_CLASS[i]}" align="center">{$USER_EXPIRES_ON[i]}</td>
          <td class="{$USR_CLASS[i]}" align="center">{$USR_CREATED_BY[i]}</td>
          <td width="100" align="center" class="{$USR_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/identity.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="domain_details.php?domain_id={$USR_DOMAIN_ID[i]}" class="link">{$TR_DETAILS}</a></td>
          <td width="100" align="center" class="{$USR_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/details.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$URL_CHANGE_INTERFACE_USR[i]}" class="link" title="{$TR_CHANGE_USER_INTERFACE}">{$GO_TO_USER_INTERFACE}</a></td>
          {if $EDIT_OPTION}
	  <td width="100" align="center" class="{$USR_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="domain_edit.php?edit_id={$USR_DOMAIN_ID[i]}" class="link">{$TR_EDIT_DOMAIN}</a></td>
          {/if}
          <td width="100" align="center" class="{$USR_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/users.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$URL_EDIT_USR[i]}" class="link">{$TR_EDIT_USR}</a></td>
          <td width="100" align="center" class="{$USR_CLASS[i]}">
              <img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$URL_DELETE_USR[i]}" class="link">{$TR_DELETE}</a>
          </td>
        </tr>
        {section name=alias loop=$USR_DETAILS[i]}
        <tr>
          <td align="center">&nbsp;</td>
          <td class="content4" align="center">&nbsp;</td>
          <td colspan="7" class="content4">&nbsp;<a href="http://www.{$USR_DETAILS[i][alias]}/" target="_blank" class="link"><img src="{$THEME_COLOR_PATH}/images/icons/goto.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> {$USR_DETAILS[i][alias]}</a>&nbsp;</td>
        </tr>
        {/section}
        {/section}
        {/if}
      </table>
      <input type="hidden" name="uaction" value="go_search" />
    </form>
        <div align="right"><br />
          {if $PREV_PSI || $PREV_PSI===0}
          <a href="manage_users.php?psi={$PREV_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
          {else}
          <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
          {/if}
          &nbsp;
          {if $NEXT_PSI}
          <a href="manage_users.php?psi={$NEXT_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
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
</table></td>
				</tr>
			</table>

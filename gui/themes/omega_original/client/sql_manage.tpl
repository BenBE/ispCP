  <script type="text/javascript">
<!--
function action_delete(url, sql) {
    if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", sql)))
        return false;
    location = url;
}
//-->
  </script>

       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td align="left">
          <table width="100%" cellpadding="5" cellspacing="5">
           <tr>
            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_sql.png" width="25" height="25" alt="" /></td>
             <td colspan="2" class="title">{$TR_MANAGE_SQL}</td>
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
              <table width="100%" cellpadding="5" cellspacing="5">
               {if $MESSAGE}
               <tr>
                <td colspan="4" class="title"><span class="message">{$MESSAGE}</span></td>
               </tr>
               {/if}
               {section name=i loop=$DB_NAME}
               <tr>
                <td width="60%" class="content3">&nbsp;&nbsp;<b>{$TR_DATABASE}</b></td>
                <td colspan="3" align="center" class="content3"><b>{$TR_ACTION}</b></td>
               </tr>
               <tr>
                <td height="48" align="left" class="content4">&nbsp;&nbsp;&nbsp;<strong><img src="{$THEME_COLOR_PATH}/images/icons/database_small.png" width="16" height="16" style="vertical-align:middle" alt="" />&nbsp;{$DB_NAME[i]}</strong></td>
                <td colspan="2" width="16%" align="left" class="content4">&nbsp;&nbsp;<img src="{$THEME_COLOR_PATH}/images/icons/add_user.png" width="26" height="16" border="0" style="vertical-align:middle" alt="" />&nbsp;<a href="sql_user_add.php?id={$DB_ID[i]}" class="link">{$TR_ADD_USER}</a></td>
                <td align="left" class="content4">&nbsp;&nbsp;<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />&nbsp;&nbsp;<a href="#" class="link" onClick="action_delete('sql_database_delete.php?id={$DB_ID[i]}', '{$DB_NAME_JS[i]}')">{$TR_DELETE}</a></td>
               </tr>
               {if $DB_MSG[i]}
               <tr>
                <td height="28" colspan="4" class="title"><span class="message">&nbsp;&nbsp;{$DB_MSG[i]}</span></td>
               </tr>
               {/if}
               {section name=user loop=$DB_USERLIST[i]}
               <tr class="hl">
                <td height="48" align="left" class="content">&nbsp;&nbsp;&nbsp;<img src="{$THEME_COLOR_PATH}/images/icons/users.png" width="21" height="21" style="vertical-align:middle" alt="" />&nbsp;{$DB_USERLIST[i][user].DB_USER}</td>
                <td width="14%" align="left" class="content">&nbsp;&nbsp;&nbsp;<img src="{$THEME_COLOR_PATH}/images/icons/pma.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />&nbsp;<a href="pma_auth.php?id={$DB_USERLIST[i][user].USER_ID}" class="link" target="_blank">{$TR_PHP_MYADMIN}</a></td>
                <td align="left" class="content">&nbsp;&nbsp;<img src="{$THEME_COLOR_PATH}/images/icons/change_password.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />&nbsp;<a href="sql_change_password.php?id={$DB_USERLIST[i][user].USER_ID}" class="link">{$TR_CHANGE_PASSWORD}</a></td>
                <td align="left" class="content">&nbsp;&nbsp;<img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />&nbsp;&nbsp;<a href="#" class="link" onClick="action_delete('sql_delete_user.php?id={$DB_USERLIST[i][user].USER_ID}', '{$DB_USERLIST[i][user].DB_USER_JS}')">{$TR_DELETE}</a></td>
               </tr>
               {/section}
               {/section}
              </table>
             </td>
            </tr>
           </table>
          </td>
         </tr>
        </table>
       

        <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td align="left">
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_tools.png" width="25" height="25" alt="" /></td>
             <td colspan="2" class="title">{$TR_WEBTOOLS}</td>
            </tr>
           </table>
          </td>
          <td width="27" align="right">&nbsp;</td>
         </tr>
         <tr>
          <td>
           <table width="100%" cellspacing="7">
		   <tr>
             <td>&nbsp;</td>
             <td class="content">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><p><a href="protected_areas.php"><img src="{$THEME_COLOR_PATH}/images/icons/htaccessicon.png" width="46" height="46" border="0" alt="" /></a></p></td>
                <td><a href="protected_areas.php" class="link">{$TR_HTACCESS}</a><br />
                 {$TR_HTACCESS_TEXT}</td>
               </tr>
              </table>
             </td>
            </tr>
		   <tr>
             <td>&nbsp;</td>
             <td class="content">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><p><a href="protected_user_manage.php"><img src="{$THEME_COLOR_PATH}/images/icons/manage_users_a.png" width="47" height="46" border="0" alt="" /></a></p></td>
                <td><a href="protected_user_manage.php" class="link">{$TR_HTACCESS_USER}</a><br />
                 {$TR_HTACCESS_USER}</td>
               </tr>
              </table>
             </td>
            </tr>
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><a href="error_pages.php"><img src="{$THEME_COLOR_PATH}/images/icons/errordocsicon.png" width="46" height="46" border="0" alt="" /></a></td>
                <td><a href="error_pages.php" class="link">{$TR_ERROR_PAGES}</a><br />
                 {$TR_ERROR_PAGES_TEXT}</td>
               </tr>
              </table>
             </td>
            </tr>
            {if $ACTIVE_BACKUP}
            <tr>
             <td>&nbsp;</td>
             <td class="content">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><a href="backup.php"><img src="{$THEME_COLOR_PATH}/images/icons/backupicon.png" width="46" height="46" border="0" alt="" /></a></td>
                <td><a href="backup.php" class="link">{$TR_BACKUP}</a><br />
                 {$TR_BACKUP_TEXT}</td>
               </tr>
              </table>
             </td>
            </tr>
            {/if}
            {if $ACTIVE_EMAIL}
            <tr>
             <td>&nbsp;</td>
             <td class="content">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><a href="{$WEBMAIL_PATH}" target="{$WEBMAIL_TARGET}"><img src="{$THEME_COLOR_PATH}/images/icons/webmailicon.png" width="46" height="46" border="0" alt="" /></a></td>
                <td><a href="{$WEBMAIL_PATH}" target="{$WEBMAIL_TARGET}" class="link">{$TR_WEBMAIL}</a><br />
                 {$TR_WEBMAIL_TEXT}</td>
               </tr>
              </table>
             </td>
            </tr>
            {/if}
            <tr>
             <td>&nbsp;</td>
             <td class="content">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><a href="{$FILEMANAGER_PATH}" target="{$FILEMANAGER_TARGET}"><img src="{$THEME_COLOR_PATH}/images/icons/filemanagericon.png" width="46" height="46" border="0" alt="" /></a></td>
                <td><a href="{$FILEMANAGER_PATH}" target="{$FILEMANAGER_TARGET}" class="link">{$TR_FILEMANAGER}</a><br />
                 {$TR_FILEMANAGER_TEXT}</td>
               </tr>
              </table>
             </td>
            </tr>
			{if $ACTIVE_AWSTATS}
            <tr>
             <td>&nbsp;</td>
             <td class="content">
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                <td width="65"><a href="{$AWSTATS_PATH}" target="{$AWSTATS_TARGET}"><img src="{$THEME_COLOR_PATH}/images/icons/awstatsicon.png" width="46" height="46" border="0" alt="" /></a></td>
                <td><a href="{$AWSTATS_PATH}" target="{$AWSTATS_TARGET}" class="link">{$TR_AWSTATS}</a><br />
                 {$TR_AWSTATS_TEXT}</td>
               </tr>
              </table>
             </td>
            </tr>
		    {/if}
           </table>
          </td>
          <td>&nbsp;</td>
         </tr>
         <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
         </tr>
        </table>
	   

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_general.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_GENERAL_INFORMATION}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><!-- BDP: props_list -->
        <table width="100%" cellspacing="7" class="hl">
          {if $MESSAGE}
           <tr>
             <td>&nbsp;</td>
             <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
           </tr>
          {/if}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_ACCOUNT_NAME} / {$TR_MAIN_DOMAIN}</td>
            <td width="230" class="content2">{$ACCOUNT_NAME}</td>
          </tr>
          <tr>
	     <td>&nbsp;</td>
	     <td class="content">{$TR_DMN_TMP_ACCESS}</td>
	     <td class="content2"><a href="{$DOMAIN_ALS_URL}" target="_blank">{$DOMAIN_ALS_URL}</a></td> 
	   </tr>
         {if $DMN_EXPIRES}
	     <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_DOMAIN_EXPIRE}</td>
            <td width="230" class="content2">{$DMN_EXPIRES} {$DMN_EXPIRES_DATE}</td>
          </tr>
          {/if}
          {if $T_PHP_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_PHP_SUPPORT}</td>
            <td width="230" class="content2">{$PHP_SUPPORT}</td>
          </tr>
          {/if}
          {if $T_CGI_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_CGI_SUPPORT}</td>
            <td width="230" class="content2">{$CGI_SUPPORT}</td>
          </tr>
          {/if}
          {if $T_DNS_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_DNS_SUPPORT}</td>
            <td width="230" class="content2">{$DNS_SUPPORT}</td>
          </tr>
          {/if}
          {if $T_BACKUP_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_BACKUP_SUPPORT}</td>
            <td width="230" class="content2">{$BACKUP_SUPPORT}</td>
          </tr>
          {/if}
          {if $T_SQL1_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_MYSQL_SUPPORT}</td>
            <td width="230" class="content2">{$MYSQL_SUPPORT}</td>
          </tr>
          {/if}
          {if $T_SDM_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_SUBDOMAINS}</td>
            <td width="230" class="content2">{$SUBDOMAINS}</td>
          </tr>
          {/if}
          {if $T_ALIAS_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_DOMAIN_ALIASES}</td>
            <td width="230" class="content2">{$DOMAIN_ALIASES}</td>
          </tr>
          {/if}
          {if $T_MAILS_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_MAIL_ACCOUNTS}</td>
            <td width="230" class="content2">{$MAIL_ACCOUNTS}</td>
          </tr>
          {/if}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_FTP_ACCOUNTS}</td>
            <td width="230" class="content2">{$FTP_ACCOUNTS}</td>
          </tr>
          {if $T_SQL2_SUPPORT}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_SQL_DATABASES}</td>
            <td width="230" class="content2">{$SQL_DATABASES}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_SQL_USERS}</td>
            <td width="230" class="content2">{$SQL_USERS}</td>
          </tr>
          {/if}
          {if $TR_NEW_MSGS}
          <tr>
            <td>&nbsp;</td>
            <td colspan="2" class="title"><span class="message">{$TR_NEW_MSGS}</span></td>
          </tr>
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
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_traffic.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_TRAFFIC_USAGE}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellspacing="7">
      {if $TR_TRAFFIC_WARNING}
      <tr>
        <td>&nbsp;</td>
        <td class="title"><span class="message">{$TR_TRAFFIC_WARNING}</span></td>
      </tr>
      {/if}
      <tr>
        <td width="25">&nbsp;</td>
        <td class="content">{$TRAFFIC_USAGE_DATA}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="content"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_left.png" width="3" height="20" alt="" /></td>
            <td width="405" class="statsBar"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="statsBar"><img src="{$THEME_COLOR_PATH}/images/bars/stats_progress.png" width="{$TRAFFIC_BARS}" height="20" alt="" /></td>
              </tr>
            </table></td>
            <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_right.png" width="3" height="20" alt="" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
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
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_diskusage.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_DISK_USAGE}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellspacing="7">
      {if $TR_DISK_WARNING}
      <tr>
        <td>&nbsp;</td>
        <td class="title"><span class="message">{$TR_DISK_WARNING}</span></td>
      </tr>
      {/if}
      <tr>
        <td width="25">&nbsp;</td>
        <td class="content">{$DISK_USAGE_DATA}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="content"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_left.png" width="3" height="20" alt="" /></td>
            <td width="405" class="statsBar"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="statsBar"><img src="{$THEME_COLOR_PATH}/images/bars/stats_progress.png" width="{$DISK_BARS}" height="20" alt="" /></td>
              </tr>
            </table></td>
            <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_right.png" width="3" height="20" alt="" /></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

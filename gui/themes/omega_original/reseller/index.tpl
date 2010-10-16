<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_general.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$GENERAL_INFO}</td>
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
            <td class="content">{$ACCOUNT_NAME}</td>
            <td width="230" class="content2">{$RESELLER_NAME}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$DOMAINS}</td>
            <td width="230" class="content2">{$DMN_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$SUBDOMAINS}</td>
            <td width="230" class="content2">{$SUB_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$ALIASES}</td>
            <td width="230" class="content2">{$ALS_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$MAIL_ACCOUNTS}</td>
            <td width="230" class="content2">{$MAIL_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_FTP_ACCOUNTS}</td>
            <td width="230" class="content2">{$FTP_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$SQL_DATABASES}</td>
            <td width="230" class="content2">{$SQL_DB_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$SQL_USERS}</td>
            <td width="230" class="content2">{$SQL_USER_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TRAFFIC}</td>
            <td width="230" class="content2">{$TRAFF_MSG}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$DISK}</td>
            <td width="230" class="content2">{$DISK_MSG}</td>
          </tr>
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
      <!-- BDP: traff_warn -->
      <tr>
        <td width="25">&nbsp;</td>
        <td class="title"><span class="message">{$TR_TRAFFIC_WARNING}</span></td>
      </tr>
      <!-- EDP: traff_warn -->
      <tr>
        <td width="25">&nbsp;</td>
        <td class="content">{$TRAFFIC_USAGE_DATA}</td>
      </tr>
      <tr>
        <td width="25">&nbsp;</td>
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
      <!-- BDP: disk_warn -->
      <tr>
        <td width="25">&nbsp;</td>
        <td class="title"><span class="message">{$TR_DISK_WARNING}</span></td>
      </tr>
      <!-- EDP: disk_warn -->
      <tr>
        <td width="25">&nbsp;</td>
        <td class="content">{$DISK_USAGE_DATA}</td>
      </tr>
      <tr>
        <td width="25">&nbsp;</td>
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

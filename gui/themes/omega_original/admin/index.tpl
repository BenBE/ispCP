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
    <td>
        <table width="100%" cellpadding="5" cellspacing="5" class="hl">
          {if $MESSAGE}
           <tr>
             <td>&nbsp;</td>
             <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
           </tr>
          {/if}
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_ACCOUNT_NAME}</td>
            <td width="230" class="content2">{$ACCOUNT_NAME}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_ADMIN_USERS}</td>
            <td width="230" class="content2">{$ADMIN_USERS}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_RESELLER_USERS}</td>
            <td width="230" class="content2">{$RESELLER_USERS}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_NORMAL_USERS}</td>
            <td width="230" class="content2">{$NORMAL_USERS}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_DOMAINS}</td>
            <td width="230" class="content2">{$DOMAINS}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_SUBDOMAINS}</td>
            <td width="230" class="content2">{$SUBDOMAINS}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_DOMAINS_ALIASES}</td>
            <td width="230" class="content2">{$DOMAINS_ALIASES}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_MAIL_ACCOUNTS}</td>
            <td width="230" class="content2">{$MAIL_ACCOUNTS}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content">{$TR_FTP_ACCOUNTS}</td>
            <td width="230" class="content2">{$FTP_ACCOUNTS}</td>
          </tr>
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
          {if $TR_NEW_MSGS}
          <tr>
            <td>&nbsp;</td>
            <td colspan="2" class="title"><span class="message">{$TR_NEW_MSGS}</span></td>
          </tr>
          {/if}
          {if $UPDATE}
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="2" style="color:#f00"><b>{$UPDATE}</b></td>
          </tr>
          {/if}
          {if $DATABASE_UPDATE}
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="2" style="color:#f00"><b>{$DATABASE_UPDATE}</b></td>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_traffic.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_SERVER_TRAFFIC}</td>
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
        <td class="content">{$TRAFFIC_WARNING}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="content"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="3"><img src="{$THEME_COLOR_PATH}/images/bars/stats_left.png" width="3" height="20" alt="" /></td>
            <td width="405" class="statsBar"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="statsBar"><img src="{$THEME_COLOR_PATH}/images/bars/stats_progress.png" width="{$BAR_VALUE}" height="20" alt="" /></td>
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
</table></td>
				</tr>
			</table>

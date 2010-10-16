<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_DELETE_DOMAIN} {$DOMAIN_NAME}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" cellpadding="1" cellspacing="1">
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><strong>{$TR_DOMAIN_SUMMARY}</strong></td>
					</tr>
					{if $MAIL_ADDR}
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><strong><i>{$TR_DOMAIN_EMAILS}</i></strong></td>
					</tr>
					{section name=i loop=$MAIL_ADDR}
					<tr>
		                <td width="25">&nbsp;</td>
						<td width="150">{$MAIL_ADDR[i]}</td>
						<td>{$MAIL_TYPE[i]}</td>
						<td>&nbsp;</td>
					</tr>
                    {/section}
                    {/if}

					{if $FTP_USER}
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><strong><i>{$TR_DOMAIN_FTPS}</i></strong></td>
					</tr>
					{section name=i loop=$FTP_USER}
					<tr>
		                <td width="25">&nbsp;</td>
						<td width="150">{$FTP_USER[i]}</td>
						<td>{$FTP_HOME[i]}</td>
						<td>&nbsp;</td>
					</tr>
                    {/section}
                    {/if}

					{if $ALS_NAME}
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><strong><i>{$TR_DOMAIN_ALIASES}</i></strong></td>
					</tr>
					{section name=i loop=$ALS_NAME}
					<tr>
		                <td width="25">&nbsp;</td>
						<td width="150">{$ALS_NAME[i]}</td>
						<td>{$ALS_MNT[i]}</td>
						<td>&nbsp;</td>
					</tr>
                    {/section}
                    {/if}

					{if $SUB_NAME}
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><strong><i>{$TR_DOMAIN_SUBS}</i></strong></td>
					</tr>
					{section name=i loop=$SUB_NAME}
					<tr>
		                <td width="25">&nbsp;</td>
						<td width="150">{$SUB_NAME[i]}</td>
						<td>{$SUB_MNT[i]}</td>
						<td>&nbsp;</td>
					</tr>
                    {/section}
                    {/if}

					{if $DB_NAME}
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><strong><i>{$TR_DOMAIN_DBS}</i></strong></td>
					</tr>
					{section name=i loop=$DB_NAME}
					<tr>
		                <td width="25">&nbsp;</td>
						<td width="150">{$DB_NAME[i]}</td>
						<td>{$DB_USERS[i]}</td>
						<td>&nbsp;</td>
					</tr>
                    {/section}
                    {/if}

                    <tr>
                    	<td colspan="4">&nbsp;</td>
                    </tr>
					<tr>
		                <td width="25">&nbsp;</td>
						<td colspan="3"><form name="admin_delete_domain_frm" method="post" action="user_delete.php"><input type="hidden" name="domain_id" value="{$DOMAIN_ID}" />
		                	{$TR_REALLY_WANT_TO_DELETE_DOMAIN}<br /><br/>
		                	<input type="checkbox" value="1" name="delete" />{$TR_YES_DELETE_DOMAIN}<br/><br/>
		                	<input type="submit" value="{$TR_BUTTON_DELETE}" />
		                </form></td>
					</tr>

                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
            </table>

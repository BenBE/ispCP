<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_user.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top">{if $ADD_USER != 'no'}
                    <form name="reseller_add_users_first_frm" method="post" action="user_add2.php">
                      <input type="hidden" name="uaction" value="user_add2_nxt" />
                      <table width="100%" cellpadding="5" cellspacing="5">
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td colspan="2" class="content3"><b>{$TR_HOSTING_PLAN_PROPERTIES}</b></td>
                        </tr>
                        {if $MESSAGE}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                        </tr>
                        {/if}
						<tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_TEMPLATE_NAME}</td>
                          <td class="content"><input name="template" type="hidden" id="template" value="{$VL_TEMPLATE_NAME}" />{$VL_TEMPLATE_NAME} </td>
                        </tr>
                        {if $SUBDOMAIN_ADD != 'no'}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_SUBDOMAIN}</td>
                          <td class="content"><input type="text" name="nreseller_max_subdomain_cnt" value="{$MAX_SUBDMN_CNT}" style="width:140px" class="textinput" /></td>
                        </tr>
                        {/if}
                        {if $ALIAS_ADD != 'no'}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="175">{$TR_MAX_DOMAIN_ALIAS}</td>
                          <td class="content"><input type="text" name="nreseller_max_alias_cnt" value="{$MAX_DMN_ALIAS_CNT}" style="width:140px" class="textinput" /></td>
                        </tr>
                        {/if}
                        {if $MAIL_ADD != 'no'}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_MAIL_COUNT}</td>
                          <td class="content"><input type="text" name="nreseller_max_mail_cnt" value="{$MAX_MAIL_CNT}" style="width:140px" class="textinput" /></td>
                        </tr>
                        {/if}
                        {if $FTP_ADD != 'no'}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_FTP}</td>
                          <td class="content"><input type="text" name="nreseller_max_ftp_cnt" value="{$MAX_FTP_CNT}" style="width:140px" class="textinput" /></td>
                        </tr>
                        {/if}
                        {if $SQL_DB_ADD != 'no'}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_SQL_DB}</td>
                          <td class="content"><input type="text" name="nreseller_max_sql_db_cnt" value="{$MAX_SQL_CNT}" style="width:140px" class="textinput" /></td>
                        </tr>
                        {/if}
                        {if $SQL_USER_ADD != 'no'}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_SQL_USERS}</td>
                          <td class="content"><input type="text" name="nreseller_max_sql_user_cnt" value="{$VL_MAX_SQL_USERS}" style="width:140px" class="textinput" /></td>
                        </tr>
                        {/if}
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_TRAFFIC}</td>
                          <td class="content"><input type="text" name="nreseller_max_traffic" value="{$VL_MAX_TRAFFIC}" style="width:140px" class="textinput" /></td>
                        </tr>
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_MAX_DISK_USAGE}</td>
                          <td class="content"><input type="text" name="nreseller_max_disk" value="{$VL_MAX_DISK_USAGE}" style="width:140px" class="textinput" /></td>
                        </tr>
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_PHP}</td>
                          <td class="content"><input name="php" type="radio" value="_yes_" {$VL_PHPY} />
                            {$TR_YES}
                            <input type="radio" name="php" value="_no_" {$VL_PHPN} />
                            {$TR_NO}</td>
                        </tr>
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_CGI}</td>
                          <td class="content"><input name="cgi" type="radio" value="_yes_" {$VL_CGIY} />
                            {$TR_YES}
                            <input type="radio" name="cgi" value="_no_" {$VL_CGIN} />
                            {$TR_NO}</td>
                        </tr>
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_DNS}</td>
                          <td class="content"><input name="dns" type="radio" value="_yes_" {$VL_DNSY} />
                            {$TR_YES}
                            <input type="radio" name="dns" value="_no_" {$VL_DNSN} />
                            {$TR_NO}</td>
                        </tr>
                        <tr>
                          <td width="25">&nbsp;</td>
                          <td class="content2" width="200">{$TR_BACKUP}</td>
                          <td class="content"><input name="backup" type="radio" value="_dmn_" {$VL_BACKUPD} />
                            {$TR_BACKUP_DOMAIN}
                            <input type="radio" name="backup" value="_sql_" {$VL_BACKUPS} />
                            {$TR_BACKUP_SQL}<input name="backup" type="radio" value="_full_" {$VL_BACKUPF} />
                            {$TR_BACKUP_FULL}
                            <input type="radio" name="backup" value="_no_" {$VL_BACKUPN} />
                            {$TR_BACKUP_NO}</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_NEXT_STEP}" /></td>
                        </tr>
                      </table>
                    </form>
                  {/if}
                </td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_serverstatus.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_HOSTING_PLAN}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><form name="reseller_add_host_plant_frm" method="post" action="hosting_plan_add.php">
                    <table width="100%" cellspacing="3" class="hl">
                      <tr>
                        <td width="35" align="left">&nbsp;</td>
                        <td colspan="2" align="left" class="content3"><b>{$TR_HOSTING_PLAN_PROPS}</b></td>
                      </tr>
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_TEMPLATE_NAME}</td>
                        <td class="content"><input type="text" name="hp_name" value="{$HP_NAME_VALUE}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_TEMPLATE_DESCRIPTON}</td>
                        <td class="content"><textarea name="hp_description" class="textinput2" style="width:210px" cols="40" rows="8">{$HP_DESCRIPTION_VALUE}</textarea></td>
                      </tr>
                      {if $SUBDOMAIN_ADD != 'no'}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_SUBDOMAINS}</td>
                        <td class="content"><input type="text" name="hp_sub" value="{$TR_MAX_SUB_LIMITS}" style="width:100px" class="textinput" /></td>
                      </tr>
                      {/if}
                      {if $ALIAS_ADD != 'no'}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_ALIASES}</td>
                        <td class="content"><input type="text" name="hp_als" value="{$TR_MAX_ALS_VALUES}" style="width:100px" class="textinput" /></td>
                      </tr>
                      {/if}
                      {if $MAIL_ADD != 'no'}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_MAILACCOUNTS}</td>
                        <td class="content"><input type="text" name="hp_mail" value="{$HP_MAIL_VALUE}" style="width:100px" class="textinput" /></td>
                      </tr>
                      {/if}
                      {if $FTP_ADD != 'no'}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_FTP}</td>
                        <td class="content"><input type="text" name="hp_ftp" value="{$HP_FTP_VALUE}" style="width:100px" class="textinput" /></td>
                      </tr>
                      {/if}
                      {if $SQL_DB_ADD != 'no'}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_SQL}</td>
                        <td class="content"><input type="text" name="hp_sql_db" value="{$HP_SQL_DB_VALUE}" style="width:100px" class="textinput" /></td>
                      </tr>
                      {/if}
                      {if $SQL_USER_ADD != 'no'}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_SQL_USERS}</td>
                        <td class="content"><input type="text" name="hp_sql_user" value="{$HP_SQL_USER_VALUE}" style="width:100px" class="textinput" /></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_MAX_TRAFFIC}</td>
                        <td class="content"><input type="text" name="hp_traff" value="{$HP_TRAFF_VALUE}" style="width:100px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_DISK_LIMIT}</td>
                        <td class="content"><input type="text" name="hp_disk" value="{$HP_DISK_VALUE}" style="width:100px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_PHP}</td>
                        <td class="content"><input type="radio" name="php" value="_yes_" {$TR_PHP_YES} />
                          {$TR_YES}
                          <input type="radio" name="php" value="_no_" {$TR_PHP_NO} />
                          {$TR_NO}</td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_CGI}</td>
                        <td class="content"><input type="radio" name="cgi" value="_yes_" {$TR_CGI_YES} />
                          {$TR_YES}
                          <input type="radio" name="cgi" value="_no_" {$TR_CGI_NO} />
                          {$TR_NO}</td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_DNS}</td>
                        <td class="content"><input type="radio" name="dns" value="_yes_" {$TR_DNS_YES} />
                          {$TR_YES}
                          <input type="radio" name="dns" value="_no_" {$TR_DNS_NO} />
                          {$TR_NO}</td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="250">{$TR_BACKUP}</td>
                        <td class="content"><input name="backup" type="radio" value="_dmn_" {$VL_BACKUPD} />
                          {$TR_BACKUP_DOMAIN}
                          <input type="radio" name="backup" value="_sql_" {$VL_BACKUPS} />
                          {$TR_BACKUP_SQL}
                          <input name="backup" type="radio" value="_full_" {$VL_BACKUPF} />
                          {$TR_BACKUP_FULL}
                          <input type="radio" name="backup" value="_no_" {$VL_BACKUPN} />
                          {$TR_BACKUP_NO}
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_BILLING_PROPS}</b></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_PRICE}</td>
                        <td class="content"><input name="hp_price" type="text" class="textinput" id="hp_price" style="width:100px" value="{$HP_PRICE}" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_SETUP_FEE}</td>
                        <td class="content"><input name="hp_setupfee" type="text" class="textinput" id="hp_setupfee" style="width:100px" value="{$HP_SETUPFEE}" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_VALUE}</td>
                        <td class="content"><input name="hp_value" type="text" class="textinput" id="hp_value" style="width:100px" value="{$HP_VELUE}" />
                            <small>{$TR_EXAMPLE}</small></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_PAYMENT}</td>
                        <td class="content"><input name="hp_payment" type="text" class="textinput" id="hp_payment" style="width:100px" value="{$HP_PAYMENT}" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_STATUS}</td>
                        <td class="content"><input type="radio" name="status" value="1" {$TR_STATUS_YES} />
                          {$TR_YES}
                          <input type="radio" name="status" value="0" {$TR_STATUS_NO} />
                          {$TR_NO}</td>
                      </tr>
                      <!-- TOS -->
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_TOS_PROPS}</b></td>
                      </tr>
                      <tr>
                      <td>&nbsp;</td>
                      <td colspan="2" class="content4">&nbsp;{$TR_TOS_NOTE}</td>
                      </tr>
                       <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_TOS_DESCRIPTION}</td>
                        <td class="content"><textarea class="textinput2" name="hp_tos" style="width:410px" cols="70" rows="8">{$HP_TOS_VALUE}</textarea></td>
                      </tr>
                      <!-- TOS END -->
                      <tr>
                        <td><input type="hidden" name="uaction" value="add_plan" />
                        </td>
                        <td colspan="2"><input name="Submit" type="submit" class="button" value=" {$TR_ADD_PLAN} " /></td>
                      </tr>
                    </table>
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

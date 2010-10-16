<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_hdd.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_BACKUP}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="backup_frm" method="post" action="backup.php" onSubmit="return confirm('{$TR_CONFIRM_MESSAGE}');">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      {if $MESSAGE}
                      <tr>
                        <td class="title" align="center">&nbsp;</td>
                        <td class="title" align="center"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content3"><b>{$TR_DOWNLOAD_DIRECTION}</b></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content"><ol>
                              <li>{$TR_FTP_LOG_ON}</li>
                              <li>{$TR_SWITCH_TO_BACKUP}</li>
                              <li>{$TR_DOWNLOAD_FILE}<br />{$TR_USUALY_NAMED}</li>
                            </ol></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content3"><b>{$TR_RESTORE_BACKUP}</b></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content"><p>{$TR_RESTORE_DIRECTIONS}</p>
                            <input name="Submit" type="submit" class="button" value=" {$TR_RESTORE} " />
                            <p>
                              <input type="hidden" name="uaction" value="bk_restore" />
                            </p></td>
                      </tr>
                    </table></form></td>
                <td>&nbsp;</td>
              </tr>
            </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users2.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_MANAGE_USER_SESSIONS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
                          {if $MESSAGE}
                          <tr>
                            <td width="25">&nbsp;</td>
                            <td colspan="3" class="title"><span class="message">{$MESSAGE}</span></td>
                          </tr>
                          {/if}
                          <tr>
                            <td width="25">&nbsp;</td>
                            <td class="content3"><b>{$TR_USERNAME}</b></td>
                            <td class="content3"><strong>{$TR_LOGIN_ON}</strong></td>
                            <td width="150" class="content3"><b>{$TR_OPTIONS}</b></td>
                          </tr>
                          {section name=i loop=$ADMIN_USERNAME}
                          <tr class="hl">
                            <td width="25">&nbsp;</td>
                            <td class="{$ADMIN_CLASS[i]}">{$ADMIN_USERNAME[i]}</td>
                            <td class="{$ADMIN_CLASS[i]}">{$LOGIN_TIME[i]}</td>
                            <td width="150" class="{$ADMIN_CLASS[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$KILL_LINK[i]}" class="link">{$TR_DELETE}</a> </td>
                          </tr>
                          {/section}
                      </table></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

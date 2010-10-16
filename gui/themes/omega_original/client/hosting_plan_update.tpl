<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_purchasing.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_MENU_UPDATE_HP}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td>&nbsp;</td>
                      <td class="content3" colspan="{$COLSPAN}"><strong>{$TR_HOSTING_PLANS}</strong></td>
                    </tr>
                    {if $MESSAGE}
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td width="719" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    {section name=i loop=$HP_NAME}
                    <tr>
                      <td width="25">&nbsp;</td>
                      <td valign="top" class="{$ITHEM[i]}" style="white-space:normal"><strong>{$HP_NAME[i]}</strong><br />
                        {$HP_DESCRIPTION[i]}<br />
                        <br />
                        {$HP_DETAILS[i]}<br />
                        <br />
                        <strong>{$HP_COSTS[i]}</strong></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td class="content3"><img src="{$THEME_COLOR_PATH}/images/icons/details.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> {$LINK_PURCHASE[i]}</td>
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

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_serverstatus.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_HOSTING_PLANS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><table width="100%" cellspacing="3">
                    {if $MESSAGE}
                    <tr>
                      <td width="35">&nbsp;</td>
                      <td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
                    </tr>
                    {/if}
                    {if $PLAN_NUM}
                    <tr>
                      <td width="35" align="center">&nbsp;</td>
                      <td class="content3" width="50" align="center"><span class="menu"><b>{$TR_NUM}</b></span></td>
                      <td class="content3"><b>{$TR_PLAN_NAME}</b></td>
                      <td width="100" align="center" class="content3"><strong>{$TR_PURCHASING}</strong></td>
                      <td width="200" colspan="2" align="center" class="content3"><b>{$TR_ACTION}</b></td>
                    </tr>
                    {section name=i loop=$PLAN_NUM}
                    <tr class="hl">
                      <td width="35" align="center">&nbsp;</td>
                      <td class="{$CLASS_TYPE_ROW[i]}" width="50" align="center">{$PLAN_NUM[i]}</td>
                      <td class="{$CLASS_TYPE_ROW[i]}"><img src="{$THEME_COLOR_PATH}/images/icons/goto.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="../orderpanel/package_info.php?coid={$CUSTOM_ORDERPANEL_ID[i]}&amp;user_id={$RESELLER_ID[i]}&amp;id={$HP_ID[i]}" target="_blank" title="{$PLAN_SHOW[i]}">{$PLAN_NAME[i]}</a></td>
                      <td align="center" class="{$CLASS_TYPE_ROW[i]}">{$PURCHASING[i]}</td>
                      <td class="{$CLASS_TYPE_ROW[i]}" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/edit.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="hosting_plan_edit.php?hpid={$HP_ID[i]}" class="link">{$TR_EDIT}</a></td>
                      <!-- BDP: hp_delete -->
                      <td class="{$CLASS_TYPE_ROW[i]}" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="hosting_plan_delete.php?hpid={$HP_ID[i]}" onClick="return delete_account('hosting_plan_delete.php?hpid={$HP_ID[i]}', '{$PLAN_NAME2[i]}')" class="link">{$PLAN_ACTION[i]}</a></td>
                      <!-- EDP: hp_delete -->
                    </tr>
                    {/section}
                    {/if}
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

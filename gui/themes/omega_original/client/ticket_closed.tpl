
<script type="text/javascript">
<!--
function action_delete(url, subject) {
	return confirm(sprintf("{$TR_MESSAGE_DELETE}", subject));
}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_support.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_CLOSED_TICKETS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><table width="100%" cellspacing="7">
                          {if $MESSAGE}
                          <tr>
                            <td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
                          </tr>
                          {/if}
                          {if $NEW}
                          <tr>
                            <td width="30" class="content3" align="center"><b>{$TR_STATUS}</b></td>
                            <td class="content3"><b>{$TR_SUBJECT}</b></td>
                            <td width="150" class="content3" nowrap="nowrap" align="center"><b>{$TR_URGENCY}</b></td>
                            <td width="100" class="content3" nowrap="nowrap" align="center"><b>{$TR_LAST_DATA}</b></td>
                            <td width="100" align="center" nowrap="nowrap" class="content3"><strong>{$TR_ACTION}</strong></td>
                          </tr>
                          {section name=i loop=$NEW}
                          <tr class="hl">
                            <td width="25" nowrap="nowrap" class="{$CONTENT[i]}"><b>{$NEW[i]}</b></td>
                            <td class="{$CONTENT[i]}" nowrap="nowrap"><img src="{$THEME_COLOR_PATH}/images/icons/document.png" width="16" height="16" style="vertical-align:middle" alt="" />
                            <script type="text/javascript">
<!--
							document.write('<a href="ticket_view.php?ticket_id={$ID[i]}&screenwidth='+screen.width+'" class="link">{$SUBJECT[i]}</a>');
//-->
						</script>
						<noscript><a href="ticket_view.php?ticket_id={$ID[i]}&amp;screenwidth=800" class="link"> {$SUBJECT[i]}</a></noscript></td>
                            <td class="{$CONTENT[i]}" nowrap="nowrap" align="center">{$URGENCY[i]}</td>
                            <td class="{$CONTENT[i]}" nowrap="nowrap" align="center">{$LAST_DATE[i]}</td>
                            <td class="{$CONTENT[i]}" nowrap="nowrap" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="ticket_delete.php?ticket_id={$ID[i]}" onClick="return action_delete('ticket_delete.php?ticket_id={$ID[i]}', '{$SUBJECT2[i]}')" class="link">{$TR_DELETE}</a></td>
                          </tr>
                          {/section}
                          <tr>
                            <td colspan="2" nowrap="nowrap"><input name="Submit" type="submit" class="button" onClick="MM_goToURL('parent','ticket_delete.php?delete=closed');return document.MM_returnValue" value="{$TR_DELETE_ALL}" /></td>
                            <td colspan="3" nowrap="nowrap"><div align="right">
              {if $PREV_PSI || $PREV_PSI===0}
              <a href="ticket_closed.php?psi={$PREV_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
              {else}
              <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
              {/if}
              &nbsp;
              {if $NEXT_PSI || $NEXT_PSI===0}
              <a href="ticket_closed.php?psi={$NEXT_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
              {else}
              <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
              {/if}
                            </div></td>
                          </tr>
                          {/if}
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

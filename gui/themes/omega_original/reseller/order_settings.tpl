<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_tools.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_MENU_ORDER_SETTINGS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="edit_hfp" method="post" action="order_settings.php">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2"><strong>{$TR_IMPLEMENT_INFO}</strong></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content">{$TR_IMPLEMENT_URL}</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2"><strong>{$TR_HEADER}</strong></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content"><textarea name="header" cols="80" rows="15" class="textinput2" id="header" style="width:90%">{$PURCHASE_HEADER}</textarea></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2"><strong>{$TR_FOOTER}</strong></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content"><textarea name="footer" cols="80" rows="15" class="textinput2" id="footer" style="width:90%">{$PURCHASE_FOOTER}</textarea></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><input name="Submit" type="submit" class="button" value="{$TR_APPLY_CHANGES}" />
                          &nbsp;&nbsp;
                          <input name="Button" type="button" class="button" onClick="window.open('/orderpanel/', 'preview', 'width=770,height=480')" value="{$TR_PREVIEW}" /></td>
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

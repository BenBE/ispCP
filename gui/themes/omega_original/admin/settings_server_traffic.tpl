<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_traffic.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_SERVER_TRAFFIC_SETTINGS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form action="settings_server_traffic.php" method="post" name="admin_modify_server_traffic_settings" id="admin_modify_server_traffic_settings">
                          <table width="100%" cellpadding="5" cellspacing="5" class="hl">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="content3"><b>{$TR_SET_SERVER_TRAFFIC_SETTINGS}</b></td>
                            </tr>
                            {if $MESSAGE}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_MAX_TRAFFIC}</td>
                              <td class="content"><input name="max_traffic" type="text" class="textinput" id="max_traffic" style="width:170px" value="{$MAX_TRAFFIC}" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2">{$TR_WARNING}</td>
                              <td class="content"><input name="traffic_warning" type="text" class="textinput" id="traffic_warning" style="width:170px" value="{$TRAFFIC_WARNING}" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_MODIFY}" /></td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="modify" />
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

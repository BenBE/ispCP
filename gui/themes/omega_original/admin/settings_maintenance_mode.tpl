<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_maintenancemode.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_MAINTENANCEMODE}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form action="settings_maintenance_mode.php" method="post" name="maintenancemode_frm" id="maintenancemode_frm">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="content3"><strong>{$TR_MESSAGE_TEMPLATE_INFO}</strong></td>
                            </tr>
                            {if $MESSAGE}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="200" class="content2"><label for="maintenancemode_message">{$TR_MESSAGE}</label></td>
                              <td class="content"><textarea name="maintenancemode_message" id="maintenancemode_message" style="width:80%" class="textinput2" cols="80" rows="30">{$MESSAGE_VALUE}</textarea>
                              </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="content2"><label for="maintenancemode">{$TR_MAINTENANCEMODE}</label></td>
                              <td class="content"><select name="maintenancemode" id="maintenancemode">
                                  <option value="0" {$SELECTED_OFF}>{$TR_DISABLED}</option>
                                  <option value="1" {$SELECTED_ON}>{$TR_ENABLED}</option>
                              </select></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><input type="hidden" name="uaction" value="apply" />
                                  <input name="Submit" type="submit" class="button" value="{$TR_APPLY_CHANGES}" /></td>
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

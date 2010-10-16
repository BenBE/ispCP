<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_serverstatus.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_ROOTKIT_LOG}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td>{section name=i loop=$FILENAME}
                          <table width="100%" cellpadding="5" cellspacing="5">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content3"><strong>{$FILENAME[i]}:</strong></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="content" style="white-space:normal;">{$LOG[i]}</td>
                            </tr>
                          </table>
                        {/section}
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

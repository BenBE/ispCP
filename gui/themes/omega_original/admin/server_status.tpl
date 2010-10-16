  <style type="text/css">
      td.down {
	color: #f00;
      }
      td.up {
	color: #008000;
      }
  </style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_serverstatus.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_SERVER_STATUS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><!-- BDP: props_list -->
                          <table width="100%" cellpadding="5" cellspacing="5">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td width="230" class="content3"><strong>{$TR_HOST}</strong></td>
                              <td align="center" class="content3"><strong>{$TR_SERVICE}</strong></td>
                              <td align="center" class="content3"><strong>{$TR_STATUS}</strong></td>
                            </tr>
                            {section name=i loop=$HOST}
                            <tr class="hl">
                              <td>&nbsp;</td>
                              <td class="{$CLASS[i]}">{$HOST[i]} &nbsp;&nbsp;(Port {$PORT[i]})</td>
                              <td class="{$CLASS[i]}">{$SERVICE[i]} </td>
                              <td align="center" class="{$CLASS[i]}">{$STATUS[i]}</td>
                            </tr>
                            {/section}
                          </table>
                        <!-- EDP: props_list -->
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

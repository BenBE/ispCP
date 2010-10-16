<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_sql.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_DATABASE}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td></td>
                      <td valign="top"><form name="add_sql_database_frm" method="post" action="sql_database_add.php">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td width="5">&nbsp;</td>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="5">&nbsp;</td>
                              <td width="200" class="content2">{$TR_DB_NAME}</td>
                              <td class="content"><input type="text" name="db_name" value="{$DB_NAME}" style="width:170px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td width="5">&nbsp;</td>
                              <td width="200" class="content2">{if $MYSQL_PREFIX_YES != 'no'}
                                  <input type="checkbox" name="use_dmn_id" {$USE_DMN_ID} />
                                  {/if}
                                  {if $MYSQL_PREFIX_NO != 'no'}
                                  <input type="hidden" name="use_dmn_id" value="on" />
                                  {/if}
                                {$TR_USE_DMN_ID}</td>
                              <td class="content">{if $MYSQL_PREFIX_ALL != 'no'}
                                  <input type="radio" name="id_pos" value="start" {$START_ID_POS_CHECKED} />
                                {$TR_START_ID_POS}<br />
                                <input type="radio" name="id_pos" value="end" {$END_ID_POS_CHECKED} />
                                {$TR_END_ID_POS}
                                {/if}
                                {if $MYSQL_PREFIX_INFRONT != 'no'}
                                <input type="hidden" name="id_pos" value="start" checked="checked" />
                                {$TR_START_ID_POS}
                                {/if}
                                {if $MYSQL_PREFIX_BEHIND != 'no'}
                                <input type="hidden" name="id_pos" value="end" checked="checked" />
                                {$TR_END_ID_POS}
                                {/if}
                              </td>
                            </tr>
                            <tr>
                              <td width="5">&nbsp;</td>
                              <td colspan="2"><input name="Submit" type="submit" class="button" value="  {$TR_ADD}  " /></td>
                            </tr>
                          </table>
                        <!-- end of content -->
                          <input type="hidden" name="uaction" value="add_db" /></form></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

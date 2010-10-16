<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_sql.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_EXECUTE_SQL_QUERY}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="sql_execute_query_frm" method="post" action="sql_execute_query.php">
                          <table width="100%" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="200" class="content2">{$TR_USER_NAME}</td>
                              <td class="content"><input type="text" name="user_name" value="{$USER_NAME}" style="width:170px" class="textinput" readonly="readonly" />
                              </td>
                            </tr>
                            <tr>
                              <td width="200" class="content2" style="vertical-align:top;">{$TR_SQL_QUERY}</td>
                              <td class="content"><textarea name="sql_query" cols="80" rows="15" style="width:80%">{$SQL_QUERY}</textarea>
                              </td>
                            </tr>
                            <!-- BDP: sql_result -->
                            <tr>
                              <td width="200" class="content2" style="vertical-align:top;">{$TR_QUERY_STATUS}</td>
                              <td class="content">{$QUERY_STATUS}</td>
                            </tr>
                            <tr>
                              <td width="200" class="content2" style="vertical-align:top;">{$TR_QUERY_RESULT}</td>
                              <td class="content2">{$QUERY_RESULT}</td>
                            </tr>
                            <!-- EDP: sql_result -->
                            <tr>
                              <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan="2"><input name="Submit" type="submit" class="button" value=" {$TR_EXECUTE} " />
                              </td>
                            </tr>
                          </table>
                        <!-- end of content -->
                          <input type="hidden" name="uaction" value="execute_query" />
                          <input type="hidden" name="id" value="{$ID}" />
                      </form></td>
                    </tr>
                </table></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

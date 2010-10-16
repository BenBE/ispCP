<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_sql.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_SQL_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="sql_add_user_frm" method="post" action="sql_user_add.php">
                          <table width="100%" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            {if $SHOW_SQLUSER_LIST != 'no'}
                            <tr>
                              <td class="content2">{$TR_SQL_USER_NAME}</td>
                              <td class="content"><select name="sqluser_id" id="sqluser_id">
                                  {section name=i loop=$SQLUSER_ID}
                                  <option value="{$SQLUSER_ID[i]}" {$SQLUSER_SELECTED[i]}>{$SQLUSER_NAME[i]}</option>
                                  {/section}
                                </select>
                                &nbsp;&nbsp;
                                <input name="Add_Exist" type="submit" id="Add_Exist" value="{$TR_ADD_EXIST}" class="button" tabindex="1" /></td>
                            </tr>
                            {/if}
                            {if $CREATE_SQLUSER != 'no'}
                            <tr>
                              <td width="200" class="content2">{$TR_USER_NAME}</td>
                              <td class="content"><input type="text" name="user_name" value="{$USER_NAME}" style="width:170px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
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
                              <td width="200" class="content2">{$TR_PASS}</td>
                              <td class="content"><input type="password" name="pass" value="" style="width:170px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td width="200" class="content2">{$TR_PASS_REP}</td>
                              <td class="content"><input type="password" name="pass_rep" value="" style="width:170px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                              <td colspan="2"><input name="Add_New" type="submit" class="button" id="Add_New" value="  {$TR_ADD}  " />
                                &nbsp;&nbsp;&nbsp;
                                <input type="button" name="Submit" value="   {$TR_CANCEL}   " onClick="location.href = 'sql_manage.php'" class="button" /></td>
                            </tr>
                            {/if}
                          </table>
                        <!-- end of content -->
                          <input type="hidden" name="uaction" value="add_user" />
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

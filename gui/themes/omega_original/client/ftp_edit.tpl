<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_EDIT_FTP_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="edit_ftp_acc_frm" method="post" action="ftp_edit.php">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200">{$TR_FTP_ACCOUNT}</td>
                              <td nowrap="nowrap" class="content"><input type="text" name="ftp_account" value="{$FTP_ACCOUNT}" style="width:170px" class="textinput" readonly="readonly" />
                              </td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><label for="pass">{$TR_PASSWORD}</label></td>
                              <td nowrap="nowrap" class="content"><input type="password" name="pass" id="pass" value="" style="width:170px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><label for="pass_rep">{$TR_PASSWORD_REPEAT}</label></td>
                              <td nowrap="nowrap" class="content"><input type="password" name="pass_rep" id="pass_rep" value="" style="width:170px" class="textinput" />
                              </td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><input type="checkbox" name="use_other_dir" {$USE_OTHER_DIR_CHECKED} />
                                {$TR_USE_OTHER_DIR}</td>
                              <td nowrap="nowrap" class="content"><input type="text" name="other_dir" value="{$OTHER_DIR}" style="width:170px" class="textinput" />
                                  <br />
                                <a href="#" onClick="showFileTree();" class="link">{$CHOOSE_DIR}</a></td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="edit_user" />
                          <input type="hidden" name="id" value="{$ID}" />
                          <input name="Submit" type="submit" class="button" value=" {$TR_EDIT} " />
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

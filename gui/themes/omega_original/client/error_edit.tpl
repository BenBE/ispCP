<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_errors.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ERROR_EDIT_PAGE}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><form name="error_edit" method="post" action="error_pages.php">
                    <table width="100%" cellspacing="7">
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content"><textarea name="error" cols="80" rows="35" class="textinput2" id="error" style="width:80%">{$ERROR}</textarea></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><input type="hidden" name="uaction" value="updt_error" />
                            <input type="hidden" name="eid" value="{$EID}" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td><input name="Submit" type="submit" class="button" value=" {$TR_SAVE} " />
                          &nbsp;&nbsp;
                          <input name="Button" type="button" class="button" onClick="MM_goToURL('parent','error_pages.php');return document.MM_returnValue" value=" {$TR_CANCEL} " /></td>
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

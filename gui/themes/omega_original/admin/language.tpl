<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_multilanguage.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_LANGUAGE}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td valign="top"><form name="client_change_language" method="post" action="language.php">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="203" class="content2"><label for="def_language">{$TR_CHOOSE_DEFAULT_LANGUAGE}</label></td>
                        <td class="content"><select name="def_language" id="def_language">
                            {section name=i loop=$LANG_NAME}
                            <option value="{$LANG_VALUE[i]}" {$LANG_SELECTED[i]}>{$LANG_NAME[i]}</option>
                            {/section}
                        </select></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td width="516">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input type="hidden" name="uaction" value="save_lang" />
                            <input name="Submit" type="submit" class="button" value="{$TR_SAVE}" /></td>
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

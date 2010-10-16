<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_doc.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_PERSONAL_DATA}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td height="420"><form name="client_change_personal_frm" method="post" action="personal_change.php">
                    <table width="100%" cellpadding="5" cellspacing="5" class="hl">
                      {if $MESSAGE}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="203" class="content2"> {$TR_FIRST_NAME}</td>
                        <td class="content"><input type="text" name="fname" value="{$FIRST_NAME}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2"> {$TR_LAST_NAME}</td>
                        <td width="516" class="content"><input type="text" name="lname" value="{$LAST_NAME}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_GENDER}</td>
                        <td class="content"><select name="gender" size="1">
                               <option value="M" {$VL_MALE}>{$TR_MALE}</option>
                               <option value="F" {$VL_FEMALE}>{$TR_FEMALE}</option>
                               <option value="U" {$VL_UNKNOWN}>{$TR_UNKNOWN}</option>
                            </select></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_COMPANY}</td>
                        <td class="content"><input type="text" name="firm" value="{$FIRM}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_STREET_1}</td>
                        <td class="content"><input type="text" name="street1" value="{$STREET_1}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_STREET_2}</td>
                        <td class="content"><input type="text" name="street2" value="{$STREET_2}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_ZIP_POSTAL_CODE}</td>
                        <td class="content"><input type="text" name="zip" value="{$ZIP}" style="width:80px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_CITY}</td>
                        <td class="content"><input type="text" name="city" value="{$CITY}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_STATE}</td>
                        <td class="content"><input type="text" name="state" value="{$STATE}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_COUNTRY}</td>
                        <td class="content"><input type="text" name="country" value="{$COUNTRY}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_EMAIL}</td>
                        <td class="content"><input type="text" name="email" value="{$EMAIL}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_PHONE}</td>
                        <td class="content"><input type="text" name="phone" value="{$PHONE}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td class="content2">{$TR_FAX}</td>
                        <td class="content"><input type="text" name="fax" value="{$FAX}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_UPDATE_DATA}" />
                            <input type="hidden" name="uaction" value="updt_data" /></td>
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

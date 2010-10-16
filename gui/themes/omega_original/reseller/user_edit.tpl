<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_users.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_MANAGE_USERS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="search_user" method="post" action="user_edit.php">
                    <table width="100%" cellspacing="5">
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_CORE_DATA}</b></td>
                      </tr>
                      {if $MESSAGE}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="200">{$TR_USERNAME}</td>
                        <td class="content">{$VL_USERNAME}</td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="200">{$TR_PASSWORD}</td>
                        <td class="content"><input type="password" name="userpassword" value="{$VAL_PASSWORD}" style="width:210px" class="textinput" />
                          &nbsp;&nbsp;&nbsp;
                          <input name="genpass" type="submit" class="button" value=" {$TR_PASSWORD_GENERATE} " />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="200">{$TR_REP_PASSWORD}</td>
                        <td class="content"><input type="password" name="userpassword_repeat" value="{$VAL_PASSWORD}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td class="content2" width="200">{$TR_USREMAIL}</td>
                        <td class="content"><input type="text" name="useremail" value="{$VL_MAIL}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_ADDITIONAL_DATA}</b></td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_CUSTOMER_ID}</td>
                        <td class="content"><input type="text" name="useruid" value="{$VL_USR_ID}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_FIRSTNAME}</td>
                        <td class="content"><input type="text" name="userfname" value="{$VL_USR_NAME}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_LASTNAME}</td>
                        <td class="content"><input type="text" name="userlname" value="{$VL_LAST_USRNAME}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_GENDER}</td>
                        <td class="content">
                          <select name="gender" size="1">
                            <option value="M" {$VL_MALE}>{$TR_MALE}</option>
                            <option value="F" {$VL_FEMALE}>{$TR_FEMALE}</option>
                            <option value="U" {$VL_UNKNOWN}>{$TR_UNKNOWN}</option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_COMPANY}</td>
                        <td class="content"><input type="text" name="userfirm" value="{$VL_USR_FIRM}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_STREET1}</td>
                        <td class="content"><input type="text" name="userstreet1" value="{$VL_STREET1}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_STREET2}</td>
                        <td class="content"><input type="text" name="userstreet2" value="{$VL_STREET2}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="200" class="content2">{$TR_POST_CODE}</td>
                        <td class="content"><input type="text" name="userzip" value="{$VL_USR_POSTCODE}" style="width:80px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_CITY}</td>
                        <td class="content"><input type="text" name="usercity" value="{$VL_USRCITY}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_STATE}</td>
                        <td class="content"><input type="text" name="userstate" value="{$VL_USRSTATE}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_COUNTRY}</td>
                        <td class="content"><input type="text" name="usercountry" value="{$VL_COUNTRY}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_PHONE}</td>
                        <td class="content"><input type="text" name="userphone" value="{$VL_PHONE}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td width="35">&nbsp;</td>
                        <td width="200" class="content2">{$TR_FAX}</td>
                        <td class="content"><input type="text" name="userfax" value="{$VL_FAX}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input name="Submit" type="submit" class="button" value="  {$TR_BTN_ADD_USER}  " />
                          &nbsp;&nbsp;&nbsp;
                          <input type="checkbox" name="send_data" checked="checked" />
                          {$TR_SEND_DATA}</td>
                      </tr>
                    </table>
                  <input type="hidden" name="uaction" value="save_changes" />
                  <input type="hidden" name="edit_id" value="{$EDIT_ID}" />
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

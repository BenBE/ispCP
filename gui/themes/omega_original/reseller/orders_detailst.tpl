<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_domains.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ORDER_DETAILS}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="order_details" method="post" action="orders_detailst.php?order_id={$ID}">
                    <table width="100%" cellpadding="5" cellspacing="5" class="hl">
                      {if $MESSAGE}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3"><strong>{$TR_HOSTING_INFO}</strong></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_DATE}</td>
                        <td class="content"><span class="content2"> {$DATE}</span></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_HP}</td>
                        <td class="content">{$HP}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_DOMAIN}</td>
                        <td class="content"><input name="domain" type="text" class="textinput" id="domain" style="width:210px" value="{$DOMAINNAME}" />
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_DMN_IP}</td>
                        <td class="content"><select name="domain_ip">
                            {section name=i loop=$IP_NUM}
                            <option value="{$IP_VALUE[i]}" {$IP_SELECTED[i]}>{$IP_NUM[i]}&nbsp;({$IP_NAME[i]})</option>
                            {/section}
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3"><b>{$TR_CUSTOMER_DATA}</b></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_CUSTOMER_ID}</td>
                        <td class="content"><input name="customer_id" type="text" class="textinput" id="customer_id" style="width:210px" value="{$CUSTOMER_ID}" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td width="203" class="content2"> {$TR_FIRST_NAME}</td>
                        <td class="content"><input type="text" name="fname" value="{$FNAME}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2"> {$TR_LAST_NAME}</td>
                        <td width="516" class="content"><input type="text" name="lname" value="{$LNAME}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_GENDER}</td>
                        <td class="content">
                            <select name="gender" size="1">
                               <option value="M" {$VL_MALE}>{$TR_MALE}</option>
                               <option value="F" {$VL_FEMALE}>{$TR_FEMALE}</option>
                               <option value="U" {$VL_UNKNOWN}>{$TR_UNKNOWN}</option>
                            </select>
                         </td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_COMPANY}</td>
                        <td class="content"><input type="text" name="firm" value="{$FIRM}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_ZIP_POSTAL_CODE}</td>
                        <td class="content"><input type="text" name="zip" value="{$ZIP}" style="width:80px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_CITY}</td>
                        <td class="content"><input type="text" name="city" value="{$CITY}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_STATE}</td>
                        <td class="content"><input type="text" name="state" value="{$STATE}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_COUNTRY}</td>
                        <td class="content"><input type="text" name="country" value="{$COUNTRY}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_STREET_1}</td>
                        <td class="content"><input type="text" name="street1" value="{$STREET1}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_STREET_2}</td>
                        <td class="content"><input type="text" name="street2" value="{$STREET2}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_EMAIL}</td>
                        <td class="content"><input type="text" name="email" value="{$EMAIL}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_PHONE}</td>
                        <td class="content"><input type="text" name="phone" value="{$PHONE}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2">{$TR_FAX}</td>
                        <td class="content"><input type="text" name="fax" value="{$FAX}" style="width:210px" class="textinput" /></td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2"><input name="add" type="button" onClick="return sbmt(document.forms[0],'add_user');" class="button" value="{$TR_ADD}" />
                          &nbsp;&nbsp;
                          <input name="update" type="button" onClick="return sbmt(document.forms[0],'update_data');" class="button" value="{$TR_UPDATE_DATA}" />
                          &nbsp;&nbsp;
                          <input name="delete" type="button" onClick="delete_order('orders_delete.php?order_id={$ID}', '{$DOMAIN}')" class="button" value="{$TR_DELETE_ORDER}" />
                          <input type="hidden" name="uaction" value="" />
                          <input name="order_id" type="hidden" value="{$ID}" /></td>
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

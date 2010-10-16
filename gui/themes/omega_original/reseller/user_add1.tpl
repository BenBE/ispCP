<script type="text/javascript">
/*<![CDATA[*/
	$(document).ready(function(){
		// Tooltips - begin
		$('#dmn_help').ispCPtooltips({ msg:"{$TR_DMN_HELP}" });
		// Tooltips - end
	});
/*]]>*/
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_user.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><form name="reseller_add_users_first_frm" method="post" action="user_add1.php">
                    <table width="100%" cellpadding="5" cellspacing="5">
                      {if $MESSAGE}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                      </tr>
                      {/if}
                      {if $ADD_FORM != 'no'}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td colspan="2" class="content3">{$TR_CORE_DATA}</td>
                      </tr>
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2" width="200">
						 {$TR_DOMAIN_NAME} <img id="dmn_help" src="{$THEME_COLOR_PATH}/images/icons/help.png" width="16" height="16" alt="" />
						</td>
                        <td class="content">
                          <input type="text" name="dmn_name" value="{$DMN_NAME_VALUE}" style="width:210px" class="textinput" />
                        </td>
                      </tr>
		      <!-- BDP: expire -->
		      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2" width="200">{$TR_DOMAIN_EXPIRE}</td>
                        <td class="content"><select name="dmn_expire">
							<option value="0"{$EXPIRE_NEVER_SET}>{$TR_DOMAIN_EXPIRE_NEVER}</option>
							<option value="1"{$EXPIRE_1_MONTH_SET}>{$TR_DOMAIN_EXPIRE_1_MONTH}</option>
							<option value="2"{$EXPIRE_2_MONTH_SET}>{$TR_DOMAIN_EXPIRE_2_MONTHS}</option>
							<option value="3"{$EXPIRE_3_MONTH_SET}>{$TR_DOMAIN_EXPIRE_3_MONTHS}</option>
							<option value="6"{$EXPIRE_6_MONTH_SET}>{$TR_DOMAIN_EXPIRE_6_MONTHS}</option>
							<option value="12"{$EXPIRE_1_YEAR_SET}>{$TR_DOMAIN_EXPIRE_1_YEAR}</option>
							<option value="24"{$EXPIRE_2_YEARS_SET}>{$TR_DOMAIN_EXPIRE_2_YEARS}</option>
						</select>
                        </td>
                      </tr>
                      {if $ADD_USER != 'no'}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2" width="200">{$TR_CHOOSE_HOSTING_PLAN}</td>
                        <td class="content"><select name="dmn_tpl">
                            {section name=i loop=$HP_NAME}
                            <option value="{$CHN[i]}" {$CH_SEL[i]}>{$HP_NAME[i]}</option>
                            {/section}
                          </select>
                        </td>
                      </tr>
                      {if $PERSONALIZE != 'no'}
                      <tr>
                        <td width="25">&nbsp;</td>
                        <td class="content2" width="200">{$TR_PERSONALIZE_TEMPLATE}</td>
                        <td class="content">{$TR_YES}
                          <input type="radio" name="chtpl" value="_yes_" {$CHTPL1_VAL} />
                          {$TR_NO}
                          <input type="radio" name="chtpl" value="_no_" {$CHTPL2_VAL} />
                        </td>
                      </tr>
                      {/if}
                      {/if}
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="2"><input name="Submit" type="submit" class="button" value="{$TR_NEXT_STEP}" /></td>
                      </tr>
                      {/if}
                    </table>
                  <input type="hidden" name="uaction" value="user_add_nxt" />
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>

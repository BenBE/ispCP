<script type="text/javascript">
/*<![CDATA[*/

	function action_delete(url, language) {

		if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", language)))
			return false;

		location = url;
	}

	// Overrides exportation url to enable/disable gzip compression
	//
	// author Laurent Declercq <laurent.declercq@ispcp.net>
	// Since 1.0.6
	function override_export_url(ob) {

		regexp = new RegExp('[a-z_]*([0-9]+)');
		link = document.getElementById('url_export' + regexp.exec(ob.id)[1]);

		if(ob.checked) {
			link.href = link.href + '&compress=1';
		} else {
			link.href = link.href. substring(0, link.href.indexOf('&compress'));
		}
	}

/*]]>*/
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_multilanguage.png" width="25" height="25" alt="" /></td>
                            <td colspan="2" class="title">{$TR_MULTILANGUAGE}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><form action="multilanguage.php" method="post" enctype="multipart/form-data" name="set_layout" id="set_layout">
                          <table width="100%" cellpadding="5" cellspacing="5">
                            {if $MESSAGE}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="5" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="5" class="content3"><b>{$TR_INSTALLED_LANGUAGES}</b></td>
                            </tr>
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td class="content2"><strong>{$TR_LANGUAGE}</strong></td>
                              <td class="content2"><strong>{$TR_MESSAGES}</strong></td>
                              <td class="content2"><strong>{$TR_LANG_REV}</strong></td>
                              <td width="100" colspan="2" align="center" class="content2"><strong>{$TR_ACTION}</strong></td>
                            </tr>
                            {section name=i loop=$LANG_CLASS}
                            <tr class="hl">
                              <td width="25" nowrap="nowrap">&nbsp;</td>
                              <td class="{$LANG_CLASS[i]}" nowrap="nowrap"><img src="{$THEME_COLOR_PATH}/images/icons/locale.png" width="16" height="16" style="vertical-align:middle" alt="" /> {$LANGUAGE[i]}</td>
                              <td class="{$LANG_CLASS[i]}" nowrap="nowrap">{$MESSAGES[i]}</td>
                              <td class="{$LANG_CLASS[i]}" nowrap="nowrap">{$LANGUAGE_REVISION[i]}</td>
							  <td class="{$LANG_CLASS[i]}" width="100" nowrap="nowrap" style="vertical-align:middle">
							    <img src="{$THEME_COLOR_PATH}/images/icons/details.png" width="16" height="16" border="0" style="vertical-align:middle" alt="{$TR_EXPORT}" /> <a href="{$URL_EXPORT[i]}" id="url_export{$INDEX[i]}" class="link" target="_blank">{$TR_EXPORT}</a>
								<input id="gz_export{$INDEX[i]}" type="checkbox" onClick="override_export_url(this)" style="vertical-align:middle;margin-bottom:3px;" /><span style="font-size:8px;vertical-align:middle;">{$TR_GZIPPED[i]}</span>
							  </td>
                              <td class="{$LANG_CLASS[i]}" width="100" nowrap="nowrap"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" />
                                {if $LANG_DELETE_SHOW[i]}
                                {$TR_UNINSTALL[i]}
                                {/if}
                                {if $LANG_DELETE_LINK[i]}
                                <a href="#" onClick="action_delete('{$URL_DELETE[i]}', '{$LANGUAGE[i]}')" class="link">{$TR_UNINSTALL[i]}</a>
                                {/if}</td>
                            </tr>
                            {/section}
                          </table>
                          <br />
                          <br />
                          <br />
                          <table width="100%" cellpadding="5" cellspacing="5">
                            <tr>
                              <td width="25">&nbsp;</td>
                              <td colspan="2" class="content3"><b>{$TR_INSTALL_NEW_LANGUAGE}</b></td>
                            </tr>
                            <tr>
                              <td width="25" nowrap="nowrap">&nbsp;</td>
                              <td width="230" class="content2" nowrap="nowrap">{$TR_LANGUAGE_FILE}</td>
                              <td nowrap="nowrap" class="content"><input type="file" name="lang_file" class="textinput" size="60" />
                              </td>
                            </tr>
                            <tr>
                              <td width="25" nowrap="nowrap">&nbsp;</td>
                              <td colspan="2" nowrap="nowrap"><input name="Button" type="button" class="button" value="  {$TR_INSTALL}  " onClick="return sbmt(document.forms[0],'upload_language');" /></td>
                            </tr>
                          </table>
                        <input type="hidden" name="uaction" value="" />
                      </form></td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table>

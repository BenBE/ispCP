
<script type="text/javascript">
<!--
function over(number) {
	document.images["image"+number+"_1"].src = '{$THEME_COLOR_PATH}/images/bars/menu_button_left.gif';
	document.images["image"+number+"_2"].src = '{$THEME_COLOR_PATH}/images/bars/menu_button_right.gif';
	if (document.layers) {
		document.layers["m"+number].background.src = '{$THEME_COLOR_PATH}/images/bars/menu_button_background.gif';
	} else if (document.all) {
		window.document.all["id"+number].style.backgroundImage = 'url({$THEME_COLOR_PATH}/images/bars/menu_button_background.gif)';
	}
}

function out(number) {
	document.images["image"+number+"_1"].src = '../images/menubutton_left.gif';
	document.images["image"+number+"_2"].src = '../images/menubutton_right.gif';
	if (document.layers) {
		document.layers["m"+number].background.src = '../images/menubutton_background.gif';
	} else if (document.all) {
		window.document.all["id"+number].style.backgroundImage = 'url(../images/menubutton_background.gif)';
	}
}

{if $JS_TO_ALL_DOMAIN != 'no'}
function begin_js() {
	document.forms[0].sub_id.disabled = true;
	document.forms[0].als_id.disabled = true;
	document.forms[0].username.focus();
}

function changeDom(wath) {
	if (wath == "real") {
		document.forms[0].sub_id.disabled = true;
		document.forms[0].als_id.disabled = true;
	} else if (wath == "subdom") {
		document.forms[0].sub_id.disabled = false;
		document.forms[0].als_id.disabled = true;
	} else {
		document.forms[0].sub_id.disabled = true;
		document.forms[0].als_id.disabled = false;
	}
}
{/if}

{if $JS_NOT_DOMAIN != 'no'}
function begin_js() {
	document.forms[0].username.focus();
}
{/if}

{if $JS_TO_SUBDOMAIN != 'no'}
function begin_js() {
	document.forms[0].sub_id.disabled = true;
	document.forms[0].username.focus();
}

function changeDom(wath) {
	if (wath == "real") {
		document.forms[0].sub_id.disabled = true;
	} else if (wath == "subdom") {
		document.forms[0].sub_id.disabled = false;
	} else {
		document.forms[0].sub_id.disabled = true;
	}
}
{/if}

{if $JS_TO_ALIAS_DOMAIN != 'no'}
function begin_js() {
	document.forms[0].als_id.disabled = true;
	document.forms[0].username.focus();
}

function changeDom(wath) {
	if (wath == "real") {
		document.forms[0].als_id.disabled = true;
	} else if (wath == "subdom") {
		document.forms[0].als_id.disabled = true;
	} else {
		document.forms[0].als_id.disabled = false;
	}
}
{/if}
//-->
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                    <tr>
                      <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_ftp.png" width="25" height="25" alt="" /></td>
                      <td colspan="2" class="title">{$TR_ADD_FTP_USER}</td>
                    </tr>
                </table></td>
                <td width="27" align="right">&nbsp;</td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="40">&nbsp;</td>
                      <td valign="top"><form name="add_ftp_acc_frm" method="post" action="ftp_add.php">
                          <table width="100%" cellspacing="7">
                            {if $MESSAGE}
                            <tr>
                              <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
                            </tr>
                            {/if}
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200">{$TR_USERNAME}</td>
                              <td class="content" nowrap="nowrap"><input type="text" name="username" value="{$USERNAME}" style="width:170px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><input type="radio" name="dmn_type" value="dmn" onFocus="changeDom('real');" {$DMN_TYPE_CHECKED} />
                                {$TR_TO_MAIN_DOMAIN}</td>
                              <td class="content" nowrap="nowrap">{$FTP_SEPARATOR}{$DOMAIN_NAME}</td>
                            </tr>
                            {if $TO_ALIAS_DOMAIN != 'no'}
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><input type="radio" name="dmn_type" value="als" onFocus="changeDom('alias');" {$ALS_TYPE_CHECKED} />
                                {$TR_TO_DOMAIN_ALIAS}</td>
                              <td class="content" nowrap="nowrap"><select name="als_id">
                                  {section name=i loop=$ALS_ID}
                                  <option value="{$ALS_ID[i]}" {$ALS_SELECTED[i]}>{$FTP_SEPARATOR[i]}{$ALS_NAME[i]}</option>
                                  {/section}
                                </select></td>
                            </tr>
                            {/if}
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200">{$TR_PASSWORD}</td>
                              <td class="content" nowrap="nowrap"><input type="password" name="pass" value="" style="width:170px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200">{$TR_PASSWORD_REPEAT}</td>
                              <td nowrap="nowrap" class="content"><input type="password" name="pass_rep" value="" style="width:170px" class="textinput" /></td>
                            </tr>
                            <tr>
                              <td nowrap="nowrap" class="content2" width="200"><input id="use_other_dir" type="checkbox" name="use_other_dir" {$USE_OTHER_DIR_CHECKED} />
                                <label for="use_other_dir">{$TR_USE_OTHER_DIR}</label></td>
                              <td nowrap="nowrap" class="content"><input type="text" name="other_dir" value="{$OTHER_DIR}" style="width:170px" class="textinput" />
                                  <br />
                                <a href="#" onClick="showFileTree();" class="link">{$CHOOSE_DIR}</a></td>
                            </tr>
                          </table>
                        <input name="Submit" type="submit" class="button" value=" {$TR_ADD} " />
                          <input type="hidden" name="uaction" value="add_user" />
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

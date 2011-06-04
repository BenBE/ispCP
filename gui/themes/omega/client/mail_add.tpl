{include file='header.tpl'}
<body onload="begin_js();">
	<script type="text/javascript">
	/* <![CDATA[ */
		jQuery(document).ready(function(){
			// Tooltips - begin
			jQuery('#fwd_help').ispCPtooltips({ msg:"{$TR_FWD_HELP}"});
			// Tooltips - end
		});

		function changeType() {
			if (document.forms[0].elements['mail_type_normal'].checked == true) {
				document.forms[0].pass.disabled = false;
				document.forms[0].pass_rep.disabled = false;
			} else {
				document.forms[0].pass.disabled = true;
				document.forms[0].pass_rep.disabled = true;
			}
			if (document.forms[0].elements['mail_type_forward'].checked == true) {
				document.forms[0].forward_list.disabled = false;
			} else {
				document.forms[0].forward_list.disabled = true;
			}
		}

	function begin_js() {
		if (document.getElementsByName('als_id').length !== 0) {
			if (document.getElementById('dmn_type2').checked) {
				document.forms[0].als_id.disabled = false;
			} else {
				document.forms[0].als_id.disabled = true;
			}
		}
		if (document.getElementsByName('sub_id').length !== 0) {
			if (document.getElementById('dmn_type3').checked) {
				document.forms[0].sub_id.disabled = false;
			} else {
				document.forms[0].sub_id.disabled = true;
			}
		}
		if (document.getElementsByName('als_sub_id').length !== 0) {
			if (document.getElementById('dmn_type4').checked) {
				document.forms[0].als_sub_id.disabled = false;
			} else {
				document.forms[0].als_sub_id.disabled = true;
			}
		}
//		document.forms[0].pass.disabled = false;
//		document.forms[0].pass_rep.disabled = false;
//		document.forms[0].forward_list.disabled = true;
		changeType();
		document.forms[0].username.focus();
	}

	function changeDom(what) {
		if (document.getElementsByName('als_id').length !== 0) {
			if (what == "alias") {
				document.forms[0].als_id.disabled = false;
			} else {
				document.forms[0].als_id.disabled = true;
			}
		}
		if (document.getElementsByName('sub_id').length !== 0) {
			if (what == "subdom") {
				document.forms[0].sub_id.disabled = false;
			} else  {
				document.forms[0].sub_id.disabled = true;
			}
		}
		if (document.getElementsByName('als_sub_id').length !== 0) {
			if (what == "als_subdom") {
				document.forms[0].als_sub_id.disabled = false;
			} else {
				document.forms[0].als_sub_id.disabled = true;
			}
		}
	}
	/* ]]> */
	</script>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="email">{$TR_MENU_EMAIL_ACCOUNTS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="mail_accounts.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_ADD_MAIL_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="email"><span>{$TR_ADD_MAIL_USER}</span></h2>
		<form action="mail_add.php" method="post" id="client_mail_add">
			<table>
				<tr>
					<td>{$TR_USERNAME}</td>
					<td><input type="text" name="username" id="username" value="{$USERNAME}" /></td>
				</tr>
				<tr>
					<td><input type="radio" name="dmn_type" id="dmn_type1" value="dmn" onclick="changeDom('real');" {$MAIL_DMN_CHECKED} />&nbsp;{$TR_TO_MAIN_DOMAIN}</td>
			  		<td>{$DOMAIN_NAME}</td>
				</tr>
				{if isset($ALS_NAME)}
				<tr>
					<td><input type="radio" name="dmn_type" id="dmn_type2" value="als" onclick="changeDom('alias');" {$MAIL_ALS_CHECKED} />&nbsp;{$TR_TO_DMN_ALIAS}</td>
					<td>
						<select name="als_id">
							{section name=i loop=$ALS_NAME}
							<option value="{$ALS_ID[i]}" {$ALS_SELECTED[i]}>@{$ALS_NAME[i]}</option>
							{/section}
						</select>
					</td>
				</tr>
				{/if}
				{if isset($SUB_NAME)}
				<tr>
					<td><input type="radio" name="dmn_type" id="dmn_type3" value="sub" onclick="changeDom('subdom');" {$MAIL_SUB_CHECKED} />&nbsp;{$TR_TO_SUBDOMAIN}</td>
					<td>
						<select name="sub_id">
							{section name=i loop=$SUB_NAME}
							<option value="{$SUB_ID[i]}" {$SUB_SELECTED[i]}>@{$SUB_NAME[i]}</option>
							{/section}
						</select>
					</td>
				</tr>
				{/if}
				{if isset($ALS_SUB_NAME)}
				<tr>
					<td><input type="radio" name="dmn_type" id="dmn_type4" value="als_sub" onclick="changeDom('als_subdom');" {$MAIL_ALS_SUB_CHECKED} />&nbsp;{$TR_TO_ALS_SUBDOMAIN}</td>
					<td>
						<select name="als_sub_id">
							{section name=i loop=$ALS_SUB_NAME}
							<option value="{$ALS_SUB_ID[i]}" {$ALS_SUB_SELECTED[i]}>@{$ALS_SUB_NAME[i]}</option>
							{/section}
						</select>
					</td>
				</tr>
				{/if}
				<tr>
					<td colspan="2"><input type="checkbox" name="mail_type_normal" value="1" onclick="changeType();" {$NORMAL_MAIL_CHECKED} />&nbsp;{$TR_NORMAL_MAIL}</td>
				</tr>
				<tr>
					<td>{$TR_PASSWORD}</td>
					<td><input type="password" name="pass" id="pass" value="" /></td>
				</tr>
				<tr>
					<td>{$TR_PASSWORD_REPEAT}</td>
					<td><input type="password" name="pass_rep" id="pass_rep" value="" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="checkbox" name="mail_type_forward" id="mail_type_forward" value="1" onclick="changeType();" {$FORWARD_MAIL_CHECKED} />&nbsp;{$TR_FORWARD_MAIL}</td>
				</tr>
				<tr>
					<td>{$TR_FORWARD_TO} <span id="fwd_help" class="icon i_help">&nbsp;</span></td>
					<td><textarea name="forward_list" id="forward_list" cols="35" rows="5">{$FORWARD_LIST}</textarea></td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="add_user" />
				<input type="submit" name="Submit" value="{$TR_ADD}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_EDIT_EMAIL_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_EDIT_EMAIL_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.ui.tooltip.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ispcpTooltips.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Tooltips - begin
			$('#fwd_help').ispCPtooltips({msg:"{TR_FWD_HELP}"});
			// Tooltips - end
		});

		function begin_js() {
			if (typeof(document.getElementById('client_mail_edit').elements['mail_forward']) != 'undefined') {
				if (document.getElementById('client_mail_edit').elements['mail_forward'].checked == false) {
					document.getElementById('client_mail_edit').elements['forward_list'].disabled = true;
				}
			}
		}

		function changeType(what) {
			if (what == "forward") {
				if (document.getElementById('client_mail_edit').elements['forward_list'].disabled == true) {
				 	document.getElementById('client_mail_edit').elements['forward_list'].disabled = false;
				} else {
					document.getElementById('client_mail_edit').elements['forward_list'].disabled = true;
				}
			}
		}
	/* ]]> */
	</script>
</head>
<body onload="begin_js();">
	<div class="header">
		{MAIN_MENU}
		<div class="logo">
			<img src="{THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="email">{TR_MENU_EMAIL_ACCOUNTS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="mail_accounts.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_EDIT_EMAIL_ACCOUNT}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="email"><span>{TR_EDIT_EMAIL_ACCOUNT}</span></h2>
		<form action="mail_edit.php?id={MAIL_ID}" method="post" id="client_mail_edit">
			<fieldset>
				<legend>{EMAIL_ACCOUNT}</legend>
				<!-- BDP: normal_mail -->
				<table>
					<tr>
						<td>{TR_PASSWORD}</td>
						<td><input type="password" name="pass" id="pass" value="" /></td>
					</tr>
					<tr>
						<td>{TR_PASSWORD_REPEAT}</td>
						<td><input type="password" name="pass_rep" id="pass_rep" value="" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="checkbox" name="mail_forward" id="mail_forward" value="1" onclick="changeType('forward');" {FORWARD_MAIL_CHECKED} />&nbsp;{TR_FORWARD_MAIL}</td>
					</tr>
					<tr>
						<td>{TR_FORWARD_TO} <span id="fwd_help" class="icon i_help">&nbsp;</span></td>
						<td><textarea name="forward_list" id="forward_list" cols="35" rows="5">{FORWARD_LIST}</textarea></td>
					</tr>
				</table>
				<!-- EDP: normal_mail -->
				<!-- BDP: forward_mail -->
				<table>
					<tr>
						<td>{TR_FORWARD_TO} <span id="fwd_help" class="icon i_help">&nbsp;</span></td>
	   					<td><textarea name="forward_list" cols="35" rows="5">{FORWARD_LIST}</textarea></td>
	   				</tr>
				</table>
				<!-- EDP: forward_mail -->
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="id" value="{MAIL_ID}" />
				<input type="hidden" name="mail_account" value="{EMAIL_ACCOUNT}" />
				<input type="hidden" name="mail_type" value="{MAIL_TYPE}" />
				<input type="hidden" name="uaction" value="{ACTION}" />
				<input type="submit" name="Submit"  value="{TR_SAVE}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_NEW_TICKET_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_NEW_TICKET_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) {
			return confirm(sprintf("{TR_MESSAGE_DELETE}", subject));
		}
	/* ]]> */
	</script>
</head>
<body>
	<div class="header">
		{MAIN_MENU}
		<div class="logo">
			<img src="{THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="support">{TR_MENU_QUESTIONS_AND_COMMENTS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
		   	<li><a href="{SUPPORT_SYSTEM_PATH}">{TR_MENU_QUESTIONS_AND_COMMENTS}</a></li>
			<li><a>{TR_NEW_TICKET}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="support"><span>{TR_NEW_TICKET}</span></h2>
		<form action="ticket_create.php" method="post" id="reseller_ticket_create">
			<table>
				<tbody>
					<tr>
						<td><label for="urgency">{TR_URGENCY}</label></td>
						<td>
							<select name="urgency" id="urgency">
								<option value="1" {OPT_URGENCY_1}>{TR_LOW}</option>
								<option value="2" {OPT_URGENCY_2}>{TR_MEDIUM}</option>
								<option value="3" {OPT_URGENCY_3}>{TR_HIGH}</option>
								<option value="4" {OPT_URGENCY_4}>{TR_VERI_HIGH}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label for="subj">{TR_SUBJECT}</label></td>
						<td><input type="text" name="subj" id="subj" value="{SUBJECT}" /></td>
					</tr>
					<tr>
						<td><label for="user_message">{TR_YOUR_MESSAGE}</label></td>
						<td><textarea name="user_message" id="user_message" cols="80" rows="12">{USER_MESSAGE}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="send_msg" />
				<input type="submit" name="Submit" value="{TR_SEND_MESSAGE}" />
			</div>	
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_MENU_QUESTIONS_AND_COMMENTS}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_MENU_QUESTIONS_AND_COMMENTS}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			$('#SubmitAction').click(function() {
				form = document.getElementById('admin_ticket_view');
				form.uaction.value = '{ACTION}';
				form.submit();
			});
		});
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
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="{SUPPORT_SYSTEM_PATH}">{TR_MENU_SUPPORT_SYSTEM}</a></li>
			<li><a>{TR_VIEW_SUPPORT_TICKET}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="support"><span>{TR_VIEW_SUPPORT_TICKET}</span></h2>
		<!-- BDP: tickets_list -->
		<table>
			<tr>
				<td>{TR_TICKET_URGENCY}:</td>
				<td>{URGENCY}</td>
			</tr>
			<tr>
				<td>{TR_TICKET_SUBJECT}:</td>
				<td>{SUBJECT}</td>
			</tr>
			<!-- BDP: tickets_item -->
			<tr>
				<td>{TR_TICKET_FROM}:</td>
				<td>{FROM}</td>
			</tr>
			<tr>
				<td>{TR_TICKET_DATE}:</td>
				<td>{DATE}</td>
			</tr>
			<tr>
				<td colspan="2">{TICKET_CONTENT}</td>
			</tr>
			<!-- EDP: tickets_item -->
		</table>
		<!-- EDP: tickets_list -->
		<h2 class="doc">{TR_NEW_TICKET_REPLY}</h2>
		<form action="ticket_view.php?ticket_id={ID}" method="post" id="admin_ticket_view">
			<table>
				<tbody>
					<tr>
						<td><textarea name="user_message" cols="80" rows="12"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="buttons">
				<input type="hidden" name="screenwidth" value="{SCREENWIDTH}" />
				<input type="hidden" name="subject" value="{SUBJECT}" />
				<input type="hidden" name="urgency" value="{URGENCY_ID}" />
				<input type="hidden" name="uaction" value="send_msg" />
				<input type="submit" name="Submit" value="{TR_REPLY}" />
				<input type="submit" name="SubmitAction" id="SubmitAction" value="{TR_ACTION}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
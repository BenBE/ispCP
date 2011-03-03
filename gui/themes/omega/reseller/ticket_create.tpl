{include file='header.tpl'}
<body>
	{literal}
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, subject) {
			return confirm(sprintf("{$TR_MESSAGE_DELETE}", subject));
		}
	/* ]]> */
	</script>
	{/literal}
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="support">{$TR_MENU_QUESTIONS_AND_COMMENTS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
		   	<li><a href="{$SUPPORT_SYSTEM_PATH}">{$TR_MENU_QUESTIONS_AND_COMMENTS}</a></li>
			<li><a>{$TR_NEW_TICKET}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="support"><span>{$TR_NEW_TICKET}</span></h2>
		<form action="ticket_create.php" method="post" id="reseller_ticket_create">
			<table>
				<tbody>
					<tr>
						<td><label for="urgency">{$TR_URGENCY}</label></td>
						<td>
							<select name="urgency" id="urgency">
								<option value="1" {$OPT_URGENCY_1}>{$TR_LOW}</option>
								<option value="2" {$OPT_URGENCY_2}>{$TR_MEDIUM}</option>
								<option value="3" {$OPT_URGENCY_3}>{$TR_HIGH}</option>
								<option value="4" {$OPT_URGENCY_4}>{$TR_VERI_HIGH}</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label for="subj">{$TR_SUBJECT}</label></td>
						<td><input type="text" name="subj" id="subj" value="{$SUBJECT}" /></td>
					</tr>
					<tr>
						<td><label for="user_message">{$TR_YOUR_MESSAGE}</label></td>
						<td><textarea name="user_message" id="user_message" cols="80" rows="12">{$USER_MESSAGE}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="send_msg" />
				<input type="submit" name="Submit" value="{$TR_SEND_MESSAGE}" />
			</div>	
		</form>
	</div>
{include file='footer.tpl'}
{include file='header.tpl'}
<body>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="purchasing">{$TR_MENU_ORDERS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="orders.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MENU_ORDER_EMAIL}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
   		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
	   	{/if}
		<h2 class="email"><span>{$TR_MENU_ORDER_EMAIL}</span></h2>
		<form action="order_email.php" method="post" id="reseller_order_email">
			<fieldset>
				<legend>{$TR_MESSAGE_TEMPLATE_INFO}</legend>
				<table>
					<tr>
						<td>{$TR_USER_DOMAIN}</td>
						<td>{literal}{DOMAIN}{/literal}</td>
					</tr>
					<tr>
						<td>{$TR_USER_REAL_NAME}</td>
						<td>{literal}{NAME}{/literal}</td>
					</tr>
					<tr>
						<td>{$TR_ACTIVATION_LINK}</td>
						<td>{literal}{ACTIVATION_LINK}{/literal}</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>{$TR_MESSAGE_TEMPLATE}</legend>
				<table>
					<tr>
						<td>{$TR_SUBJECT}</td>
						<td><input type="text" name="auto_subject" id="auto_subject" value="{$SUBJECT_VALUE}" /></td>
					</tr>
					<tr>
						<td>{$TR_MESSAGE}</td>
						<td><textarea name="auto_message" id="auto_message" cols="80" rows="30">{$MESSAGE_VALUE}</textarea></td>
					</tr>
					<tr>
						<td>{$TR_SENDER_EMAIL}</td>
						<td>{$SENDER_EMAIL_VALUE}</td>
					</tr>
					<tr>
						<td>{$TR_SENDER_NAME}</td>
						<td>{$SENDER_NAME_VALUE}</td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="order_email" />
				<input type="submit" name="Submit" value="{$TR_APPLY_CHANGES}" />
			</div>
		</form>
	</div>
{include file='footer.tpl'}
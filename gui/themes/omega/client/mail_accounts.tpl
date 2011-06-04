{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		jQuery(document).ready(function(){
			// TableSorter - begin
			jQuery('.tablesorter').tablesorter({ cssHeader: 'tablesorter'});
			// TableSorter - end
		});

		function action_delete(url, subject) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", subject)))
				return false;
			location = url;
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
			<li><a>{$TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		{if isset($MAIL_MSG)}
		<div class="{$MAIL_MSG_TYPE}">{$MAIL_MSG}</div>
		{/if}
		{if isset($MAIL_ACC)}
		<h2 class="email"><span>{$TR_MAIL_USERS}</span></h2>
		<table class="tablesorter">
			<thead>
				<tr>
					<th>{$TR_MAIL}</th>
					<th>{$TR_TYPE}</th>
					<th>{$TR_STATUS}</th>
					<th>{$TR_ACTION}</th>
				</tr>
			</thead>
			{if isset($TOTAL_MAIL_ACCOUNTS)}
			<tfoot>
				<tr>
					<td colspan="4">{$TR_TOTAL_MAIL_ACCOUNTS}: {$TOTAL_MAIL_ACCOUNTS}/{$ALLOWED_MAIL_ACCOUNTS}</td>
				</tr>
			</tfoot>
			{/if}
			<tbody>
				{section name=i loop=$MAIL_ACC}
				<tr>
					<td>
						<span class="icon i_mail_icon">{$MAIL_ACC[i]}</span>
						{if isset($AUTO_RESPOND_DISABLE[i])}
						<div style="display: {$AUTO_RESPOND_VIS[i]};font-size: smaller;">
							<br />
					  		{$TR_AUTORESPOND}: [ <a href="{$AUTO_RESPOND_DISABLE_SCRIPT[i]}">{$AUTO_RESPOND_DISABLE[i]}</a> <a href="{$AUTO_RESPOND_EDIT_SCRIPT[i]}">{$AUTO_RESPOND_EDIT[i]}</a> ]
						  </div>
					  {/if}
					</td>
					<td>{$MAIL_TYPE[i]}</td>
					<td>{$MAIL_STATUS[i]}</td>
					<td>
						<a href="{$MAIL_EDIT_URL[i]}" title="{$TR_EDIT}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('{$MAIL_DELETE_URL[i]}', '{$MAIL_ACC[i]}')" title="{$TR_DELETE}" class="icon i_delete"></a>
					</td>
				</tr>
				{/section}
			</tbody>
		</table>
		{/if}
		{if isset($TR_DEFAULT_EMAILS_BUTTON)}
		<form action="mail_accounts.php" method="post" id="showdefault">
			<div class="buttons">
				<input type="hidden" name="uaction" value="{$VL_DEFAULT_EMAILS_BUTTON}" />
			  	<input type="submit" name="Submit" value="{$TR_DEFAULT_EMAILS_BUTTON}" />
			</div>
		</form>
		{/if}
	</div>
{include file='footer.tpl'}
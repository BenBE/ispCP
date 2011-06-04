{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function() {
			$('#ticket_delete_all').click(function() {
				document.location.href = 'ticket_delete.php?delete=open';
			});
		});

		function action_delete(url, subject) {
			return confirm(sprintf("{$TR_MESSAGE_DELETE}", subject));
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
			<h1 class="support">{$TR_SUPPORT_SYSTEM}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a>{$TR_OPEN_TICKETS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		{if isset($SUBJECT)}
		<h2 class="support"><span>{$TR_OPEN_TICKETS}</span></h2>
		<div class="buttons">
			<input type="button" name="ticket_delete_all" id="ticket_delete_all" value="{$TR_DELETE_ALL}" />
		</div>
		<table>
			<thead>
				<tr>
					<th>{$TR_STATUS}</th>
					<th>{$TR_SUBJECT}</th>
					<th>{$TR_URGENCY}</th>
					<th>{$TR_LAST_DATA}</th>
					<th>{$TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				{section name=i loop=$NEW}
				<tr>
					<td>{$NEW[i]}</td>
					<td><a href="ticket_view.php?ticket_id={$ID[i]}" class="icon i_document">{$SUBJECT[i]}</a></td>
					<td>{$URGENCY[i]}</td>
					<td>{$LAST_DATE[i]}</td>
					<td>
						<a href="ticket_view.php?ticket_id={$ID[i]}" title="{$TR_EDIT}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('ticket_delete.php?ticket_id={$ID[i]}', '{$SUBJECT2[i]}')" title="{$TR_DELETE}" class="icon i_delete"></a></td>
				</tr>
				{/section}
			</tbody>
		</table>
		<div class="paginator">
			{if !isset($SCROLL_NEXT_GRAY)}
			<span class="icon i_next_gray">&nbsp;</span>
			{/if}
			{if !isset($SCROLL_NEXT)}
			<a href="ticket_system.php?psi={$NEXT_PSI}" title="next" class="icon i_next">next</a>
			{/if}
			{if !isset($SCROLL_PREV_GRAY)}
			<span class="icon i_prev_gray">&nbsp;</span>
			{/if}
			{if !isset($SCROLL_PREV)}
			<a href="ticket_system.php?psi={$PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			{/if}
		</div>
		{/if}
	</div>
{include file='footer.tpl'}
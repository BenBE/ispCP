<!-- INCLUDE "header.tpl" -->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function() {
			$('#ticket_delete_all').click(function() {
				document.location.href = 'ticket_delete.php?delete=open';
			});
		});

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
			<h1 class="support">{TR_SUPPORT_SYSTEM}</h1>
		</div>
		<ul class="location-menu">
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a>{TR_OPEN_TICKETS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: tickets_list -->
		<h2 class="support"><span>{TR_OPEN_TICKETS}</span></h2>
		<div class="buttons">
			<input type="button" name="ticket_delete_all" id="ticket_delete_all" value="{TR_DELETE_ALL}" />
		</div>
		<table>
			<thead>
				<tr>
					<th>{TR_STATUS}</th>
					<th>{TR_TICKET_FROM}</th>
					<th>{TR_SUBJECT}</th>
					<th>{TR_URGENCY}</th>
					<th>{TR_LAST_DATA}</th>
					<th>{TR_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: tickets_item -->
				<tr>
					<td>{NEW}</td>
					<td>{FROM}</td>
					<td><a href="ticket_view.php?ticket_id={ID}" class="icon i_document">{SUBJECT}</a></td>
					<td>{URGENCY}</td>
					<td>{LAST_DATE}</td>
					<td>
						<a href="ticket_view.php?ticket_id={ID}" title="{TR_EDIT}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('ticket_delete.php?ticket_id={ID}', '{SUBJECT2}')" title="{TR_DELETE}" class="icon i_delete"></a></td>
				</tr>
				<!-- EDP: tickets_item -->
			</tbody>
		</table>
		<div class="paginator">
			<!-- BDP: scroll_next_gray -->
			<span class="icon i_next_gray">&nbsp;</span>
			<!-- EDP: scroll_next_gray -->
			<!-- BDP: scroll_next -->
			<a href="ticket_system.php?psi={NEXT_PSI}" title="next" class="icon i_next">next</a>
			<!-- EDP: scroll_next -->
			<!-- BDP: scroll_prev_gray -->
			<span class="icon i_prev_gray">&nbsp;</span>
			<!-- EDP: scroll_prev_gray -->
			<!-- BDP: scroll_prev -->
			<a href="ticket_system.php?psi={PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			<!-- EDP: scroll_prev -->
		</div>
		<!-- EDP: tickets_list -->
	</div>
<!-- INCLUDE "footer.tpl" -->
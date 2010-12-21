<!-- INCLUDE "header.tpl" -->
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
			<h1 class="general">{TR_MENU_GENERAL_INFORMATION}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="index.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_ADMIN_LOG}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="admin_lod"><span>{TR_ADMIN_LOG}</span></h2>
		<table>
			<tr>
				<th>{TR_DATE}</th>
				<th>{TR_MESSAGE}</th>
			</tr>
			<!-- BDP: log_row -->
			<tr>
				<td class="{ROW_CLASS}">{DATE}</td>
				<td class="{ROW_CLASS}">{MESSAGE}</td>
			</tr>
			<!-- EDP: log_row -->
		</table>
		<div class="paginator">
			<!-- BDP: scroll_next_gray -->
			<span class="icon i_next_gray">&nbsp;</span>
			<!-- EDP: scroll_next_gray -->
			<!-- BDP: scroll_next -->
			<a href="admin_log.php?psi={NEXT_PSI}" title="next" class="icon i_next">next</a>
			<!-- EDP: scroll_next -->
			<!-- BDP: scroll_prev_gray -->
			<span class="icon i_prev_gray">&nbsp;</span>
			<!-- EDP: scroll_prev_gray -->
			<!-- BDP: scroll_prev -->
			<a href="admin_log.php?psi={PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			<!-- EDP: scroll_prev -->
		</div>
		<br style="clear:both;" />
		<!-- BDP: clear_log -->
		<form action="admin_log.php" method="post" id="admin_log">
			<table>
				<tr>
					<td><label for="uaction_clear">{TR_CLEAR_LOG_MESSAGE}</label></td>
					<td>
						<select name="uaction_clear" id="uaction_clear">
							<option value="0" selected="selected">{TR_CLEAR_LOG_EVERYTHING}</option>
							<option value="2">{TR_CLEAR_LOG_LAST2}</option>
							<option value="4">{TR_CLEAR_LOG_LAST4}</option>
							<option value="12">{TR_CLEAR_LOG_LAST12}</option>
							<option value="26">{TR_CLEAR_LOG_LAST26}</option>
							<option value="52">{TR_CLEAR_LOG_LAST52}</option>
						</select>
					</td>
				</tr>
			</table>
			<div class="buttons">
				<input type="hidden" name="uaction" value="clear_log" />
				<input type="submit" name="Submit" value="{TR_CLEAR_LOG}" />
			</div>
		</form>
		<!-- EDP: clear_log -->
	</div>
<!-- INCLUDE "footer.tpl" -->
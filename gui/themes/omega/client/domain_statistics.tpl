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
			<h1 class="statistics">{$TR_MENU_DOMAIN_STATISTICS}</h1>
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
		<h2 class="stats"><span>{$TR_DOMAIN_STATISTICS}</span></h2>
		<form action="domain_statistics.php" method="post" id="client_domain_statistics">
			<fieldset>
				<label for="month">{$TR_MONTH}</label>
				<select name="month" id="month">
					<!-- BDP: month_item -->
					<option {$MONTH_SELECTED}>{$MONTH}</option>
					<!-- EDP: month_item -->
				</select>
				<label for="year">{$TR_YEAR}</label>
				<select name="year" id="year">
					<!-- BDP: year_item -->
					<option {$YEAR_SELECTED}>{$YEAR}</option>
					<!-- EDP: year_item -->
				</select>
				<input type="hidden" name="uaction" value="show_traff" />
				<input type="submit" name="Submit" value="{$TR_SHOW}" />
			</fieldset>
		</form>
		<table>
			<thead>
				<tr>
					<th>{$TR_DATE}</th>
					<th>{$TR_WEB_TRAFF}</th>
					<th>{$TR_FTP_TRAFF}</th>
					<th>{$TR_SMTP_TRAFF}</th>
					<th>{$TR_POP_TRAFF}</th>
					<th>{$TR_SUM}</th>
				</tr>
			</thead>
			{if isset($DATE)}
				<tfoot>
					<tr>
						<td>{$TR_ALL}</td>
						<td>{$WEB_ALL}</td>
						<td>{$FTP_ALL}</td>
						<td>{$SMTP_ALL}</td>
						<td>{$POP_ALL}</td>
						<td>{$SUM_ALL}</td>
					</tr>
				</tfoot>
				<tbody>
					<!-- BDP: traff_item -->
						<tr>
							<td>{$DATE}</td>
							<td>{$WEB_TRAFF}</td>
							<td>{$FTP_TRAFF}</td>
							<td>{$SMTP_TRAFF}</td>
							<td>{$POP_TRAFF}</td>
							<td>{$SUM_TRAFF}</td>
						</tr>
					<!-- EDP: traff_item -->
				</tbody>
			{/if}
		</table>
	</div>
{include file='footer.tpl'}
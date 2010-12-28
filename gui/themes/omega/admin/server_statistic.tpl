<!-- INCLUDE "header.tpl" -->
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
			<h1 class="statistics">{TR_MENU_STATISTICS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a>{TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="general"><span>{TR_SERVER_STATISTICS}</span></h2>
		<form action="server_statistic.php" method="post" id="reseller_user_statistics">
			<fieldset>
				{TR_MONTH}
				<select name="month" id="month">
					<!-- BDP: month_list -->
					<option{OPTION_SELECTED}>{MONTH_VALUE}</option>
					<!-- EDP: month_list -->
				</select>
				{TR_YEAR}
				<select name="year" id="year">
					<!-- BDP: year_list -->
					<option{OPTION_SELECTED}>{YEAR_VALUE}</option>
					<!-- EDP: year_list -->
				</select>
				<input type="hidden" name="uaction" value="change_data" />
				<input type="submit" name="Submit"  value="  {TR_SHOW}  " />
			</fieldset>
		</form>
		<table>
			<thead>
				<tr>
					<th>{TR_DAY}</th>
					<th>{TR_WEB_IN}</th>
					<th>{TR_WEB_OUT}</th>
					<th>{TR_SMTP_IN}</th>
					<th>{TR_SMTP_OUT}</th>
					<th>{TR_POP_IN}</th>
					<th>{TR_POP_OUT}</th>
					<th>{TR_OTHER_IN}</th>
					<th>{TR_OTHER_OUT}</th>
					<th>{TR_ALL_IN}</th>
					<th>{TR_ALL_OUT}</th>
					<th>{TR_ALL}</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>{TR_ALL}</td>
					<td>{WEB_IN_ALL}</td>
					<td>{WEB_OUT_ALL}</td>
					<td>{SMTP_IN_ALL}</td>
					<td>{SMTP_OUT_ALL}</td>
					<td>{POP_IN_ALL}</td>
					<td>{POP_OUT_ALL}</td>
					<td>{OTHER_IN_ALL}</td>
					<td>{OTHER_OUT_ALL}</td>
					<td>{ALL_IN_ALL}</td>
					<td>{ALL_OUT_ALL}</td>
					<td>{ALL_ALL}</td>
				</tr>
			</tfoot>
			<tbody>
				<!-- BDP: day_list -->
				<tr>
					<td><a href="server_statistic_day.php?year={YEAR}&amp;month={MONTH}&amp;day={DAY}" class="link">{DAY}</a></td>
					<td>{WEB_IN}</td>
					<td>{WEB_OUT}</td>
					<td>{SMTP_IN}</td>
					<td>{SMTP_OUT}</td>
					<td>{POP_IN}</td>
					<td>{POP_OUT}</td>
					<td>{OTHER_IN}</td>
					<td>{OTHER_OUT}</td>
					<td>{ALL_IN}</td>
					<td>{ALL_OUT}</td>
					<td>{ALL}</td>
				</tr>
				<!-- EDP: day_list -->
			</tbody>
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
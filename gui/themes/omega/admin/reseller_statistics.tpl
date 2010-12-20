<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_RESELLER_STATISTICS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_RESELLER_STATISTICS_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
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
			<h1 class="statistics">{TR_MENU_STATISTICS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="server_statistic.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_RESELLER_STATISTICS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="user"><span>{TR_RESELLER_STATISTICS}</span></h2>
		<form action="reseller_statistics.php?psi={POST_PREV_PSI}" method="post" id="admin_reseller_statistics">
			<p>
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
				<input type="hidden" name="uaction" value="show" />
				<input type="submit" name="Submit" value="  {TR_SHOW}  " />
			</p>
		</form>
		<!-- BDP: traffic_table -->
		<table>
			<thead>
				<tr>
					<th>{TR_RESELLER_NAME}</th>
					<th>{TR_TRAFF}</th>
					<th>{TR_DISK}</th>
					<th>{TR_DOMAIN}</th>
					<th>{TR_SUBDOMAIN}</th>
					<th>{TR_ALIAS}</th>
					<th>{TR_MAIL}</th>
					<th>{TR_FTP}</th>
					<th>{TR_SQL_DB}</th>
					<th>{TR_SQL_USER}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: reseller_entry -->
				<tr>
					<td><a href="reseller_user_statistics.php?rid={RESELLER_ID}&amp;name={RESELLER_NAME}&amp;month={MONTH}&amp;year={YEAR}" title="{RESELLER_NAME}" class="icon i_domain">{RESELLER_NAME}</a></td>
					<td><div class="graph"><span style="width: {TRAFF_PERCENT}%">&nbsp;</span><strong>{TRAFF_SHOW_PERCENT}&nbsp;%</strong></div>{TRAFF_MSG}</td>
					<td><div class="graph"><span style="width: {DISK_PERCENT}%">&nbsp;</span><strong>{DISK_SHOW_PERCENT}&nbsp;%</strong></div>{DISK_MSG}</td>
					<td>{DMN_MSG}</td>
					<td>{SUB_MSG}</td>
					<td>{ALS_MSG}</td>
					<td>{MAIL_MSG}</td>
					<td>{FTP_MSG}</td>
					<td>{SQL_DB_MSG}</td>
					<td>{SQL_USER_MSG}</td>
				</tr>
				<!-- EDP: reseller_entry -->
			</tbody>
		</table>
		<div class="paginator">
			<!-- BDP: scroll_next_gray -->
			<span class="icon i_next_gray">&nbsp;</span>
			<!-- EDP: scroll_next_gray -->
			<!-- BDP: scroll_next -->
			<a href="reseller_statistics.php?psi={NEXT_PSI}&amp;month={MONTH}&amp;year={YEAR}" title="next" class="icon i_next">next</a>
			<!-- EDP: scroll_next -->
			<!-- BDP: scroll_prev_gray -->
			<span class="icon i_prev_gray">&nbsp;</span>
			<!-- EDP: scroll_prev_gray -->
			<!-- BDP: scroll_prev -->
			<a href="reseller_statistics.php?psi={PREV_PSI}&amp;month={MONTH}&amp;year={YEAR" title="previous" class="icon i_prev">previous</a>
			<!-- EDP: scroll_prev -->
		</div>
		<!-- EDP: traffic_table -->
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
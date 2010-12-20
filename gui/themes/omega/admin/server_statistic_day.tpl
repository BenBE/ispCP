<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_SERVER_DAY_STATS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_SERVER_DAY_STATS_PAGE_TITLE}' />
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
			<h1 class="statistics">{TR_SERVER_DAY_STATISTICS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="server_statistic.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_SERVER_DAY_STATISTICS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="general"><span>{TR_SERVER_DAY_STATISTICS}</span></h2>
		<p>{TR_YEAR} {YEAR}&nbsp;&nbsp;&nbsp;&nbsp; {TR_MONTH} {MONTH}&nbsp;&nbsp;&nbsp;{TR_DAY} {DAY}</p>
		<table>
			<thead>
				<tr>
					<th>{TR_HOUR}</th>
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
				<!-- BDP: hour_list -->
				<tr>
					<td>{HOUR}</td>
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
				<!-- EDP: hour_list -->
			</tbody>
		</table>
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
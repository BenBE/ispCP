<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_DOMAIN_STATISTICS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_DOMAIN_STATISTICS_PAGE_TITLE}' />
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
			<li><a href="server_statistic.php">{TR_MENU_STATISTICS}</a></li>
			<li><a href="reseller_statistic.php">{TR_RESELLER_STATISTICS}</a></li>
			<li><a href="reseller_user_statistics.php?rid={RID}&amp;name={NAME}&amp;month={MONTH}&amp;year={YEAR}">{TR_RESELLER_USER_STATISTICS}</a></li>
			<li><a>{TR_DOMAIN_STATISTICS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="stats"><span>{TR_DOMAIN_STATISTICS}</span></h2>
		<form action="domain_statistics.php" method="post" id="admin_domain_statistics">
			<fieldset>
				<label for="month">{TR_MONTH}</label>
				<select name="month" id="month">
					<!-- BDP: month_list -->
					<option {OPTION_SELECTED}>{MONTH_VALUE}</option>
					<!-- EDP: month_list -->
				</select>
            	<label for="month">{TR_YEAR}</label>
				<select name="year" id="year">
					<!-- BDP: year_list -->
					<option {OPTION_SELECTED}>{YEAR_VALUE}</option>
					<!-- EDP: year_list -->
				</select>
				<input type="hidden" name="uaction" value="show_traff" />
				<input type="submit" name="Submit"  value="{TR_SHOW}" />
			</fieldset>
		</form>
		<table>
			<thead>
				<tr>
					<th>{TR_DAY}</th>
					<th>{TR_WEB_TRAFFIC}</th>
					<th>{TR_FTP_TRAFFIC}</th>
					<th>{TR_SMTP_TRAFFIC}</th>
					<th>{TR_POP3_TRAFFIC}</th>
					<th>{TR_ALL_TRAFFIC}</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td>{TR_ALL}</td>
					<td>{ALL_WEB_TRAFFIC}</td>
					<td>{ALL_FTP_TRAFFIC}</td>
					<td>{ALL_SMTP_TRAFFIC}</td>
					<td>{ALL_POP3_TRAFFIC}</td>
					<td>{ALL_ALL_TRAFFIC}</td>
				</tr>
			</tfoot>
			<tbody>
				<!-- BDP: traffic_table_item -->
				<tr>
					<td>{DATE}</td>
					<td>{WEB_TRAFFIC}</td>
					<td>{FTP_TRAFFIC}</td>
					<td>{SMTP_TRAFFIC}</td>
					<td>{POP3_TRAFFIC}</td>
					<td>{ALL_TRAFFIC}</td>
				</tr>
				<!-- EDP: traffic_table_item -->
			</tbody>
		</table>
	</div>
<!-- INCLUDE "footer.tpl" -->
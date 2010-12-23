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
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="manage_users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_DELETE_DOMAIN}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="domains"><span>{TR_DELETE_DOMAIN} - {DOMAIN_NAME}</span></h2>
		<fieldset>
		<legend>{TR_DOMAIN_SUMMARY}</legend>
			<!-- BDP: mail_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_EMAILS}</th>
				</tr>
				<!-- BDP: mail_item -->
				<tr>
					<td style="width: 350px;">{MAIL_ADDR}</td>
					<td>{MAIL_TYPE}</td>
				</tr>
				<!-- EDP: mail_item -->
			</table>
			<!-- EDP: mail_list -->
			<!-- BDP: ftp_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_FTPS}</th>
				</tr>
				<!-- BDP: ftp_item -->
				<tr>
					<td style="width: 350px;">{FTP_USER}</td>
					<td>{FTP_HOME}</td>
				</tr>
				<!-- EDP: ftp_item -->
			</table>
			<!-- EDP: ftp_list -->
			<!-- BDP: als_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_ALIASES}</th>
				</tr>
				<!-- BDP: als_item -->
				<tr>
					<td style="width: 350px;">{ALS_NAME}</td>
					<td>{ALS_MNT}</td>
				</tr>
				<!-- EDP: als_item -->
			</table>
			<!-- EDP: als_list -->
			<!-- BDP: sub_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_SUBS}</th>
				</tr>
				<!-- BDP: sub_item -->
				<tr>
					<td style="width: 350px;">{SUB_NAME}</td>
					<td>{SUB_MNT}</td>
				</tr>
				<!-- EDP: sub_item -->
			</table>
			<!-- EDP: sub_list -->
			<!-- BDP: db_list -->
			<table>
				<tr>
					<th colspan="2">{TR_DOMAIN_DBS}</th>
				</tr>
				<!-- BDP: db_item -->
				<tr>
					<td style="width: 350px;">{DB_NAME}</td>
					<td>{DB_USERS}</td>
				</tr>
				<!-- EDP: db_item -->
			</table>
			<!-- EDP: db_list -->
			<form action="user_delete.php" method="post" id="admin_delete_domain">
				<div class="buttons">
					<input type="hidden" name="domain_id" value="{DOMAIN_ID}" />
					<div class="notice">{TR_REALLY_WANT_TO_DELETE_DOMAIN}</div><br />
					<input type="checkbox" name="delete" id="delete" value="1" /> <label for="delete">{TR_YES_DELETE_DOMAIN}</label><br />
					<br />
					<input type="submit" name="Submit" value="{TR_BUTTON_DELETE}" />
				</div>
			</form>
		</fieldset>
	</div>
<!-- INCLUDE "footer.tpl" -->
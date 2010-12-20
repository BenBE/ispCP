<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_ADMIN_MANAGE_USERS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_ADMIN_MANAGE_USERS_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.tablesorter.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.tablesorter.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Target - begin
			$('a.i_goto').attr('rel', 'external').attr('target', '_blank');
			// Target - end

			// TableSorter - begin
			$('.tablesorter').tablesorter({cssHeader: 'tablesorter'});
			// TableSorter - end
		});

		function action_status(url, dmn_name) {
			if (!confirm(sprintf("{TR_MESSAGE_CHANGE_STATUS}", dmn_name)))
				return false;
				location = url;
		}
		function action_delete(url, dmn_name) {
			if (!confirm(sprintf("{TR_MESSAGE_DELETE}", dmn_name)))
				return false;
				location = url;
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
			<h1 class="manage_users">{TR_MENU_MANAGE_USERS}</h1>
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
		<h2 class="users"><span>{TR_ADMINISTRATORS}</span></h2>
		<!-- BDP: admin_message -->
		<div class="{MSG_TYPE}">{ADMIN_MESSAGE}</div>
		<!-- EDP: admin_message -->
		<!-- BDP: props_list -->
		<!-- BDP: admin_list -->
		<table class="tablesorter">
			<thead>
				<tr>
					<th style="width:50px">&nbsp;</th>
					<th>{TR_ADMIN_USERNAME}</th>
					<th style="width:100px">{TR_CREATED_ON}</th>
					<th style="width:200px">{TR_ADMIN_CREATED_BY}</th>
					<th style="width:200px">{TR_ADMIN_OPTIONS}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: admin_item -->
				<tr>
					<td>&nbsp;</td>
					<td>{ADMIN_USERNAME}</td>
					<td>{ADMIN_CREATED_ON}</td>
					<td>{ADMIN_CREATED_BY}</td>
					<td>
						<a href="{URL_EDIT_ADMIN}" title="{TR_EDIT}" class="icon i_edit"></a>
						<!-- BDP: admin_delete_show -->
						<!-- EDP: admin_delete_show -->
						<!-- BDP: admin_delete_link -->
						<a href="#" onclick="action_delete('{URL_DELETE_ADMIN}', '{ADMIN_USERNAME}')" title="{TR_DELETE}" class="icon i_delete"></a>
						<!-- EDP: admin_delete_link -->
					</td>
				</tr>
				<!-- EDP: admin_item -->
			</tbody>
		</table>
		<!-- EDP: admin_list -->
		<!-- EDP: props_list -->
		<h2 class="users"><span>{TR_RESELLERS}</span></h2>
		<!-- BDP: rsl_message -->
		<div class="warning">{RSL_MESSAGE}</div>
		<!-- EDP: rsl_message -->
		<!-- BDP: rsl_list -->
		<table class="tablesorter">
			<thead>
				<tr>
					<th style="width:50px">&nbsp;</th>
					<th>{TR_RSL_USERNAME}</th>
					<th style="width:100px">{TR_CREATED_ON}</th>
					<th style="width:200px">{TR_RSL_CREATED_BY}</th>
					<th style="width:200px">{TR_RSL_OPTIONS}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: rsl_item -->
				<tr>
					<td>&nbsp;</td>
					<td>{RSL_USERNAME}</td>
					<td>{RESELLER_CREATED_ON}</td>
					<td>{RSL_CREATED_BY}</td>
					<td>
						<a href="{URL_CHANGE_INTERFACE}" title="{TR_CHANGE_USER_INTERFACE}" class="icon i_details"></a>
						<a href="{URL_EDIT_RSL}" title="{TR_EDIT}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('{URL_DELETE_RSL}', '{RSL_USERNAME}')" title="{TR_DELETE}" class="icon i_delete"></a>
					</td>
				</tr>
				<!-- EDP: rsl_item -->
			</tbody>
		</table>
		<!-- EDP: rsl_list -->
		<h2 class="users"><span>{TR_USERS}</span></h2>
		<form action="manage_users.php" method="post" id="admin_manage_users">
			<p>
				<a href="#" onclick="return sbmt_details(document.forms[0],'{SHOW_DETAILS}');" title="{TR_VIEW_DETAILS}" class="icon i_show_alias">{TR_VIEW_DETAILS}</a>
				<input type="text" name="search_for" id="search_for" value="{SEARCH_FOR}" />
				<select name="search_common">
					<option value="domain_name" {M_DOMAIN_NAME_SELECTED}>{M_DOMAIN_NAME}</option>
					<option value="customer_id" {M_CUSTOMER_ID_SELECTED}>{M_CUSTOMER_ID}</option>
					<option value="lname" {M_LAST_NAME_SELECTED}>{M_LAST_NAME}</option>
					<option value="firm" {M_COMPANY_SELECTED}>{M_COMPANY}</option>
					<option value="city" {M_CITY_SELECTED}>{M_CITY}</option>
					<option value="country" {M_COUNTRY_SELECTED}>{M_COUNTRY}</option>
				</select>
				<select name="search_status">
					<option value="all" {M_ALL_SELECTED}>{M_ALL}</option>
					<option value="ok" {M_OK_SELECTED}>{M_OK}</option>
					<option value="disabled" {M_SUSPENDED_SELECTED}>{M_SUSPENDED}</option>
				</select>
				<input type="hidden" name="details" value="" />
				<input type="hidden" name="uaction" value="go_search" />
				<input type="submit" name="Submit" value="{TR_SEARCH}" />
			</p>
		</form>
		<!-- BDP: usr_message -->
		<div class="warning">{USR_MESSAGE}</div>
		<!-- EDP: usr_message -->
		<!-- BDP: usr_list -->
		<table class="tablesorter">
			<thead>
				<tr>
					<th style="width:50px">{TR_USER_STATUS}</th>
					<th>{TR_USR_USERNAME}</th>
					<th style="width:100px">{TR_CREATED_ON}</th>
					<th style="width:200px">{TR_USR_CREATED_BY}</th>
					<th style="width:200px">{TR_USR_OPTIONS}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: usr_item -->
				<tr>
					<td><a href="#" onclick="action_status('{URL_CHANGE_STATUS}', '{USR_USERNAME}')" title="{STATUS_ICON}" class="icon i_{STATUS_ICON}"></a></td>
					<td><a href="http://www.{USR_USERNAME}/" title="{USR_USERNAME}" class="icon i_goto">{USR_USERNAME}</a></td>
					<td>{USER_CREATED_ON}</td>
					<td>{USR_CREATED_BY}</td>
					<td>
						<a href="domain_details.php?domain_id={DOMAIN_ID}" title="{TR_DETAILS}" class="icon i_identity"></a>
						<a href="{URL_CHANGE_INTERFACE}" title="{TR_CHANGE_USER_INTERFACE}" class="icon i_details"></a>
						<a href="{URL_EDIT_USR}" title="{TR_EDIT_USR}" class="icon i_edit"></a>
						<!-- BDP: edit_option -->
						<a href="domain_edit.php?edit_id={DOMAIN_ID}" title="{TR_EDIT_DOMAIN}" class="icon i_domain"></a>
						<!-- EDP: edit_option -->
						<!-- BDP: usr_delete_show -->
						<!-- EDP: usr_delete_show -->
						<!-- BDP: usr_delete_link -->
						<a href="#" onclick="action_delete('{URL_DELETE_USR}', '{USR_USERNAME}')" title="{TR_DELETE}" class="icon i_delete"></a>
						<!-- EDP: usr_delete_link -->
					</td>
				</tr>
				<!-- BDP: user_details -->
				<tr>
					<td style="width:50px">&nbsp;</td>
					<td colspan="4"><a href="http://www.{ALIAS_DOMAIN}/" title="{ALIAS_DOMAIN}" class="icon i_goto">{ALIAS_DOMAIN}</a></td>
				</tr>
				<!-- EDP: user_details -->
				<!-- EDP: usr_item -->
			</tbody>
		</table>
		<!-- EDP: usr_list -->
		<div class="paginator">
			<!-- BDP: scroll_next_gray -->
			<span class="icon i_next_gray">&nbsp;</span>
			<!-- EDP: scroll_next_gray -->
			<!-- BDP: scroll_next -->
			<a href="manage_users.php?psi={NEXT_PSI}" title="next" class="icon i_next">next</a>
			<!-- EDP: scroll_next -->
			<!-- BDP: scroll_prev_gray -->
			<span class="icon i_prev_gray">&nbsp;</span>
			<!-- EDP: scroll_prev_gray -->
			<!-- BDP: scroll_prev -->
			<a href="manage_users.php?psi={PREV_PSI}" title="previous" class="icon i_prev">previous</a>
			<!-- EDP: scroll_prev -->
		</div>
	</div>
<!-- INCLUDE "footer.tpl" -->
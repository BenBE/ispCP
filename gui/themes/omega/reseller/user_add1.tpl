<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_CHANGE_PERSONAL_DATA_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_CHANGE_PERSONAL_DATA_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
	<link href="{THEME_COLOR_PATH}/css/jquery.ui.tooltip.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ispcpTooltips.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ui.core.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.ui.datepicker.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function(){
			// Tooltips - begin
			$('#dmn_help').ispCPtooltips({msg:"{TR_DMN_HELP}"});
			// Tooltips - end

			// Datepicker - begin		
			$('#dmn_exp_never').change(function() {
				if ($(this).is(':checked')) {
					$('#dmn_exp_date').attr('disabled', 'disabled');
				} else {
					$('#dmn_exp_date').removeAttr('disabled');
				}
			});
			// Datepicker - end

			// jQuery UI Datepicker
			$('#dmn_exp_date').datepicker({
				dateFormat: '{VL_DATE_FORMAT}',
				dayNamesMin: ['{TR_SU}', '{TR_MO}', '{TR_TU}', '{TR_WE}', '{TR_TH}', '{TR_FR}', '{TR_SA}'],
				monthNames: ['{TR_JANUARY}', '{TR_FEBRUARY}', '{TR_MARCH}', '{TR_APRIL}', '{TR_MAY}', '{TR_JUNE}', '{TR_JULY}', '{TR_AUGUST}', '{TR_SEPTEMBER}', '{TR_OCTOBER}', '{TR_NOVEMBER}', '{TR_DECEMBER}'],
				isRTL: false,
				showOtherMonths: true,
				defaultDate: '+1y',
				minDate: new Date()
			});
		});
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
			<!-- <li><a class="help" href="#">Help</a></li> -->
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="users.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a>{TR_ADD_USER}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<!-- BDP: add_form -->
		<h2 class="general"><span>{TR_ADD_USER}</span></h2>
		<form action="user_add1.php" method="post" id="reseller_user_add1">
			<fieldset>
				<legend>{TR_CORE_DATA}</legend>
				<table>
					<tr>
						<td>{TR_DOMAIN_NAME} <span id="dmn_help" class="icon i_help">&nbsp;</span></td>
						<td><input type="text" name="dmn_name" id="dmn_name" value="{DMN_NAME_VALUE}"/></td>
					</tr>
					<tr>
						<td>{TR_DOMAIN_EXPIRE}</td>
						<td>
							<input type="text" name="dmn_expire_date" id="dmn_exp_date" value="" disabled="disabled" />
							&nbsp;{TR_EXPIRE_CHECKBOX} <input type="checkbox" name="dmn_expire_never" id="dmn_exp_never" checked="checked" />
						</td>
					</tr>
					<!-- BDP: add_user -->
					<tr>
						<td>{TR_CHOOSE_HOSTING_PLAN}</td>
						<td>
							<select id="dmn_tpl" name="dmn_tpl">
								<!-- BDP: hp_entry -->
								<option value="{CHN}"{CH{CHN}}>{HP_NAME}</option>
								<!-- EDP: hp_entry -->
							</select>
						</td>
					</tr>
					<!-- BDP: personalize -->
					<tr>
						<td>{TR_PERSONALIZE_TEMPLATE}</td>
						<td>
							<input type="radio" name="chtpl" id="chtpl_yes" value="_yes_" {CHTPL1_VAL} /><label for="chtpl_yes">{TR_YES}</label>
							<input type="radio" name="chtpl" id="chtpl_no" value="_no_" {CHTPL2_VAL} /><label for="chtpl_no">{TR_NO}</label>
						</td>
					</tr>
					<!-- EDP: personalize -->
					<!-- EDP: add_user -->
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="user_add_nxt" />
				<input type="submit" name="Submit"  value="{TR_NEXT_STEP}" />
			</div>
		</form>
		<!-- EDP: add_form -->
	</div>
	<div class="footer">
		ispCP Omega {VERSION}<br />build: {BUILDDATE}<br />Codename: {CODENAME}
	</div>
</body>
</html>
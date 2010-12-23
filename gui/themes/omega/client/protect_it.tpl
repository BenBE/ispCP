<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_HTACCESS}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_HTACCESS}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/jquery.js"></script>
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function() {
			$('#protected_areas_delete').click(function() {
				document.location.href = 'protected_areas_delete.php?id={CDIR}';
			});
			$('#protected_user_manage').click(function() {
				document.location.href = 'protected_user_manage.php';
			});
			$('#protected_areas').click(function() {
				document.location.href = 'protected_areas.php';
			});
		});

		function action_delete(url, subject) {
			return confirm(sprintf("{TR_MESSAGE_DELETE}", subject));
		}

		function begin_js() {
			document.forms[0].elements["users[]"].disabled = {USER_FORM_ELEMENS};
			document.forms[0].elements["groups[]"].disabled = {GROUP_FORM_ELEMENS};
		}

		function changeType(wath) {
			document.forms[0].elements["users[]"].disabled = wath != "user";
			document.forms[0].elements["groups[]"].disabled = wath == "user";
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
			<h1 class="webtools">{TR_MENU_WEBTOOLS}</h1>
		</div>
		<ul class="location-menu">
			<!-- BDP: logged_from -->
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{YOU_ARE_LOGGED_AS}</a></li>
			<!-- EDP: logged_from -->
			<li><a href="../index.php?logout" class="logout">{TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="webtools.php">{TR_MENU_OVERVIEW}</a></li>
			<li><a href="protected_areas.php">{TR_HTACCESS}</a></li>
			<li><a>{TR_PROTECT_DIR}</a></li>
		</ul>
	</div>
	<div class="left_menu">{MENU}</div>
	<div class="main">
		<!-- BDP: page_message -->
		<div class="{MSG_TYPE}">{MESSAGE}</div>
		<!-- EDP: page_message -->
		<h2 class="htaccess"><span>{TR_PROTECT_DIR}</span></h2>
		<form action="protected_areas_add.php" method="post" id="client_protected_areas_add">
			<table>
				<tr>
					<td>{TR_PATH}</td>
					<td>
						<input type="text" name="other_dir"  id="other_dir"  value="{PATH}" />
						<a href="#" onclick="showFileTree();" class="icon i_bc_folder">{CHOOSE_DIR}</a>
					</td>
				</tr>
				<tr>
					<td>{TR_AREA_NAME}</td>
					<td><input type="text" name="paname" id="paname" value="{AREA_NAME}" /></td>
				</tr>
			</table>
			<div>&nbsp;</div>
			<table>
				<thead>
					<tr>
						<th>{TR_USER}</th>
						<th>{TR_GROUPS}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="radio" name="ptype" id="ptype_1" value="user" onfocus="changeType('user');" {USER_CHECKED} />&nbsp;{TR_USER_AUTH}</td>
						<td><input type="radio" name="ptype" id="ptype_2" value="group" onfocus="changeType('group');" {GROUP_CHECKED} />&nbsp;{TR_GROUP_AUTH}</td>
					</tr>
					<tr>
						<td>
							<select name="users[]" multiple="multiple" size="5">
								 <!-- BDP: user_item -->
							 	<option value="{USER_VALUE}" {USER_SELECTED}>{USER_LABEL}</option>
								 <!-- EDP: user_item -->
							</select>
						</td>
						<td>
							<select name="groups[]" multiple="multiple" size="5">
								<!-- BDP: group_item -->
								<option value="{GROUP_VALUE}" {GROUP_SELECTED}>{GROUP_LABEL}</option>
								<!-- EDP: group_item -->
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="buttons">
				<input type="hidden" name="cdir" value="{CDIR}" />
				<input type="hidden" name="sub" value="YES" />
				<input type="hidden" name="use_other_dir" />
				<input type="hidden" name="uaction" value="" />
				<input type="button" name="Button" value="{TR_PROTECT_IT}" onclick="return sbmt(document.forms[0],'protect_it');" />
				<!-- BDP: unprotect_it -->
				<input type="button" name="protected_areas_delete" id="protected_areas_delete" value="{TR_UNPROTECT_IT}" />
				<!-- EDP: unprotect_it -->
				<input type="button" name="protected_user_manage" id="protected_user_manage" value="{TR_MANAGE_USRES}" />
				<input type="button" name="protected_areas" id="protected_areas" value="{TR_CANCEL}" />
			</div>
		</form>
	</div>
<!-- INCLUDE "footer.tpl" -->
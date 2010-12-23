<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_CLIENT_WEBTOOLS_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_CLIENT_WEBTOOLS_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.ftp.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="{THEME_SCRIPT_PATH}/ispcp.js"></script>
	<!--[if lt IE 7.]>
		<script defer type="text/javascript" src="{THEME_SCRIPT_PATH}/pngfix.js"></script>
	<![endif]-->
	<script type="text/javascript">
	/* <![CDATA[ */
		function CopyText(inputname) {
			window.opener.document.forms[0].other_dir.value = document.forms[0].elements[inputname].value;
			window.opener.document.forms[0].use_other_dir.checked = true;
			self.close();
		}
	/* ]]> */
	</script>
</head>
<body>
	<!-- BDP: page_message -->
	<div class="{MSG_TYPE}">{MESSAGE}</div>
	<!-- EDP: page_message -->
	<h2><span>{TR_DIRECTORY_TREE}</span></h2>
	<form action="">
		<table style="empty-cells:show">
			<thead>
				<tr>
					<th>{TR_DIRS}</th>
					<th>{TR__ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: dir_item -->
				<tr>
					<!-- BDP: list_item -->
					<td><a href="{LINK}" class="icon i_bc_{ICON}">{DIR_NAME}</a></td>
					<td>
					<!-- BDP: action_link -->
					<a href="javascript:CopyText('{CHOOSE_IT}');" class="icon i_choose">{CHOOSE}</a><input type="hidden" name="{CHOOSE_IT}" value="{CHOOSE_IT}" />
					<!-- EDP: action_link -->
					</td>
					<!-- EDP: list_item -->
				</tr>
				<!-- EDP: dir_item -->
			</tbody>
		</table>
	</form>
</body>
</html>
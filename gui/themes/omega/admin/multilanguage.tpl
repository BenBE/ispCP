{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function action_delete(url, language) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", language)))
				return false;
				location = url;
		}
		// Overrides exportation url to enable/disable gzip compression
		//
		// author Laurent Declercq <laurent.declercq@ispcp.net>
		// Since 1.0.6
		function override_export_url(ob) {
			regexp = new RegExp('[a-z_]*([0-9]+)');
			link = document.getElementById('url_export' + regexp.exec(ob.id)[1]);
			if(ob.checked) {
				link.href = link.href + '&compress=1';
			} else {
				link.href = link.href. substring(0, link.href.indexOf('&compress'));
			}
		}
	/* ]]> */
	</script>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="settings">{$TR_MENU_SETTINGS}</h1>
		</div>
		<ul class="location-menu">
			
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="settings.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_MULTILANGUAGE}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="multilanguage"><span>{$TR_MULTILANGUAGE}</span></h2>
		<form action="multilanguage.php" method="post" id="admin_multilanguage" enctype="multipart/form-data">
			<fieldset>
				<legend>{$TR_INSTALLED_LANGUAGES}</legend>
				<table>
					<tr>
						<th>{$TR_LANGUAGE}</th>
						<th>{$TR_MESSAGES}</th>
						<th>{$TR_LANG_REV}</th>
						<th>{$TR_ACTION}</th>
					</tr>
					{section name=i loop=$LANG_CLASS}
					<tr>
						<td><span class="icon i_locale">{$LANGUAGE[i]}</span></td>
						<td>{$MESSAGES[i]}</td>
						<td>{$LANGUAGE_REVISION[i]}</td>
						<td>
							<a href="{$URL_EXPORT[i]}" id="url_export{$INDEX[i]}" title="{$TR_EXPORT}" class="icon i_details"></a>
							<input type="checkbox" name="gz_export{$INDEX}" id="gz_export{$INDEX[i]}" onclick="override_export_url(this)" /> <label for="gz_export{$INDEX[i]}">{$TR_GZIPPED[i]}</label>
							{if isset($LANGUAGE[i])}
								{if $TR_UNINSTALL[i] == false}
									N/A
								{else}
									<a href="#" onclick="action_delete('{$URL_DELETE[i]}', '{$LANGUAGE[i]}')" title="{$TR_UNINSTALL[i]}" class="icon i_delete"></a>
								{/if}
							{/if}
						</td>
					</tr>
					{/section}
				</table>
			</fieldset>
			<fieldset>
				<legend>{$TR_INSTALL_NEW_LANGUAGE}</legend>
				<table>
					<tr>
						<td>{$TR_LANGUAGE_FILE}</td>
						<td><input type="file" name="lang_file" /></td>
					</tr>
				</table>
			</fieldset>
			<div class="buttons">
				<input type="hidden" name="uaction" value="upload_language" />
				<input type="submit" name="Submit" value="{$TR_INSTALL}" />
				
			</div>
		</form>
	</div>
	<div class="footer">
			ispCP Omega {$VERSION}<br />build: {$BUILDDATE}<br />Codename: {$CODENAME}
	</div>
</body>
</html>
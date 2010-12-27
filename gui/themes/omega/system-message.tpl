<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de" lang="de">
<head>
	<title>{TR_PAGE_TITLE}</title>
	<meta http-equiv='Content-Script-Type' content='text/javascript' />
	<meta http-equiv='Content-Style-Type' content='text/css' />
	<meta http-equiv='Content-Type' content='text/html; charset={THEME_CHARSET}' />
	<meta name='copyright' content='ispCP Omega' />
	<meta name='owner' content='ispCP Omega' />
	<meta name='publisher' content='ispCP Omega' />
	<meta name='robots' content='nofollow, noindex' />
	<meta name='title' content='{TR_PAGE_TITLE}' />
	<link href="{THEME_COLOR_PATH}/css/ispcp.login.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="main">
		<div class="mainbox" id="mainbox">
			<form action="index.php" method="post">
				<fieldset>
					<label for="uname">{TR_USERNAME}:</label><input type="text" name="uname" id="uname" class="textfield" maxlength="255" />
					<label for="upass">{TR_PASSWORD}:</label><input type="password" name="upass" id="upass" class="textfield" maxlength="255" />
					<input type="submit" name="Submit" class="button" value="{TR_LOGIN}" />
				</fieldset>
			</form>
			<!-- BDP: page_message -->
			<div class="{MSG_TYPE}">{MESSAGE}</div>
			<!-- EDP: page_message -->
		</div>
		<div class="toolbox">
			<a href="lostpassword.php" class="image_link">{TR_LOSTPW}</a>
			<div>
				<a href="{TR_PMA_SSL_LINK}" class="image_link">
					<img src="{THEME_COLOR_PATH}/images/login/phpmyadmin.png" alt="phpMyAdmin" /><br />
					<span class='img_text'>phpMyAdmin</span>
				</a>
				<a href="{TR_FTP_SSL_LINK}" class="image_link">
					<img src="{THEME_COLOR_PATH}/images/login/filemanager.png" alt="Filemanager" /><br />
					<span class='img_text'>Filemanager</span>
				</a>
				<a href="{TR_WEBMAIL_SSL_LINK}" class="image_link">
					<img src="{THEME_COLOR_PATH}/images/login/webmail.png" alt="Webmail" /><br />
					<span class='img_text'>Webmail</span>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
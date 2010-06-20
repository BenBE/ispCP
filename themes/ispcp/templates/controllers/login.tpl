<body onload="document.frm.uname.focus()" class="body">
	<div id="outer">
	  <div id="middle">
		<div id="inner">    
			<form name="login_frm" action="index.php" method="post">
				<!-- BDP: page_message -->
					<div class="warning">
						{MESSAGE}
					</div>
				<!-- EDP: page_message -->
				<fieldset>
					<label>{TR_USERNAME}:<input type="text" name="uname" id="uname" value="" maxlength="255" tabindex="1"></label>
					<label>{TR_PASSWORD}:<input type="password" name="upass" id="upass" value="" maxlength="255" tabindex="2"></label>
					<label>{TR_REMEMBER_ME}:<input type="checkbox" name="remeberme" /></label>
				
					<div class="buttons">
						<input type="submit" name="Submit" value="{TR_LOGIN}" tabindex="3">	
					</div>
					
					<div>
						<a class="icon i_lock" href="{TR_SSL_LINK}" title="{TR_SSL_DESCRIPTION}">{TR_SSL_DESCRIPTION}</a>
					</div>
				</fieldset>
			</form>
			<div class="toolbox">
				<a href="lostpassword.php">{TR_LOSTPW}</a>
				<div>
					<a href="{LINK_PMA}" class="pma">{TR_PHPMYADMIN}</a>
					<a href="{LINK_FILEMANAGER}" class="filemanager">{TR_FILEMANAGER}</a>
					<a href="{LINK_WEBMAIL}" class="webmail">{TR_WEBMAIL}</a>
				</div>
			</div>		
			</div>
		</div>
	</div>
</body>
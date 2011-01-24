<!-- INCLUDE "header.tpl" -->
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
<!-- INCLUDE "footer.tpl" -->
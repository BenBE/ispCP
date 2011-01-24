<!-- INCLUDE "header.tpl" -->
<body>
	<div class="main">
		<div class="mainbox" id="mainbox">
			<form action="lostpassword.php" method="post">
				<fieldset style="text-align: center;">
					<label for="uname">{TR_USERNAME}:</label><br />
					<input type="text" name="uname" id="uname" class="textfield" maxlength="255" /><br />
					<label for="capcode">{TR_CAPCODE}:</label><br />
					<input type="text" name="capcode" id="capcode" class="textfield" maxlength="255" /><br />
					<br />
					<input type="submit" name="Submit" value="{TR_SEND}" />
				</fieldset>
			</form>
		</div>
		<div class="toolbox">
			<div>{TR_IMGCAPCODE}</div>
			<p>{TR_IMGCAPCODE_DESCRIPTION}</p>
<!-- INCLUDE "footer.tpl" -->
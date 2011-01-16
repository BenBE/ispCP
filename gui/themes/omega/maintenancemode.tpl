<!-- INCLUDE "header.tpl" -->
<body>
	<div class="main">
		<div class="mainbox" id="mainbox">
			<form action="index.php" method="post">
				<fieldset style="text-align: center;">
					<div class="info">{TR_MESSAGE}</div>
					<input type="hidden" name="admin" value="1" />
					<input type="submit" name="Submit" value="{TR_ADMINLOGIN}" />
				</fieldset>
			</form>
			<!-- BDP: page_message -->
			<div class="{MSG_TYPE}">{MESSAGE}</div>
			<!-- EDP: page_message -->
		</div>
		<div class="toolbox">
			<a href="lostpassword.php" class="image_link">{TR_LOSTPW}</a>
<!-- INCLUDE "footer.tpl" -->
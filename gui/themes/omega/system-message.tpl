{include file='header.tpl'}
<body>
	<div class="main">
		<div class="mainbox" id="mainbox">
			<form action="index.php" method="post">
				<fieldset>
					<label for="uname">{$TR_USERNAME}:</label><input type="text" name="uname" id="uname" class="textfield" maxlength="255" />
					<label for="upass">{$TR_PASSWORD}:</label><input type="password" name="upass" id="upass" class="textfield" maxlength="255" />
					<input type="submit" name="Submit" class="button" value="{$TR_LOGIN}" />
				</fieldset>
			</form>
			{if $MESSAGE}
			<div class="{$MSG_TYPE}">{$MESSAGE}</div>
			{/if}
		</div>
		<div class="toolbox">
			<a href="lostpassword.php" class="image_link">{$TR_LOSTPW}</a>
{include file='footer.tpl'}
{include file='header.tpl'}
<body>
	<div class="main">
		<div class="mainbox" id="mainbox">
			<form action="index.php" method="post">
				<fieldset style="text-align: center;">
					<div class="info">{$TR_MESSAGE}</div>
					<input type="hidden" name="admin" value="1" />
					<input type="submit" name="Submit" value="{$TR_ADMINLOGIN}" />
				</fieldset>
			</form>
			{if $MESSAGE}
			<div class="{$MSG_TYPE}">{$MESSAGE}</div>
			{/if}
		</div>
		<div class="toolbox">
			<a href="lostpassword.php" class="image_link">{$TR_LOSTPW}</a>
{include file='footer.tpl'}
	<div class="footer">
		ispCP Omega {$VERSION}<br />
		build: {$BUILDDATE}<br />
		Codename: {$CODENAME}<br />
		{if isset($DEBUG)}
			Debug Mode: <strong style="color: red;">On</strong>
		{/if}
	</div>
	{if isset($GUI_DEBUG)}
		{$GUI_DEBUG}
	{/if}
</body>
</html>
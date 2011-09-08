{include file='header.tpl'}
<body style="background:none">
	<script type="text/javascript">
	/* <![CDATA[ */
		function CopyText(inputname) {
			window.opener.document.forms[0].other_dir.value = document.forms[0].elements[inputname].value;
			window.opener.document.forms[0].use_other_dir.checked = true;
			self.close();
		}
	/* ]]> */
	</script>
	{if isset($MESSAGE)}
	<div class="{$MSG_TYPE}">{$MESSAGE}</div>
	{/if}
	<h2><span>{$TR_DIRECTORY_TREE}</span></h2>
	<form action="">
		<table style="empty-cells:show">
			<thead>
				<tr>
					<th>{$TR_DIRS}</th>
					<th>{$TR__ACTION}</th>
				</tr>
			</thead>
			<tbody>
				{section name=i loop=$DIR_NAME}
				<tr>
					<td><a href="{$LINK[i]}" class="icon i_bc_{$ICON[i]}">{$DIR_NAME[i]}</a></td>
					<td>
					{if $ACTION_LINK[i] != 'no'}
					<a href="javascript:CopyText('{$CHOOSE_IT[i]}');" class="icon i_choose">{$CHOOSE}</a><input type="hidden" name="{$CHOOSE_IT[i]}" value="{$CHOOSE_IT[i]}" />
					{/if}
					</td>
				</tr>
				{/section}
			</tbody>
		</table>
	</form>
</body>
</html>
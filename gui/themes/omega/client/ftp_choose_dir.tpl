<!-- INCLUDE "header.tpl" -->
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		function CopyText(inputname) {
			window.opener.document.forms[0].other_dir.value = document.forms[0].elements[inputname].value;
			window.opener.document.forms[0].use_other_dir.checked = true;
			self.close();
		}
	/* ]]> */
	</script>
	<!-- BDP: page_message -->
	<div class="{MSG_TYPE}">{MESSAGE}</div>
	<!-- EDP: page_message -->
	<h2><span>{TR_DIRECTORY_TREE}</span></h2>
	<form action="">
		<table style="empty-cells:show">
			<thead>
				<tr>
					<th>{TR_DIRS}</th>
					<th>{TR__ACTION}</th>
				</tr>
			</thead>
			<tbody>
				<!-- BDP: dir_item -->
				<tr>
					<!-- BDP: list_item -->
					<td><a href="{LINK}" class="icon i_bc_{ICON}">{DIR_NAME}</a></td>
					<td>
					<!-- BDP: action_link -->
					<a href="javascript:CopyText('{CHOOSE_IT}');" class="icon i_choose">{CHOOSE}</a><input type="hidden" name="{CHOOSE_IT}" value="{CHOOSE_IT}" />
					<!-- EDP: action_link -->
					</td>
					<!-- EDP: list_item -->
				</tr>
				<!-- EDP: dir_item -->
			</tbody>
		</table>
	</form>
</body>
</html>
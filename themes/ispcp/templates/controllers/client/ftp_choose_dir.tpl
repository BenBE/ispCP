<body class="body">
	<!-- BDP: page_message -->
		<div class="warning">{MESSAGE}</div>
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
							<!-- BDP: action_link -->
								<td><a href="javascript:CopyText('{CHOOSE_IT}');" class="icon i_choose">{CHOOSE}</a><input type="hidden" name="{CHOOSE_IT}" value="{CHOOSE_IT}" /></td>
							<!-- EDP: action_link -->
						<!-- EDP: list_item -->
					</tr>
				<!-- EDP: dir_item -->
			</tbody>
		</table>
	</form>
</body>
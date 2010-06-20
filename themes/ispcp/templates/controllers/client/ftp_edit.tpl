<div class="body">
	<!-- BDP: page_message -->
	<div class="warning">{MESSAGE}</div>
	<!-- EDP: page_message -->

	<h2 class="ftp"><span>{TR_EDIT_FTP_USER}</span></h2>
	<form name="edit_ftp_acc_frm" method="post" action="ftp_edit.php">
		<table>
			<tr>
				<td><label for="ftp_account">{TR_FTP_ACCOUNT}</label></td>
				<td><input id="ftp_account" type="text" name="username" value="{FTP_ACCOUNT}"  readonly="readonly"/></td>
			</tr>
			<tr>
				<td><label for="pass">{TR_PASSWORD}</label></td>
				<td><input id="pass" type="password" name="pass" value="" /></td>
			</tr>
			<tr>
				<td><label for="pass_rep">{TR_PASSWORD_REPEAT}</label></td>
				<td><input id="pass_rep" type="password" name="pass_rep" value="" /></td>
			</tr>
			<tr>
				<td><input id="use_other_dir" type="checkbox" name="use_other_dir" {USE_OTHER_DIR_CHECKED} /><label for="use_other_dir">{TR_USE_OTHER_DIR}</label></td>
				<td><input type="text" name="other_dir" value="{OTHER_DIR}" /><a href="#" onclick="showFileTree();" class="icon i_bc_folder">{CHOOSE_DIR}</a></td>
			</tr>
		</table>

		<div class="buttons">
			<input name="Submit" type="submit" class="button" value="{TR_EDIT}" />
		</div>
		
		<input type="hidden" name="uaction" value="edit_user" />
		<input type="hidden" name="id" value="{ID}" />
	</form>
</div>

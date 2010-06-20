<div class="body">
	{include file='areas/messages.tpl'}

	<!-- BDP: ftp_message -->
	<div class="info">{FTP_MSG}</div>
	<!-- EDP: ftp_message -->

	<h2 class="ftp"><span>{TR_FTP_USERS}</span></h2>
	<table>
		<thead>
			<tr>
				<th>{TR_FTP_ACCOUNT}</th>
				<th>{TR_FTP_ACTION}</th>
			</tr>
		</thead>
		<!-- BDP: ftps_total -->
			<tfoot>
				<tr>
					<td colspan="2">{TR_TOTAL_FTP_ACCOUNTS}&nbsp;<strong>{TOTAL_FTP_ACCOUNTS}</strong></td>
				</tr>
			</tfoot>
		<!-- EDP: ftps_total -->
		<tbody>
			<!-- BDP: ftp_item -->
				<td>{FTP_ACCOUNT}</td>
				<td>
					<a href="ftp_edit.php?id={UID}" class="icon i_edit">{TR_EDIT}</a>
					<a href="#" class="icon i_delete" onclick="action_delete('ftp_delete.php?id={UID}', '{FTP_ACCOUNT}')">{TR_DELETE}</a>
				</td>
			<!-- EDP: ftp_item -->
		</tbody>
	</table>
</div>
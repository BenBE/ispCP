{$PURCHASE_HEADER}

{section name=i loop=$PACK_ID}
<table width="400">
	<tr>
		<td class="content3"><a href="package_info.php?id={$PACK_ID[i]}&amp;user_id={$USER_ID[i]}" class="linkdark"><strong>{$PACK_NAME[i]}</strong></a> {$PRICE[i]}</td>
		<td width="40" align="center" style="white-space:nowrap;" class="content3"><a href="addon.php?id={$PACK_ID[i]}&amp;user_id={$USER_ID[i]}" class="linkdark">{$PURCHASE[i]}</a></td>
	</tr>
	<tr>
		<td colspan="2" class="content"><div class="contentdiv">{$PACK_INFO[i]}</div></td>
	</tr>
</table>
<br />
{/section}

{$PURCHASE_FOOTER}

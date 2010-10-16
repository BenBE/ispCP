<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_update.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_UPDATES_TITLE}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><!-- BDP: props_list -->
	<form name="database_update" action="database_update.php" method="post" enctype="application/x-www-form-urlencoded">
	<table width="100%" cellpadding="5" cellspacing="5">
          {if $UPDATE}
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="2" class="content3"><b>{$TR_AVAILABLE_UPDATES}</b></td>
          </tr>
          {/if}
          {if $TR_UPDATE_MESSAGE}
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="2">{$TR_UPDATE_MESSAGE}</td>
          </tr>
          {/if}
          {if $UPDATE}
          <tr>
            <td width="25">&nbsp;</td>
            <td width="200" class="content2">{$TR_UPDATE}</td>
            <td class="content">{$UPDATE}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td class="content2">{$TR_INFOS}</td>
            <td class="content">{$INFOS}</td>
          </tr>
          <tr>
           <td width="25">&nbsp;</td>
	       <td class="content">&nbsp;</td>
		   <td class="content2" align="left"><input type="submit" name="submit" value="{$TR_EXECUTE_UPDATE}" /><input type="hidden" name="execute" id="execute" value="update" /></td>
          </tr>
		{/if}
	</table>
	</form>
      <br />
        <!-- EDP: props_list --></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

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
        <table width="100%" cellpadding="5" cellspacing="5">
          {if $TABLE_HEADER != 'no'}
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="2" class="content3"><b>{$TR_AVAILABLE_UPDATES}</b></td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td colspan="2">{$TR_MESSAGE}</td>
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
          {/if}
        </table>
      <br />
        <!-- EDP: props_list -->
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
				  

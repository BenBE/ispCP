<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="20"><img src="{$THEME_COLOR_PATH}/images/icons/system_vital.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_SYSTEM_INFO}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><!-- BDP: props_list -->
        <table width="100%" cellpadding="5" cellspacing="5">
          <tr>
            <td width="25">&nbsp;</td>
            <td width="200" class="content2">{$TR_KERNEL}</td>
            <td class="content2">{$KERNEL}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td width="200" class="content">{$TR_UPTIME}</td>
            <td class="content">{$UPTIME}</td>
          </tr>
          <tr>
            <td width="25">&nbsp;</td>
            <td width="200" class="content2">{$TR_LOAD}</td>
            <td class="content2">{$LOAD}</td>
          </tr>
        </table>
      <!-- EDP: props_list -->
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="20"><img src="{$THEME_COLOR_PATH}/images/icons/system_cpu.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_CPU_SYSTEM_INFO}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellpadding="5" cellspacing="5">
      <tr>
        <td width="25">&nbsp;</td>
        <td width="200" class="content2">{$TR_CPU_MODEL}</td>
        <td class="content2">{$CPU_MODEL}</td>
      </tr>
      <tr>
        <td width="25">&nbsp;</td>
        <td width="200" class="content">{$TR_CPU_COUNT}</td>
        <td class="content2">{$CPU_COUNT}</td>
      </tr>
      <tr>
        <td width="25">&nbsp;</td>
        <td width="200" class="content2">{$TR_CPU_MHZ}</td>
        <td class="content">{$CPU_MHZ}</td>
      </tr>
      <tr>
        <td width="25">&nbsp;</td>
        <td width="200" class="content">{$TR_CPU_CACHE}</td>
        <td class="content2">{$CPU_CACHE}</td>
      </tr>
      <tr>
        <td width="25">&nbsp;</td>
        <td width="200" class="content2">{$TR_CPU_BOGOMIPS}</td>
        <td class="content">{$CPU_BOGOMIPS}</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="20"><img src="{$THEME_COLOR_PATH}/images/icons/system_memory.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_MEMRY_SYSTEM_INFO}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellpadding="5" cellspacing="5">
      <tr>
        <td width="25">&nbsp;</td>
        <td class="content3"><b>{$TR_RAM}</b></td>
        <td class="content3"><b>{$TR_TOTAL}</b></td>
        <td class="content3"><b>{$TR_USED}</b></td>
        <td class="content3"><b>{$TR_FREE}</b></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="content">&nbsp;</td>
        <td class="content">{$RAM_TOTAL}</td>
        <td class="content">{$RAM_USED}</td>
        <td class="content">{$RAM_FREE}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="content3"><b>{$TR_SWAP}</b></td>
        <td class="content3"><b>{$TR_TOTAL}</b></td>
        <td class="content3"><b>{$TR_USED}</b></td>
        <td class="content3"><b>{$TR_FREE}</b></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="content">&nbsp;</td>
        <td class="content">{$SWAP_TOTAL}</td>
        <td class="content">{$SWAP_USED}</td>
        <td class="content">{$SWAP_FREE}</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">
<table width="100%" cellpadding="5" cellspacing="5">
	<tr>
		<td width="20"><img src="{$THEME_COLOR_PATH}/images/icons/system_filesystem.png" width="25" height="25" alt="" /></td>
		<td colspan="2" class="title">{$TR_FILE_SYSTEM_INFO}</td>
	</tr>
</table>
	</td>
    <td width="27" align="right">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" cellpadding="5" cellspacing="5">
      <tr>
        <td width="25" nowrap="nowrap">&nbsp;</td>
        <td class="content3" nowrap="nowrap"><b>{$TR_MOUNT}</b></td>
        <td class="content3" nowrap="nowrap"><b>{$TR_TYPE}</b></td>
        <td class="content3" nowrap="nowrap"><b>{$TR_PARTITION}</b></td>
        <td nowrap="nowrap" class="content3"><b>{$TR_PERCENT}</b></td>
        <td nowrap="nowrap" class="content3"><b>{$TR_FREE}</b></td>
        <td nowrap="nowrap" class="content3"><b>{$TR_USED}</b></td>
        <td nowrap="nowrap" class="content3"><b>{$TR_SIZE}</b></td>
      </tr>
      {section name=i loop=$MOUNT}
      <tr>
        <td nowrap="nowrap">&nbsp;</td>
        <td nowrap="nowrap" class="content">{$MOUNT[i]}</td>
        <td nowrap="nowrap" class="content">{$TYPE[i]}</td>
        <td nowrap="nowrap" class="content">{$PARTITION[i]}</td>
        <td nowrap="nowrap" align="center" class="content">{$PERCENT[i]}</td>
        <td nowrap="nowrap" align="right" class="content">{$FREE[i]}</td>
        <td nowrap="nowrap" align="right" class="content">{$USED[i]}</td>
        <td nowrap="nowrap" align="right" class="content">{$SIZE[i]}</td>
      </tr>
      {/section}
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

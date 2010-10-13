<table align="left" border="0" cellpadding="0" cellspacing="0">
<tr>
  {section name=i loop=$MAIN_ITEM_NAME}
  <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="menu">
        <div align="center">
          <a href="{$MAIN_ITEM_LINK[i]}" onMouseOver="MM_swapImage('top_menu_{$smarty.section.i.index}','','{$THEME_COLOR_PATH}/images/icons/{$MAIN_ITEM_ICON_ACTIVE[i]}',1)" onMouseOut="MM_swapImgRestore()" {if $MAIN_ITEM_TARGET[i]}target="{$MAIN_ITEM_TARGET[i]}"{/if}><img src="{$THEME_COLOR_PATH}/images/icons/{if $MAIN_ITEM_IS_ACTIVE[i]}{$MAIN_ITEM_ICON_ACTIVE[i]}{else}{$MAIN_ITEM_ICON[i]}{/if}" name="general" width="47" height="46" border="0" alt="" id="top_menu_{$smarty.section.i.index}" /></a>
        </div>
      </td>
    </tr>
    <tr>
      <td class="menu">
        <div align="center">
          <a href="{$MAIN_ITEM_LINK[i]}" class="menu_active" onMouseOver="MM_swapImage('top_menu_{$smarty.section.i.index}','','{$THEME_COLOR_PATH}/images/icons/{$MAIN_ITEM_ICON_ACTIVE[i]}',1)" onMouseOut="MM_swapImgRestore()" {if $MAIN_ITEM_TARGET[i]}target="{$MAIN_ITEM_TARGET[i]}"{/if}>{$MAIN_ITEM_NAME[i]}</a>
        </div>
      </td>
    </tr>
    </table>
  </td>
  <td width="30">
    &nbsp;
  </td>
  {/section}
</tr>
</table>

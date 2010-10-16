	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td align="left">
		   <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_billing.png" width="25" height="25" alt="" /></td>
             <td colspan="2" class="title">{$TR_MANAGE_ORDERS}</td>
            </tr>
           </table>
          </td>
          <td width="27" align="right">&nbsp;</td>
         </tr>
         <tr>
          <td>
		   <!-- BDP: props_list -->
           <table width="100%" cellspacing="3">
            {if $MESSAGE}
            <tr>
             <td width="35">&nbsp;</td>
             <td colspan="7" class="title"><span class="message">{$MESSAGE}<br /></span></td>
            </tr>
            {/if}
            {if $ID}
            <tr>
             <td width="35" align="center">&nbsp;</td>
             <td class="content3" width="20" align="center"><span class="menu"><b>{$TR_ID}</b></span></td>
             <td class="content3"><b>{$TR_DOMAIN}</b></td>
             <td class="content3"><strong>{$TR_HP}</strong></td>
             <td class="content3"><strong>{$TR_USER}</strong></td>
             <td align="center" class="content3"><strong>{$TR_STATUS}</strong></td>
             <td width="200" colspan="2" align="center" class="content3"><b>{$TR_ACTION}</b></td>
            </tr>
            {section name=i loop=$ID}
            <tr class="hl">
             <td width="35" align="center">&nbsp;</td>
             <td class="{$ITEM_CLASS[i]}" width="20" align="center">{$ID[i]}</td>
             <td class="{$ITEM_CLASS[i]}">{$DOMAIN[i]}</td>
             <td class="{$ITEM_CLASS[i]}">{$HP[i]}</td>
             <td class="{$ITEM_CLASS[i]}">{$USER[i]}</td>
             <td align="center" class="{$ITEM_CLASS[i]}">{$STATUS[i]}</td>
             <td class="{$ITEM_CLASS[i]}" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/details.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="{$LINK[i]}" class="link">{$TR_ADD}</a></td>
             <td class="{$ITEM_CLASS[i]}" align="center"><img src="{$THEME_COLOR_PATH}/images/icons/delete.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /> <a href="#" onClick="delete_order('orders_delete.php?order_id={$ID[i]}', '{$DOMAIN[i]}')" class="link">{$TR_DELETE}</a></td>
            </tr>
            {/section}
            {/if}
           </table>
           <!-- EDP: props_list -->
           <div align="right"><br />
            {if $PREV_PSI || $PREV_PSI===0}
            <a href="orders.php?psi={$PREV_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/prev.png" width="20" height="20" border="0" alt="" /></a>
            {else}
            <img src="{$THEME_COLOR_PATH}/images/icons/flip/prev_gray.png" width="20" height="20" border="0" alt="" />
            {/if}
            &nbsp;
            {if $NEXT_PSI}
            <a href="orders.php?psi={$NEXT_PSI}"><img src="{$THEME_COLOR_PATH}/images/icons/flip/next.png" width="20" height="20" border="0" alt="" /></a>
            {else}
            <img src="{$THEME_COLOR_PATH}/images/icons/flip/next_gray.png" width="20" height="20" border="0" alt="" />
            {/if}
           </div>
		  </td>
          <td>&nbsp;</td>
         </tr>
         <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
         </tr>
        </table>
	   

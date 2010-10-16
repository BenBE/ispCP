	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
          <td align="left">
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="20"><img src="{$THEME_COLOR_PATH}/images/content/table_icon_debugger.png" width="25" height="25" alt="" /></td>
             <td colspan="2" class="title">{$TR_DEBUGGER_TITLE}</td>
            </tr>
           </table>
          </td>
          <td width="27" align="right">&nbsp;</td>
         </tr>
         <tr>
          <td>
           <table width="100%" cellpadding="5" cellspacing="5">
            {if $MESSAGE}
            <tr>
             <td width="25">&nbsp;</td>
             <td colspan="2" class="title"><span class="message">{$MESSAGE}</span></td>
            </tr>
            {/if}
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_DOMAIN_ERRORS}</b></td>
            </tr>
            {if !$DMN_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_DOMAIN_MESSAGE}</td>
            </tr>
            {/if}
            {section name=i loop=$DMN_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td class="{$DMN_CONTENT[i]}">
			  {$TR_DOMAIN_NAME[i]} - <a href="ispcp_debugger.php?action=change_status&amp;id={$DMN_CHANGE_ID[i]}&amp;type={$DMN_CHANGE_TYPE[i]}" class="link">{$TR_CHANGE_STATUS}</a><br />
              <span style="color:red;">{$TR_DOMAIN_ERROR[i]}</span>
			 </td>
            </tr>
            {/section}
           </table>
           <br />
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_ALIAS_ERRORS}</b></td>
            </tr>
            {if !$ALS_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_ALIAS_MESSAGE}</td>
            </tr>
            {/if}
            {section name=i loop=$ALS_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td class="{$ALS_CONTENT[i]}">
			  {$TR_ALIAS_NAME[i]} - <a href="ispcp_debugger.php?action=change_status&amp;id={$ALS_CHANGE_ID[i]}&amp;type={$ALS_CHANGE_TYPE[i]}" class="link">{$TR_CHANGE_STATUS}</a><br />
              <span style="color:red;">{$TR_ALIAS_ERROR[i]}</span>
			 </td>
            </tr>
            {/section}
           </table>
           <br />
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_SUBDOMAIN_ERRORS}</b></td>
            </tr>
            {if !$SUB_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_SUBDOMAIN_MESSAGE}</td>
            </tr>
             {/if}
             {section name=i loop=$SUB_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td class="{$SUB_CONTENT[i]}">
			  {$TR_SUBDOMAIN_NAME[i]} - <a href="ispcp_debugger.php?action=change_status&amp;id={$SUB_CHANGE_ID[i]}&amp;type={$SUB_CHANGE_TYPE[i]}" class="link">{$TR_CHANGE_STATUS}</a><br />
              <span style="color:red;">{$TR_SUBDOMAIN_ERROR[i]}</span>
			 </td>
            </tr>
            {/section}
           </table>
           <br />
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_SUBDOMAIN_ALIAS_ERRORS}</b></td>
            </tr>
            {if !$ALSSUB_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_SUBDOMAIN_ALIAS_MESSAGE}</td>
            </tr>
             {/if}
             {section name=i loop=$ALSSUB_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td class="{$ALSSUB_CONTENT[i]}">
			  {$TR_SUBDOMAIN_ALIAS_NAME[i]} - <a href="ispcp_debugger.php?action=change_status&amp;id={$ALSSUB_CHANGE_ID[i]}&amp;type={$ALSSUB_CHANGE_TYPE[i]}" class="link">{$TR_CHANGE_STATUS}</a><br />
              <span style="color:red;">{$TR_SUBDOMAIN_ALIAS_ERROR[i]}</span>
			 </td>
            </tr>
            {/section}
           </table>
           <br />
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_MAIL_ERRORS}</b></td>
            </tr>
            {if !$MAIL_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_MAIL_MESSAGE}</td>
            </tr>
            {/if}
            {section name=i loop=$MAIL_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td class="{$MAIL_CONTENT[i]}">
			  {$TR_MAIL_NAME[i]} - <a href="ispcp_debugger.php?action=change_status&amp;id={$MAIL_CHANGE_ID[i]}&amp;type={$MAIL_CHANGE_TYPE[i]}" class="link">{$TR_CHANGE_STATUS}</a><br />
              <span style="color:red;">{$TR_MAIL_ERROR[i]}</span></td>
            </tr>
            {/section}
           </table>
           <br />
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_HTACCESS_ERRORS}</b></td>
            </tr>
            {if !$HTACCESS_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_HTACCESS_MESSAGE}</td>
            </tr>
            {/if}
            {section name=i loop=$HTACCESS_CONTENT}
            <tr>
             <td>&nbsp;</td>
             <td class="{$HTACCESS_CONTENT[i]}">
			  {$TR_HTACCESS_NAME[i]} - <a href="ispcp_debugger.php?action=change_status&amp;id={$HTACCESS_CHANGE_ID[i]}&amp;type={$HTACCESS_CHANGE_TYPE[i]}" class="link">{$TR_CHANGE_STATUS}</a><br />
              <span style="color:red;">{$TR_HTACCESS_ERROR[i]}</span></td>
            </tr>
            {/section}
           </table>
           <br />
           <table width="100%" cellpadding="5" cellspacing="5">
            <tr>
             <td width="25">&nbsp;</td>
             <td class="content3"><b>{$TR_DAEMON_TOOLS}</b></td>
            </tr>
            <tr>
             <td>&nbsp;</td>
             <td><a href="ispcp_debugger.php?action=run_engine" class="link">{$EXEC_COUNT} {$TR_EXEC_REQUESTS}</a></td>
            </tr>
            <tr>
             <td>&nbsp;</td>
             <td>{$TR_ERRORS}</a></td>
            </tr>
           </table>
          </td>
          <td>&nbsp;</td>
         </tr>
         <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
         </tr>
        </table>
	   

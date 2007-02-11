<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset={THEME_CHARSET}">
<title>{TR_ADMIN_USER_STATISTICS_PAGE_TITLE}</title>
  <meta name="robots" content="noindex">
  <meta name="robots" content="nofollow">
<link href="{THEME_COLOR_PATH}/css/vhcs.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="{THEME_COLOR_PATH}/css/vhcs.js"></script>
</head>

<body onLoad="MM_preloadImages('{THEME_COLOR_PATH}/images/icons/database_a.gif','{THEME_COLOR_PATH}/images/icons/hosting_plans_a.gif','{THEME_COLOR_PATH}/images/icons/domains_a.gif','{THEME_COLOR_PATH}/images/icons/general_a.gif','{THEME_COLOR_PATH}/images/icons/logout_a.gif','{THEME_COLOR_PATH}/images/icons/manage_users_a.gif','{THEME_COLOR_PATH}/images/icons/webtools_a.gif','{THEME_COLOR_PATH}/images/icons/statistics_a.gif','{THEME_COLOR_PATH}/images/icons/support_a.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%" style="border-collapse: collapse;padding:0;margin:0;">
	<tr>
		<td align="left" valign="top" style="vertical-align: top; width: 195px; height: 56px;"><img src="{THEME_COLOR_PATH}/images/top/top_left.jpg" border="0"></td>
		<td style="height: 56px; width: 785px;"><img src="{THEME_COLOR_PATH}/images/top/top_left_bg.jpg" border="0"></td>
		<td style="width:100%; background-image: url({THEME_COLOR_PATH}/images/top/top_bg.jpg)">&nbsp;</td>
		<td style="width: 73px; height: 56px;"><img src="{THEME_COLOR_PATH}/images/top/top_right.jpg" border="0"></td>
	</tr>
	<tr>
		<td style="width: 195px; vertical-align: top;">{MENU}</td>
	    <td colspan=3 style="vertical-align: top;"><table style="width: 100%; border-collapse: collapse;padding:0;margin:0;">
				<tr height="95";>
				  <td style="padding-left:30px; width: 100%; background-image: url({THEME_COLOR_PATH}/images/top/middle_bg.jpg);">{MAIN_MENU}</td>
					<td style="padding:0;margin:0;text-align: right; width: 73px;vertical-align: top;"><img src="{THEME_COLOR_PATH}/images/top/middle_right.jpg" border="0"></td>
				</tr>
				<tr height="*">
				  <td colspan=3><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left"><table width="100%" cellpadding="5" cellspacing="5">
                          <tr>
                            <td width="25"><img src="{THEME_COLOR_PATH}/images/content/table_icon_stats.png" width="25" height="25"></td>
                            <td colspan="2" class="title">{TR_RESELLER_USER_STATISTICS}</td>
                          </tr>
                      </table></td>
                      <td width="27" align="right">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="top"><!-- BDP: page_message -->
                          <table width="100%" cellspacing="7">
                            <tr>
                              <td width="25" nowrap="nowrap">&nbsp;&nbsp;&nbsp;</td>
                              <td><!-- BDP: props_list -->
                                  <form action="reseller_user_statistics.php?psi={POST_PREV_PSI}" method="post" name="rs_frm" id="rs_frm">
                                    <table width="100%">
                                      <tr>
                                        <td width="80" class="content">{TR_MONTH}</td>
                                        <td width="80" class="content"><select name="month">
                                            <!-- BDP: month_list -->
                                            <option {OPTION_SELECTED}>{MONTH_VALUE}</option>
                                            <!-- EDP: month_list -->
                                          </select>
                                        </td>
                                        <td width="80" class="content">{TR_YEAR}</td>
                                        <td width="80" class="content"><select name="year">
                                            <!-- BDP: year_list -->
                                            <option {OPTION_SELECTED}>{YEAR_VALUE}</option>
                                            <!-- EDP: year_list -->
                                          </select>
                                        </td>
                                        <td class="content"><input name="Submit" type="submit" class="button" value=" {TR_SHOW} " />
                                        </td>
                                      </tr>
                                    </table>
                                    <input type="hidden" name="uaction" value="show" />
                                    <input type="hidden" name="name" value="{VALUE_NAME}" />
                                    <input type="hidden" name="rid" value="{VALUE_RID}" />
                                  </form>
                                <br />
                                  <table cellspacing="3">
                                    <!-- BDP: no_domains -->
                                    <tr>
                                      <td class="title" colspan="13" width="550"><font color="#FF0000"> {TR_NO_DOMAINS}</font> </td>
                                    </tr>
                                    <!-- EDP: no_domains -->
                                    <!-- BDP: domain_list -->
                                    <tr>
                                      <td height="25" colspan="13" nowrap="nowrap" class="content">{RESELLER_NAME}</td>
                                    </tr>
                                    <tr align="center">
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_DOMAIN_NAME}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_TRAFF}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_DISK}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_WEB}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_FTP_TRAFF}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_SMTP}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_POP3}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_SUBDOMAIN}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_ALIAS}</b> </td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_MAIL}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_FTP}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_SQL_DB}</b></td>
                                      <td class="content3" nowrap="nowrap" height="25"><b>{TR_SQL_USER}</b></td>
                                    </tr>
                                    <!-- BDP: domain_entry -->
                                    <tr>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center"><b><a href="domain_statistics.php?month={MONTH}&amp;year={YEAR}&amp;domain_id={DOMAIN_ID}" class="link">{DOMAIN_NAME}</a></b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="13"><img src="{THEME_COLOR_PATH}/images/stats_left_small.gif" width="13" height="20" /></td>
                                            <td background="{THEME_COLOR_PATH}/images/stats_background.gif"><table border="0" cellspacing="0" cellpadding="0" align="left">
                                                <tr>
                                                  <td width="7"><img src="{THEME_COLOR_PATH}/images/bars/stats_left.gif" width="7" height="13" /></td>
                                                  <td background="{THEME_COLOR_PATH}/images/bars/stats_background.gif"><img src="{THEME_COLOR_PATH}/images/trans.gif" width="{TRAFF_PERCENT}" height="1" /></td>
                                                  <td width="7"><img src="{THEME_COLOR_PATH}/images/bars/stats_right.gif" width="7" height="13" /></td>
                                                </tr>
                                            </table></td>
                                            <td width="13"><img src="{THEME_COLOR_PATH}/images/stats_right_small.gif" width="13" height="20" /></td>
                                          </tr>
                                        </table>
                                          <b>{TRAFF_SHOW_PERCENT}&nbsp;%</b><br />
                                        {TRAFF_USED}<br />
                                        {TR_OF}<br />
                                        <b>{TRAFF_MAX}</b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="13"><img src="{THEME_COLOR_PATH}/images/stats_left_small.gif" width="13" height="20" /></td>
                                            <td background="{THEME_COLOR_PATH}/images/stats_background.gif"><table border="0" cellspacing="0" cellpadding="0" align="left">
                                                <tr>
                                                  <td width="7"><img src="{THEME_COLOR_PATH}/images/bars/stats_left.gif" width="7" height="13" /></td>
                                                  <td background="{THEME_COLOR_PATH}/images/bars/stats_background.gif"><img src="{THEME_COLOR_PATH}/images/trans.gif" width="{DISK_PERCENT}" height="1" /></td>
                                                  <td width="7"><img src="{THEME_COLOR_PATH}/images/bars/stats_right.gif" width="7" height="13" /></td>
                                                </tr>
                                            </table></td>
                                            <td width="13"><img src="{THEME_COLOR_PATH}/images/stats_right_small.gif" width="13" height="20" /></td>
                                          </tr>
                                        </table>
                                          <b>{DISK_SHOW_PERCENT}&nbsp;%</b><br />
                                        {DISK_USED}<br />
                                        {TR_OF}<br />
                                        <b>{DISK_MAX}</b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{WEB}</td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{FTP}</td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{SMTP}</td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{POP3}</td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{SUB_USED}<br />
                                        {TR_OF}<br />
                                        <b>{SUB_MAX}</b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{ALS_USED}</td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{MAIL_USED}<br />
                                        {TR_OF}<br />
                                        <b>{MAIL_MAX}</b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{FTP_USED}<br />
                                        {TR_OF}<br />
                                        <b>{FTP_MAX}</b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{SQL_DB_USED}<br />
                                        {TR_OF}<br />
                                        <b>{SQL_DB_MAX}</b></td>
                                      <td class="{ITEM_CLASS}" nowrap="nowrap" align="center">{SQL_USER_USED}<br />
                                        {TR_OF}<br />
                                        <b>{SQL_USER_MAX}</b></td>
                                    </tr>
                                    <!-- EDP: domain_entry -->
                                    <!-- EDP: domain_list -->
                                  </table>
                                <table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td><div align="left"><br />
                                              <!-- BDP: scroll_prev_gray -->
                                              <img src="{THEME_COLOR_PATH}/images/icons/flip/prev_gray.gif" width="20" height="20" border="0" />
                                              <!-- EDP: scroll_prev_gray -->
                                              <!-- BDP: scroll_prev -->
                                              <a href="reseller_user_statistics.php?psi={PREV_PSI}&amp;rid={VALUE_RID}&amp;name={VALUE_NAME}&amp;month={MONTH}&amp;year={YEAR}"><img src="{THEME_COLOR_PATH}/images/icons/flip/prev.gif" width="20" height="20" border="0" /></a>
                                              <!-- EDP: scroll_prev -->
                                              <!-- BDP: scroll_next_gray -->
                                        &nbsp;<img src="{THEME_COLOR_PATH}/images/icons/flip/next_gray.gif" width="20" height="20" border="0" />
                                        <!-- EDP: scroll_next_gray -->
                                        <!-- BDP: scroll_next -->
                                        &nbsp;<a href="reseller_user_statistics.php?psi={NEXT_PSI}&amp;rid={VALUE_RID}&amp;name={VALUE_NAME}&amp;month={MONTH}&amp;year={YEAR}"><img src="{THEME_COLOR_PATH}/images/icons/flip/next.gif" width="20" height="20" border="0" /></a>
                                        <!-- EDP: scroll_next -->
                                      </div></td>
                                      <td><div align="right"><br />
                                              <!-- BDP: scroll_prev_gray -->
                                              <img src="{THEME_COLOR_PATH}/images/icons/flip/prev_gray.gif" width="20" height="20" border="0" />
                                              <!-- EDP: scroll_prev_gray -->
                                              <!-- BDP: scroll_prev -->
                                              <a href="reseller_user_statistics.php?psi={PREV_PSI}&amp;rid={VALUE_RID}&amp;name={VALUE_NAME}&amp;month={MONTH}&amp;year={YEAR}"><img src="{THEME_COLOR_PATH}/images/icons/flip/prev.gif" width="20" height="20" border="0" /></a>
                                              <!-- EDP: scroll_prev -->
                                              <!-- BDP: scroll_next_gray -->
                                        &nbsp;<img src="{THEME_COLOR_PATH}/images/icons/flip/next_gray.gif" width="20" height="20" border="0" />
                                        <!-- EDP: scroll_next_gray -->
                                        <!-- BDP: scroll_next -->
                                        &nbsp;<a href="reseller_user_statistics.php?psi={NEXT_PSI}&amp;rid={VALUE_RID}&amp;name={VALUE_NAME}&amp;month={MONTH}&amp;year={YEAR}"><img src="{THEME_COLOR_PATH}/images/icons/flip/next.gif" width="20" height="20" border="0" /></a>
                                        <!-- EDP: scroll_next -->
                                      </div></td>
                                    </tr>
                                </table></td>
                            </tr>
                          </table>
                        <br />
                          <!-- EDP: traffic_table -->
                      </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
				</tr>
			</table>
			
	    <p>&nbsp;</p></td>
	</tr>
</table>
</body>
</html>

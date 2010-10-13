<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{$PAGE_TITLE}</title>
<meta name="robots" content="nofollow, noindex" />
<meta http-equiv="Content-Type" content="text/html; charset={$THEME_CHARSET}" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link href="{$THEME_COLOR_PATH}/css/ispcp.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{$THEME_COLOR_PATH}/css/jquery.js"></script>
<script type="text/javascript" src="{$THEME_COLOR_PATH}/css/jquery.ispcpTooltips.js"></script>
<script type="text/javascript" src="{$THEME_COLOR_PATH}/css/ispcp.js"></script>
<!--[if lt IE 7.]>
<script defer type="text/javascript" src="{$THEME_COLOR_PATH}/css/pngfix.js"></script>
<![endif]-->
</head>

<body onLoad="MM_preloadImages('{$THEME_COLOR_PATH}/images/icons/database_a.png','{$THEME_COLOR_PATH}/images/icons/domains_a.png','{$THEME_COLOR_PATH}/images/icons/ftp_a.png','{$THEME_COLOR_PATH}/images/icons/general_a.png' ,'{$THEME_COLOR_PATH}/images/icons/email_a.png','{$THEME_COLOR_PATH}/images/icons/webtools_a.png','{$THEME_COLOR_PATH}/images/icons/statistics_a.png','{$THEME_COLOR_PATH}/images/icons/support_a.png')">

<table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%;padding:0;margin:0 auto;">
{if $LOGGED_FROM}
<tr>
  <td colspan="3" height="20" nowrap="nowrap" class="backButton">
    &nbsp;&nbsp;&nbsp;<a href="change_user_interface.php?action=go_back"><img src="{$THEME_COLOR_PATH}/images/icons/close_interface.png" width="16" height="16" border="0" style="vertical-align:middle" alt="" /></a> {$YOU_ARE_LOGGED_AS}
  </td>
</tr>
{/if}
<tr>
  <td align="left" valign="top" style="vertical-align: top; width: 195px; height: 56px;">
    <img src="{$THEME_COLOR_PATH}/images/top/top_left.jpg" width="195" height="56" border="0" alt="ispCP Logogram" />
  </td>
  <td style="height: 56px; width:100%; background-color: #0f0f0f">
    <img src="{$THEME_COLOR_PATH}/images/top/top_left_bg.jpg" width="582" height="56" border="0" alt="" />
  </td>
  <td style="width: 73px; height: 56px;">
    <img src="{$THEME_COLOR_PATH}/images/top/top_right.jpg" width="73" height="56" border="0" alt="" />
  </td>
</tr>
<tr>
  <td style="width: 195px; vertical-align: top;">
    {include file=$SUB_MENU}
  </td>
	<td colspan=2 style="vertical-align: top;">
    <table style="width: 100%; padding:0;margin:0;" cellspacing="0">
    <tr style="height: 95px">
      <td style="padding-left:30px; width: 100%; background-image: url({$THEME_COLOR_PATH}/images/top/middle_bg.jpg);">
        {include file=$MAIN_MENU}
      </td>
      <td style="padding:0;margin:0;text-align: right; width: 73px;vertical-align: top;">
        <img src="{$THEME_COLOR_PATH}/images/top/middle_right.jpg" width="73" height="95" border="0" alt="" />
      </td>
    </tr>
    <tr>
      <td colspan=3>
        {include file=$PAGE_CONTENT}
      </td>
    </tr>
    </table>
	</td>
</tr>
</table>
</body>
</html>

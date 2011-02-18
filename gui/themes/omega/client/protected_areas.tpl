{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(document).ready(function() { 
			$('#protected_areas_add').click(function() { 
				document.location.href = 'protected_areas_add.php';
			});
			$('#protected_user_manage').click(function() { 
				document.location.href = 'protected_user_manage.php';
			});
		});

		function action_delete(url, subject) { 
			return confirm(sprintf("{$TR_MESSAGE_DELETE}", subject));
		}
	/* ]]> */
	</script>
	<div class="header">
		{include file="$MAIN_MENU"}
		<div class="logo">
			<img src="{$THEME_COLOR_PATH}/images/ispcp_logo.png" alt="ispCP Omega logo" />
			<img src="{$THEME_COLOR_PATH}/images/ispcp_webhosting.png" alt="ispCP Omega" />
		</div>
	</div>
	<div class="location">
		<div class="location-area">
			<h1 class="webtools">{$TR_MENU_WEBTOOLS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="webtools.php">{$TR_MENU_OVERVIEW}</a></li>
			<li><a>{$TR_HTACCESS}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		<h2 class="htaccess"><span>{$TR_HTACCESS}</span></h2>
		{if isset($AREA_PATH)}
		<table>
			<tr>
				<th>{$TR_HTACCESS}</th>
				<th>{$TR_STATUS}</th>
				<th>{$TR__ACTION}</th>
			</tr>
			<!-- BDP: dir_item -->
			<tr>
				<td>{$AREA_NAME}<br /><em>{$AREA_PATH}</em></td>
				<td>{$STATUS}</td>
				<td>
					<a href="protected_areas_add.php?id={$PID}" title="{$TR_EDIT}" class="icon i_edit"></a>
					<a href="protected_areas_delete.php?id={$PID}" onclick="return action_delete('protected_areas_delete.php?id={$PID}', '{$JS_AREA_NAME}')" title="{$TR_DELETE}" class="icon i_delete"></a>
				</td>
			</tr>
			<!-- EDP: dir_item -->
		</table>
		{/if}
		<div class="buttons">
			<input type="button" name="protected_areas_add" id="protected_areas_add" value="{$TR_ADD_AREA}" />
			<input type="button" name="protected_user_manage" id="protected_user_manage" value="{$TR_MANAGE_USRES}" />
		</div>
	</div>
{include file='footer.tpl'}
{include file='header.tpl'}
<body>
	<script type="text/javascript">
	/* <![CDATA[ */
		jQuery(document).ready(function(){
			jQuery('.tablesorter').tablesorter({ cssHeader: 'tablesorter'});
		});

		function action_delete(url, subject) {
			if (!confirm(sprintf("{$TR_MESSAGE_DELETE}", subject)))
				return false;
			location = url;
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
			<h1 class="domains">{$TR_MENU_MANAGE_DOMAINS}</h1>
		</div>
		<ul class="location-menu">
			{if isset($YOU_ARE_LOGGED_AS)}
			<li><a href="change_user_interface.php?action=go_back" class="backadmin">{$YOU_ARE_LOGGED_AS}</a></li>
			{/if}
			<li><a href="../index.php?logout" class="logout">{$TR_MENU_LOGOUT}</a></li>
		</ul>
		<ul class="path">
			<li><a href="domains_manage.php">{$TR_MENU_MANAGE_DOMAINS}</a></li>
			<li><a href="domains_manage.php">{$TR_MENU_OVERVIEW}</a></li>
		</ul>
	</div>
	<div class="left_menu">{include file="$MENU"}</div>
	<div class="main">
		{if isset($MESSAGE)}
		<div class="{$MSG_TYPE}">{$MESSAGE}</div>
		{/if}
		{if isset($ALS_MSG)}
			<div class="{$ALS_MSG_TYPE}">{$ALS_MSG}</div>
		{/if}
		{if isset($ALS_NAME)}
		<h2 class="domains"><span>{$TR_DOMAIN_ALIASES}</span></h2>
		<table class="tablesorter">
			<thead>
				<tr>
					<th>{$TR_ALS_NAME}</th>
					<th style="width:200px">{$TR_ALS_MOUNT}</th>
					<th style="width:200px">{$TR_ALS_FORWARD}</th>
					<th style="width:100px">{$TR_ALS_STATUS}</th>
					<th style="width:200px">{$TR_ALS_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				{section name=i loop=$ALS_NAME}
				<tr>
					<td><a href="http://{$ALS_NAME[i]}/" class="icon i_domain" title="{$ALS_NAME[i]}">{$ALS_NAME[i]}</a></td>
					<td>{$ALS_MOUNT[i]}</td>
					<td>{$ALS_FORWARD[i]}</td>
					<td>{$ALS_STATUS[i]}</td>
					<td>
						<a href="{$ALS_EDIT_LINK[i]}" title="{$ALS_EDIT[i]}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('{$ALS_ACTION_SCRIPT[i]}', '{$ALS_NAME[i]}')" title="{$ALS_ACTION[i]}" class="icon i_delete"></a>
					</td>
				</tr>
				{/section}
			</tbody>
		</table>
		{/if}
		{if isset($SUB_MSG)}
		<div class="{$SUB_MSG_TYPE}">{$SUB_MSG}</div>
		{/if}
		{if isset($SUB_NAME)}
		<h2 class="domains"><span>{$TR_SUBDOMAINS}</span></h2>
		<table class="tablesorter">
			<thead>
				<tr>
					<th>{$TR_SUB_NAME}</th>
					<th style="width:200px">{$TR_SUB_MOUNT}</th>
					<th style="width:200px">{$TR_SUB_FORWARD}</th>
					<th style="width:100px">{$TR_SUB_STATUS}</th>
					<th style="width:200px">{$TR_SUB_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				{section name=i loop=$SUB_NAME}
				<tr>
					<td><a href="http://{$SUB_NAME[i]}.{$SUB_ALIAS_NAME[i]}/" title="{$SUB_NAME[i]}.{$SUB_ALIAS_NAME[i]}" class="icon i_domain">{$SUB_NAME[i]}.{$SUB_ALIAS_NAME[i]}</a></td>
					<td>{$SUB_MOUNT[i]}</td>
					<td>{$SUB_FORWARD[i]}</td>
					<td>{$SUB_STATUS[i]}</td>
					<td>
						<a href="{$SUB_EDIT_LINK[i]}" title="{$SUB_EDIT[i]}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('{$SUB_ACTION_SCRIPT[i]}', '{$SUB_NAME[i]}')" title="{$SUB_ACTION[i]}" class="icon i_delete"></a>
					</td>
				</tr>
				{/section}
			</tbody>
		</table>
		{/if}
		{if isset($DNS_MSG)}
		<div class="{$DNS_MSG_TYPE}">{$DNS_MSG}</div>
		{/if}
		{if isset($DNS_DOMAIN)}
		<h2 class="domains"><span>{$TR_DNS}</span></h2>
		<table class="tablesorter">
			<thead>
				<tr>
					<th>{$TR_DOMAIN_NAME}</th>
					<th>{$TR_DNS_NAME}</th>
					<th>{$TR_DNS_CLASS}</th>
					<th>{$TR_DNS_TYPE}</th>
					<th>{$TR_DNS_DATA}</th>
					<th>{$TR_DNS_STATUS}</th>
					<th style="width:200px">{$TR_DNS_ACTION}</th>
				</tr>
			</thead>
			<tbody>
				{section name=i loop=$DNS_DOMAIN}
				<tr>
					<td><span class="icon i_domain_icon">{$DNS_DOMAIN[i]}</span></td>
					<td>{$DNS_NAME[i]}</td>
					<td>{$DNS_CLASS[i]}</td>
					<td>{$DNS_TYPE[i]}</td>
					<td>{$DNS_DATA[i]}</td>
					<td>{$DNS_STATUS[i]}</td>
					<td>
						<a href="{$DNS_ACTION_SCRIPT_EDIT[i]}" title="{$DNS_ACTION_EDIT[i]}" class="icon i_edit"></a>
						<a href="#" onclick="action_delete('{$DNS_ACTION_SCRIPT_DELETE[i]}', '{$DNS_TYPE_RECORD[i]}')" title="{$DNS_ACTION_DELETE[i]}" class="icon i_delete"></a>
					</td>
				</tr>
				{/section}
			</tbody>
		</table>
		{/if}
	</div>
{include file='footer.tpl'}
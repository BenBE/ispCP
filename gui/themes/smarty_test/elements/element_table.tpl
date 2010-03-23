<table {if $table.class}class="{$table.class|escape}"{/if} {if $table.id}id="{$table.id|escape}"{/if} cellspacing="1">
	<thead>
		<tr>
		{foreach from=$table.headFields item=head}
			<th {if $head.class}class="{$head.class|escape}"{/if} {if $head.attributes}{$head.attributes|escape}{/if}>
				{$head.data|escape}
			</th>
		{/foreach}
      	</tr>
	</thead>
	<tbody>
	{if $table.rows}
	{foreach from=$table.rows item=row}
		<tr {if $row.id}id="row_{$row.ID|escape}"{/if}>
		  {foreach from=$row.fields item=field}
			  <td {if $field.attributes}{$field.attributes|escape}{/if}>{$field.data|escape}</td>  
		  {/foreach}
		</tr>
	{/foreach}			
	{/if}
	</tbody>
</table>
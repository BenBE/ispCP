<select name="{$control.name|escape}" {$control.addition_html}>
	{foreach from=$controloptions key=optkey value=optvalue}		
		<option value="{$optkey|escape}" {if $control.value == $optkey}selected="selected"{/if}>{$optvalue|escape}</option>
	{/foreach}
</select>

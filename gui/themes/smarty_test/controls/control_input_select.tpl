
<select name="{$control.name|escape}" {$control.addition_html}>
 {foreach from=$control.options key=optvalue item=opttext}
  <option value="{$optkey|escape}"{if $control.value == $optvalue} selected="selected"{/if}>{$opttext|escape}</option>
 {/foreach}
</select>

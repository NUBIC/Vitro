<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for dumping a template variable -->
 
<div class="var"> 

    <h6>Variable name: <em>${var}</em></h6>
    <#if value??>
        <strong>Type:</strong> ${type}<br />
        <strong>Value:</strong> ${value}<br />
    <#else>
        Variable is undefined in the data model
    </#if>
    
</div>


<?xml version="1.0"?>
<xsl:stylesheet version='2.0'
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aipres="http://vivoweb.org/ontology/activity-insight"
	xmlns:dm="http://www.digitalmeasures.com/schema/data"
	xmlns:xs='http://www.w3.org/2001/XMLSchema'
	xmlns:vfx='http://vivoweb.org/ext/functions'	
	exclude-result-prefixes='vfx xs dm'
>

<xsl:param name='listxml' required='yes'/>
<xsl:output method='xml' indent='yes'/>
<xsl:strip-space elements="*"/>
<xsl:variable name='NL'>
<xsl:text>
</xsl:text>
</xsl:variable>


<xsl:template match='/'>

<xsl:variable name='docs' as='node()*'
	select='collection($listxml)'/>

<aipres:PRESENT_LIST>

<xsl:for-each-group select='$docs//dm:PRESENT' 
	group-by='@id'>
<xsl:sort select='@id'/>
<xsl:if test='dm:USER_REFERENCE_CREATOR = "Yes"'>
<aipres:PRESENT>

<xsl:attribute name='index' select='position()'/>
<xsl:for-each select='current-group()'>
<xsl:sort select='@id'/>
<aipres:netid><xsl:value-of select='../../dm:Record/@username'/></aipres:netid>

<aipres:PRESENT_ID><xsl:value-of select='@id'/></aipres:PRESENT_ID>

<!-- other stuff may go here -->

</xsl:for-each>

</aipres:PRESENT>
</xsl:if>
</xsl:for-each-group>
</aipres:PRESENT_LIST>

<xsl:value-of select='$NL'/>
</xsl:template>
</xsl:stylesheet>

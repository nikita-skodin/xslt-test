<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">

    <xsl:key name="fun_key" match="Object/Function" use="@Name"/>
    <xsl:key name="proc_key" match="Object/Procedure" use="@Name"/>

    <xsl:template match="Objects">
        <root>
            <xsl:apply-templates select="Object/Function[generate-id(.)=generate-id(key('fun_key',@Name))]"/>
            <xsl:apply-templates select="Object/Procedure[generate-id(.)=generate-id(key('proc_key',@Name))]"/>
        </root>
    </xsl:template>

    <xsl:template match="Object/Function[count(key('fun_key', @Name)) >= 2]">
        <Functions>
            <xsl:copy-of select="key('fun_key',@Name)"/>
        </Functions>
    </xsl:template>

    <xsl:template match="Object/Procedure[count(key('proc_key', @Name)) >= 2]">
        <Procedures>
            <xsl:copy-of select="key('proc_key',@Name)"/>
        </Procedures>
    </xsl:template>

</xsl:stylesheet>

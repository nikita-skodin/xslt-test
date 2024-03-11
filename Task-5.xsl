<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">

    <xsl:key name="param_key" match="//Param" use="@Name"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="//Param[count(key('param_key', @Name)) >= 2]">
        <Param>

            <xsl:copy-of select="@*"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="concat(@Name, @pos)"/>
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>

        </Param>
    </xsl:template>

</xsl:stylesheet>


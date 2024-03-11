<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">

    <xsl:template match="Object[number(@ID) mod 2 = 1]">
    </xsl:template>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Object[number(@ID) mod 2 = 0]">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Objects">
        <xsl:copy>
            <xsl:apply-templates select="Object">
                <xsl:sort select="@ID" data-type="number"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
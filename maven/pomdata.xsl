<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text"/>
<!--
     pomdata.xsl: Extract package data, parent data and dependencies
                  from a pom file and produce MarkDown output
     Version:     0.2.0
  -->

<xsl:template match="/" xmlns:pom="http://maven.apache.org/POM/4.0.0">
    <xsl:text>&#xa;## Package Data &#xa;</xsl:text>
    <xsl:text>| Parameter | Value |&#xa;</xsl:text>
    <xsl:text>|-----------|-------|&#xa;</xsl:text>
    <xsl:text>| Artifact ID | `</xsl:text>
    <xsl:value-of select="/pom:project/pom:artifactId"/>
    <xsl:text>` |&#xa;</xsl:text>
    <xsl:text>| Version | `</xsl:text>
    <xsl:value-of select="/pom:project/pom:version"/>
    <xsl:text>` |&#xa;</xsl:text>
    <xsl:text>| Group id | `</xsl:text>
    <xsl:value-of select="/pom:project/pom:groupId"/>
    <xsl:text>` |&#xa;</xsl:text>
    <xsl:text>| Packaging | `</xsl:text>
    <xsl:value-of select="/pom:project/pom:packaging"/>
    <xsl:text>` |&#xa;</xsl:text>
    <xsl:for-each select="/pom:project/child::*">
        <xsl:choose>
            <xsl:when test="name() = 'parent'">
                <xsl:text>&#xa;## Parent &#xa;</xsl:text>
                <xsl:for-each select="*">
                    <xsl:text>- </xsl:text>
                    <xsl:value-of select="name()"/>
                    <xsl:text>: `</xsl:text>
                    <xsl:value-of select="text()"/>
                    <xsl:text>` &#xa;</xsl:text>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="name() = 'dependencies'">
                <xsl:text>&#xa;## Dependencies &#xa;</xsl:text>
                <xsl:for-each select="pom:dependency">
                    <xsl:text>&#xa;### </xsl:text>
                    <xsl:value-of select="pom:artifactId"/>
                    <xsl:text> &#xa;</xsl:text>
                    <xsl:for-each select="*">
                        <xsl:if test="translate(text(), ' &#xa;', '') != '' and name() != 'artifactId'">
                            <xsl:text>- </xsl:text>
                            <xsl:value-of select="name()"/>
                            <xsl:text>: `</xsl:text>
                            <xsl:value-of select="text()"/>
                            <xsl:text>` &#xa;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:text>&#xa;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:for-each>

</xsl:template>

</xsl:stylesheet>

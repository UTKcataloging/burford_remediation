<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.og/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns="http://www.loc.gov/mods/v3"
    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.loc.gov/mods/v3"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    <xsl:template match="abstract"/>

    <xsl:template match="topic">
        <xsl:choose>
            <xsl:when test="ends-with(., '.')">
                <topic>
                    <xsl:apply-templates select="substring(., 1, string-length(.) -1)"/>
                </topic>
            </xsl:when>
            <xsl:otherwise>
                <topic>
                    <xsl:apply-templates/>
                </topic>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="location"/>
    
    <xsl:template match="relatedItem[@displayLabel='Project']"/>

    <xsl:template match="relatedItem[@displayLabel='Collection']"/>

    <xsl:template match="accessCondition"/>
    
    <xsl:template match='mods'>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <physicalDescription>
                <form authority="aat" valueURI="http://vocab.getty.edu/aat/300026877">correspondence</form>
                <form authority="aat" valueURI="http://vocab.getty.edu/aat/300028569">manuscripts (documents)</form>
            </physicalDescription>
            <location>
                <physicalLocation valueURI="http://id.loc.gov/authorities/names/no2014027633">University of Tennessee Knoxville. Special Collections</physicalLocation>
            </location>
            <relatedItem displayLabel="Project" type="host">
                <titleInfo>
                    <title>Ramsey Family Letters</title>
                </titleInfo>
            </relatedItem>
            <relatedItem displayLabel="Collection" type="host">
                <titleInfo>
                    <title>David Burford Papers</title>
                </titleInfo>
                <identifier>MS.1027</identifier>
            </relatedItem>
            <accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/NoC-US/1.0/">No Copyright - United States</accessCondition>
        </xsl:copy>
    </xsl:template>
    
    <xsl:strip-space elements="*"/>
</xsl:stylesheet>
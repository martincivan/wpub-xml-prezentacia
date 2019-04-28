<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="parametre" select="document('parametre.xml')" />

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="prvy-slajd" size="25cm 18cm">
                    <fo:region-body margin="4cm 5cm"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="slajd" size="25cm 18cm">
                    <fo:region-body margin="4cm 3cm 0.1cm 3cm"/>
                    <fo:region-before extent="2cm" padding="1cm 3cm 1cm" display-align="before"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <xsl:apply-templates/>
        </fo:root>
    </xsl:template>

    <xsl:template match="prezentacia">
        <fo:page-sequence master-reference="prvy-slajd">
            <fo:flow flow-name="xsl-region-body" text-align="center">
                <fo:block font="bold 60pt Arial">
                    <xsl:value-of select="nadpis"/>
                </fo:block>
                <fo:block font="25pt Arial" color="grey" space-before="20pt">
                    <xsl:value-of select="podnadpis"/>
                </fo:block>
                <fo:block font="20pt Courier New" space-before="20pt">
                    <xsl:value-of select="autor"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>

        <xsl:apply-templates select="slajdy"/>

        <fo:page-sequence master-reference="prvy-slajd">
            <fo:flow flow-name="xsl-region-body" text-align="center">
                <fo:block font="bold 60pt Arial">
                    <xsl:value-of select="//zaver"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>

    </xsl:template>

    <xsl:template match="slajdy">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="slajd">
        <fo:page-sequence master-reference="slajd">
            <fo:static-content flow-name="xsl-region-before" font="bold 40pt Arial">
                <fo:block>
                    <xsl:value-of select="@nazov"/>
                </fo:block>
            </fo:static-content>
            <fo:flow flow-name="xsl-region-body" font="24pt {$parametre//pismo}">
                <fo:block>
                    <xsl:apply-templates/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <xsl:template match="obrazok">
        <fo:block text-align="center">
        <fo:external-graphic src="url({@kde})" content-height="scale-to-fit" content-width="scale-to-fit" height="10cm" width="10cm"  scaling="uniform"/>
        </fo:block>
        <fo:block text-align="center">
            <xsl:value-of select="."/>
        </fo:block>
    </xsl:template>

    <xsl:template match="polozka[../@cislovany=false()]">
        <fo:list-item>
            <fo:list-item-label end-indent="20pt">
                <fo:block><xsl:value-of select="$parametre//znak-zoznamu" /></fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="20pt">
                <fo:block>
                    <xsl:value-of select="."/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <xsl:template match="polozka[../@cislovany=true()]">
        <fo:list-item>
            <fo:list-item-label end-indent="label-end()">
                <fo:block font-weight="bold">
                    <xsl:value-of select="position()"/>
                    <xsl:text>.</xsl:text>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()">
                <fo:block>
                        <xsl:value-of select="."/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <xsl:template match="zoznam">
        <fo:list-block provisional-distance-between-starts="{15 + string-length(string(count(polozka))) * 15}pt">
            <xsl:apply-templates select="polozka" />
        </fo:list-block>
    </xsl:template>

</xsl:stylesheet>

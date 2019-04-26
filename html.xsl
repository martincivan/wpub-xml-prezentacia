<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:h="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" indent="yes" name="html" omit-xml-declaration="yes"/>

    <xsl:template match="/">

        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="slajdy">

        <xsl:apply-templates/>
        <xsl:result-document href="0.html" indent="yes" omit-xml-declaration="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <head>
                    <link rel="stylesheet" href="styl.css"/>
                    <link rel="stylesheet"
                          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                          crossorigin="anonymous"/>
                    <title>
                        <xsl:value-of select="//nadpis"/> - <xsl:value-of select="//podnadpis"/>:
                        <xsl:value-of select="@nazov"/>
                    </title>
                    <meta charset="UTF-8"/>
                </head>
                <body class="bg-dark">
                    <script>
                        document.onkeydown = checkKey;

                        function checkKey(e) {

                        e = e || window.event;

                        if (e.keyCode == '38') {
                        //document
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) - 1
                        <!--                        document.location=cislo + ".html"-->
                        }
                        else if (e.keyCode == '40') {
                        // down arrow
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) + 1
                        document.location=cislo + ".html"
                        }
                        else if (e.keyCode == '37') {
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) - 1
                        <!--                        document.location=cislo + ".html"-->
                        // left arrow
                        }
                        else if (e.keyCode == '39') {
                        // right arrow
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) + 1
                        document.location=cislo + ".html"
                        }

                        }
                    </script>
                    <div class="container bg-white text-center vysoky">
                        <div class="nastred">
                            <div class="w-100">
                                <h1>
                                    <xsl:value-of select="//nadpis"/>
                                </h1>
                                <h2>
                                    <xsl:value-of select="//podnadpis"/>
                                </h2>
                                <h3>
                                    <xsl:value-of select="//autor"/>
                                </h3>
                            </div>
                        </div>
                        <footer class="container fixed-bottom bg-dark text-center">
                            <span class="text-light">Ovládanie je možné aj šípkami</span>
                            <a href="1.html" class="float-right">Ďalej</a>

                        </footer>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="slajd">
        <xsl:result-document href="{count(preceding-sibling::slajd) + 1}.html" omit-xml-declaration="yes" indent="yes">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <head>
                    <link rel="stylesheet"
                          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                          crossorigin="anonymous"/>
                    <link rel="stylesheet" href="styl.css" type="text/css"/>
                    <title>
                        <xsl:value-of select="//nadpis"/> - <xsl:value-of select="count(preceding-sibling::slajd) + 1"/>:
                        <xsl:value-of select="@nazov"/>
                    </title>
                    <meta charset="UTF-8"/>
                    <script>
                        document.onkeydown = checkKey;

                        function checkKey(e) {

                        e = e || window.event;

                        if (e.keyCode == '38') {
                        //document
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) - 1
                        document.location=cislo + ".html"
                        }
                        else if (e.keyCode == '40') {
                        // down arrow
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) + 1
                        document.location=cislo + ".html"
                        }
                        else if (e.keyCode == '37') {
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) - 1
                        document.location=cislo + ".html"
                        // left arrow
                        }
                        else if (e.keyCode == '39') {
                        // right arrow
                        var filename = window.location.href.substring(window.location.href.lastIndexOf("/") + 1,
                        window.location.href.lastIndexOf("."))
                        var cislo = Number(filename) + 1
                        document.location=cislo + ".html"
                        }

                        }
                    </script>
                </head>
                <body class="bg-dark">
                    <div class="container bg-white vysoky p-5">
                        <h1>
                            <xsl:value-of select="@nazov"/>
                        </h1>
                    <div class="nastred">
                        <div>
                        <xsl:apply-templates/>
                        </div>
                    </div>
                        <footer class="container fixed-bottom bg-dark">
                            <a href="{count(preceding-sibling::slajd)}.html" class="float-left">Naspäť</a>
                            <a href="{count(preceding-sibling::slajd) + 2}.html" class="float-right">Ďalej</a>
                        </footer>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="obrazok">
        <figure class="w-100 text-center">
            <img src="{@kde}" alt="{text()}" style="max-height:50vh;max-width:50vh;" />
            <figcaption>
                <xsl:value-of select="text()"/></figcaption>
        </figure>
    </xsl:template>

    <xsl:template match="polozka">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>

    <xsl:template match="zoznam[@cislovany=false()]">
        <ul>
            <xsl:apply-templates select="polozka" />
        </ul>
    </xsl:template>

    <xsl:template match="zoznam[@cislovany=true()]">
        <ol>
            <xsl:apply-templates select="polozka" />
        </ol>
    </xsl:template>

</xsl:stylesheet>
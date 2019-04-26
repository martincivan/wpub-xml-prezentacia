#!/usr/bin/env bash

saxon -o:vystup/fo.xml -s:prezentacia.xml -xsl:pdf.xsl -ext:on

#XEP/xep -fo vystup/fo.xml -pdf vystup/vystup.pdf
XEP/xep -xml prezentacia.xml -xsl pdf.xsl -pdf vystup/vystup.pdf
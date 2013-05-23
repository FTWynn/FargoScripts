<?xml version="1.0" encoding="UTF-8"?>
<!-- 
 mbi: largely inspired by the excellent work by Makenshi: http://chaz6.com/static/xml/test.opml 
-->
<!--
 dbw: Subsequently derived from the excellent snippet here: http://www.dzone.com/snippets/opml-xsl-transformation-schema
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" indent="yes"/>

	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
			<head>
				<title>
					<xsl:value-of select="/opml/head/title"/>
				</title>
			</head>
			<xsl:apply-templates select="opml/body" />
		</html>
	</xsl:template>
	<xsl:template match="opml/body">
		<body>
			<h1>
				<xsl:value-of select="/opml/head/title" />
			</h1>
			<xsl:apply-templates select="outline">
				<xsl:with-param name="level" select="1"/>
			</xsl:apply-templates>
		</body>
	</xsl:template>
	<xsl:template match="outline">
		<xsl:param name="level" select="1"/>
		<xsl:choose>
			<xsl:when test="$level = 1">
				<h1><xsl:value-of select="@text"/></h1>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 2">
				<h2><xsl:value-of select="@text"/></h2>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 3">
				<h3><xsl:value-of select="@text"/></h3>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 4">
				<h4><xsl:value-of select="@text"/></h4>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 5">
				<h5><xsl:value-of select="@text"/></h5>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 6">
				<h6><xsl:value-of select="@text"/></h6>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 7">
				<h7><xsl:value-of select="@text"/></h7>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 8">
				<h8><xsl:value-of select="@text"/></h8>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 9">
				<h9><xsl:value-of select="@text"/></h9>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="$level = 10">
				<h10><xsl:value-of select="@text"/></h10>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<p><xsl:value-of select="@text"/></p>
				<xsl:apply-templates select="outline">
					<xsl:with-param name="level" select="$level + 1"/>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>


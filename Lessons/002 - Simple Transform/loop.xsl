<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<newBooks>
			<xsl:for-each select="catalog/book">
				<newBook>
					<countNo>
						<xsl:value-of select="position()"/>
					</countNo>
					<title>
						<xsl:value-of select="title"/>
					</title>
				</newBook>
			</xsl:for-each>
		</newBooks>
	</xsl:template>
</xsl:stylesheet>
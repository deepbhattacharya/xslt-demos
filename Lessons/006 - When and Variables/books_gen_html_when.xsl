<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet
   version="2.0" xmlns="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema">

	<xsl:variable name="checkmark" select="'&#x2713;'"/>
	<xsl:variable name="crossmark" select="'&#x2717;'"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Book Catalogue</title>
			</head>
			<link rel="stylesheet" type="text/css" href="../styles/tabular_data.css"/>
			<body>
				<table id="books">
					<thead>
						<tr>
							<th>No#</th>
							<th>Title</th>
							<th>Author</th>
							<th>Genre</th>
							<th>Low Price?</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="catalog/book">
							<xsl:sort select="author"/>
							<tr>
								<td>
									<xsl:value-of select="position()"/>
								</td>
								<td>
									<xsl:value-of select="title"/>
								</td>
								<td>
									<xsl:value-of select="author"/>
								</td>
								<td>
									<xsl:value-of select="genre"/>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="price &lt;= 5">
											<xsl:value-of select="$checkmark"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$crossmark"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
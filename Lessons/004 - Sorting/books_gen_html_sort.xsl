<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet
   version="2.0" xmlns="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<title>Sorted Book Catalogue</title>
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
							<th>Price</th>
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
									<xsl:value-of select="price"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
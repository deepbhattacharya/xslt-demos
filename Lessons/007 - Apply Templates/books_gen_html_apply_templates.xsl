<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet
   version="2.0" xmlns="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema">

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
                            <th>Title</th>
                            <th>Author</th>
                            <th>Genre</th>
                            <th>Price</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="catalog/book">
                            <xsl:sort select="author"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:value-of select="genre"/>
            </td>
            <xsl:apply-templates select="price"/>
            <td>
                <xsl:value-of select="description"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="price">
        <td>
            <xsl:value-of select="."/>
        </td>
    </xsl:template>

</xsl:stylesheet>
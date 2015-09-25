<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet
   version="2.0" xmlns="http://www.w3.org/1999/xhtml"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:key name="author" match="/catalog/book/author" use="."/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Book Catalogue</title>
            </head>
            <link rel="stylesheet" type="text/css" href="../styles/tabular_data.css"/>
            <body>
                <table id="authors">
                    <thead>
                        <tr>
                            <th>Author</th>
                            <th>Titles</th>
                        </tr>
                    </thead>
                    <tbody>

                        <xsl:for-each-group select="/catalog/book/author" group-by="key('author', .)">
                            <tr>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                                <td>
                                    <xsl:call-template name="get_titles_by_author">
                                        <xsl:with-param name="author" select="."/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each-group>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="get_titles_by_author">
        <xsl:param name="author"/>
        <li>
            <xsl:for-each select="/catalog/book[author=$author]">
                <ul>
                    <xsl:value-of select="title"/>
                </ul>
            </xsl:for-each>
        </li>
    </xsl:template>

    <xsl:template match="price">
        <td>
            <xsl:value-of select="."/>
        </td>
    </xsl:template>

</xsl:stylesheet>
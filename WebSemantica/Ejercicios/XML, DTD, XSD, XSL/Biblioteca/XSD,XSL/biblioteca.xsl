<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Biblioteca en Tabla</title>
                <!-- Bootswatch Flatly -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.2/flatly/bootstrap.min.css"/>
                <style>
                    body { margin: 20px; }
                    h1 { text-align: center; margin-bottom: 30px; color: #2c3e50; }
                    table { width: 100%; margin-bottom: 30px; }
                    th, td { padding: 10px; text-align: left; vertical-align: top; }
                    th { background-color: #0275d8; color: white; }
                    tr:nth-child(even) { background-color: #f2f2f2; }
                    .badge { margin-right: 5px; }
                </style>
            </head>
            <body>
                <div class="container">
                    <!-- título de la tabla -->
                    <h1>Mi Biblioteca en Tabla</h1>
                    <table class="table table-bordered table-hover">
                        <tr>
                            <!-- encabezados de la tabla -->
                            <th>Título</th>
                            <th>ISBN</th>
                            <th>Autor</th>
                            <th>Afiliación</th>
                            <th>Resumen</th>
                            <th>Categoría</th>
                            <th>Páginas / Edición</th>
                            <th>Editorial</th>
                            <th>Año de Edición</th>
                        </tr>
                        <!-- recorro cada libro -->
                        <xsl:for-each select="biblioteca/libro">
                            <tr>
                                <!-- muestro título y ISBN -->
                                <td><xsl:value-of select="@titulo"/></td>
                                <td><xsl:value-of select="@isbn"/></td>
                                <!-- muestro autor y fecha de nacimiento -->
                                <td><xsl:value-of select="autor/nombre"/> (<xsl:value-of select="autor/@fechaNac"/>)</td>
                                <!-- muestro afiliación -->
                                <td><xsl:value-of select="autor/@afiliacion"/></td>
                                <!-- muestro resumen -->
                                <td><xsl:value-of select="resumen"/></td>
                                <!-- muestro categoría con badge -->
                                <td><span class="badge bg-info text-dark"><xsl:value-of select="categoria"/></span></td>
                                <!-- muestro páginas y edición -->
                                <td><xsl:value-of select="paginas"/> / <xsl:value-of select="edicion"/></td>
                                <!-- muestro editorial y dirección -->
                                <td><xsl:value-of select="editorial/nombre"/> (<xsl:value-of select="editorial/direccion"/>)</td>
                                <!-- muestro año de edición -->
                                <td><xsl:value-of select="anioedicion"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
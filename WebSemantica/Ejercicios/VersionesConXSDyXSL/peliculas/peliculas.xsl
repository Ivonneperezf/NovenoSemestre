<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Listado de Películas</title>
                <!-- Bootswatch Flatly para estilo más cinematográfico -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.2/flatly/bootstrap.min.css"/>
                <style>
                    body { margin: 20px; background-color: #1c1c1c; color: #f8f9fa; }
                    h1 { text-align: center; margin-bottom: 40px; color: #e74c3c; text-shadow: 2px 2px #000; }
                    .peliculas-container { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; }
                    .card { width: 280px; transition: transform 0.2s, box-shadow 0.2s; background-color: #2c3e50; }
                    .card:hover { transform: scale(1.05); box-shadow: 0 0 15px #e74c3c; }
                    .card-header { font-weight: bold; text-align: center; background-color: #c0392b; color: #fff; }
                    .card-body p { margin: 5px 0; font-size: 0.9rem; }
                    .genero { display: inline-block; margin: 2px 5px 2px 0; padding: 2px 6px; background-color: #f1c40f; border-radius: 4px; font-size: 0.8rem; color: #2c3e50; }
                </style>
            </head>
            <body>
                <div class="container">
                    <!-- título de la página -->
                    <h1>Mi Lista de Películas</h1>

                    <!-- contenedor de todas las películas -->
                    <div class="peliculas-container">
                        <xsl:for-each select="peliculas/pelicula">
                            <!-- tarjeta de cada película -->
                            <div class="card border-light">
                                <div class="card-header">
                                    <xsl:value-of select="@titulo"/>
                                </div>
                                <div class="card-body">
                                    <!-- fecha de estreno -->
                                    <p><b>Estreno:</b> <xsl:value-of select="@fechaEstreno"/></p>
                                    <!-- director -->
                                    <p><b>Director:</b> <xsl:value-of select="director"/></p>
                                    <!-- géneros -->
                                    <p><b>Géneros:</b>
                                        <xsl:for-each select="generos/genero">
                                            <span class="genero"><xsl:value-of select="."/></span>
                                        </xsl:for-each>
                                    </p>
                                    <!-- reparto -->
                                    <p><b>Reparto:</b>
                                        <xsl:for-each select="reparto/actor/nombre">
                                            <xsl:value-of select="."/>
                                            <xsl:if test="position() != last()">, </xsl:if>
                                        </xsl:for-each>
                                    </p>
                                    <!-- resumen corto -->
                                    <p><b>Resumen:</b> <xsl:value-of select="resumen"/></p>
                                    <!-- distribuidora y país -->
                                    <p><b>Distribuidora:</b> <xsl:value-of select="distribuidora"/></p>
                                    <p><b>País de origen:</b> <xsl:value-of select="paisOrigen"/></p>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
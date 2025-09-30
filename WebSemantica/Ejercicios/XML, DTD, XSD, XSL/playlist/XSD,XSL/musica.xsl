<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Mi Playlist</title>
                <!-- Bootswatch Slate -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.2/slate/bootstrap.min.css"/>
                <style>
                    body { margin: 20px; }
                    h1 { text-align: center; margin-bottom: 30px; color: #f8f9fa; }
                    .playlist-container { display: flex; flex-direction: column; gap: 15px; }
                    .card { width: 100%; transition: background-color 0.2s; }
                    .card:hover { background-color: #343a40; }
                    .card-header { font-weight: bold; font-size: 1.2rem; background-color: #6c757d; color: #fff; }
                    .card-body { display: flex; flex-wrap: wrap; gap: 15px; }
                    .card-body div { flex: 1 1 200px; }
                    .tag { display: inline-block; margin: 2px 5px 2px 0; padding: 2px 6px; background-color: #17a2b8; border-radius: 4px; font-size: 0.85rem; color: #fff; }
                    p { margin: 3px 0; }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Mi Playlist</h1>

                    <div class="playlist-container">
                        <!-- recorremos todas las canciones del XML -->
                        <xsl:for-each select="playlist/cancion">
                            <!-- tarjeta para cada canción -->
                            <div class="card border-light">
                                <!-- mostramos el nombre de la canción -->
                                <div class="card-header">
                                    <xsl:value-of select="@nombre"/>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <!-- mostramos datos principales de la canción -->
                                        <p><b>Duración:</b> <xsl:value-of select="@duracion"/></p>
                                        <p><b>Género:</b> <span class="tag"><xsl:value-of select="@genero"/></span></p>
                                        <p><b>Álbum:</b> <xsl:value-of select="@album"/></p>
                                        <p><b>Año:</b> <xsl:value-of select="@aniolanzamiento"/></p>
                                    </div>
                                    <div>
                                        <!-- recorremos los intérpretes -->
                                        <p><b>Intérpretes:</b>
                                            <xsl:for-each select="interpretes/interprete">
                                                <xsl:value-of select="nombre"/>
                                                <xsl:if test="alias"> (<xsl:value-of select="alias"/>)</xsl:if>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each>
                                        </p>
                                        <!-- recorremos los compositores -->
                                        <p><b>Compositores:</b>
                                            <xsl:for-each select="compositores/compositor/nombre">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each>
                                        </p>
                                        <!-- recorremos los letristas -->
                                        <p><b>Letristas:</b>
                                            <xsl:for-each select="letristas/letrista/nombre">
                                                <xsl:value-of select="."/>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>

                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
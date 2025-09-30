<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Mi Recetario</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.2/cosmo/bootstrap.min.css"/>
                <style>
                    body { margin: 20px; }
                    h1 { text-align: center; margin-bottom: 30px; color: #d35400; } /* color naranja */
                    .recetas-container { display: flex; flex-direction: column; gap: 20px; }
                    .card { width: 100%; transition: background-color 0.2s, box-shadow 0.2s; }
                    .card:hover { background-color: #fdf2e9; box-shadow: 0 0 10px #d35400; }
                    .card-header { font-weight: bold; font-size: 1.2rem; background-color: #e67e22; color: #fff; } /* naranja oscuro */
                    .card-body { display: flex; flex-wrap: wrap; gap: 15px; }
                    .card-body div { flex: 1 1 250px; }
                    .tag { display: inline-block; margin: 2px 5px 2px 0; padding: 2px 6px; background-color: #27ae60; border-radius: 4px; font-size: 0.85rem; color: #fff; } /* verde */
                    p { margin: 3px 0; }
                    ul { padding-left: 20px; }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Mi Recetario</h1>

                    <div class="recetas-container">
                        <!-- recorremos todas las recetas del XML -->
                        <xsl:for-each select="recetario/receta">
                            <!-- tarjeta para cada receta -->
                            <div class="card border-light">
                                <!-- mostramos el nombre de la receta -->
                                <div class="card-header">
                                    <xsl:value-of select="@nombre"/>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <!-- mostramos los atributos principales -->
                                        <p><b>Tipo:</b> <xsl:value-of select="@tipo"/></p>
                                        <p><b>Dificultad:</b> <span class="tag"><xsl:value-of select="@dificultad"/></span></p>
                                        <p><b>Tiempo de preparación:</b> <xsl:value-of select="@tiempoPreparacion"/></p>
                                        <p><b>Porciones:</b> <xsl:value-of select="@porciones"/></p>
                                        <p><b>Categoría:</b> <xsl:value-of select="categoria"/></p>
                                        <p><b>Origen:</b> <xsl:value-of select="origen"/></p>
                                    </div>
                                    <div>
                                        <!-- listamos los ingredientes recorriendo el XML -->
                                        <p><b>Ingredientes:</b></p>
                                        <ul>
                                            <xsl:for-each select="ingredientes/ingrediente">
                                                <li>
                                                    <xsl:value-of select="@cantidad"/> <xsl:value-of select="@unidad"/> - <xsl:value-of select="."/>
                                                </li>
                                            </xsl:for-each>
                                        </ul>

                                        <!-- listamos los pasos de preparación -->
                                        <p><b>Preparación:</b></p>
                                        <ol>
                                            <xsl:for-each select="preparacion/paso">
                                                <li>
                                                    <xsl:value-of select="."/>
                                                </li>
                                            </xsl:for-each>
                                        </ol>
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
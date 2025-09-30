<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Árbol Genealógico Simple</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"/>
                <style>
                    /* estilos básicos de la página */
                    body { margin: 20px; background-color: #f8f9fa; }
                    h1 { text-align: center; margin-bottom: 30px; }
                    .generation { margin-bottom: 40px; }
                    .generation h2 { margin-bottom: 15px; color: #333; }
                    .cards-container { display: flex; flex-wrap: wrap; gap: 15px; justify-content: center; }
                    .card { width: 220px; }
                    .card-header { font-weight: bold; text-align: center; }
                    .badge { margin-right: 5px; }
                    .genero-m { color: #0d6efd; font-weight: bold; }
                    .genero-f { color: #dc3545; font-weight: bold; }
                    .card-body p { margin: 4px 0; font-size: 0.9rem; }
                </style>
            </head>
            <body>
                <div class="container">
                    <!-- título principal -->
                    <h1>Mi Árbol Genealógico</h1>

                    <!-- sección de abuelos -->
                    <div class="generation">
                        <h2>Abuelos</h2>
                        <div class="cards-container">
                            <!-- recorro las personas que son abuelos -->
                            <xsl:for-each select="ArbolGenealogico/Persona[@id='AB1' or @id='AB2']">
                                <div class="card border-secondary">
                                    <!-- nombre completo -->
                                    <div class="card-header">
                                        <xsl:value-of select="Nombre"/> <xsl:value-of select="Apellido"/>
                                    </div>
                                    <div class="card-body">
                                        <!-- genero -->
                                        <p><b>Género:</b> 
                                            <xsl:choose>
                                                <xsl:when test="@genero='Masculino'"><span class="genero-m">M</span></xsl:when>
                                                <xsl:otherwise><span class="genero-f">F</span></xsl:otherwise>
                                            </xsl:choose>
                                        </p>
                                        <!-- resto de datos -->
                                        <p><b>Fecha Nac.:</b> <xsl:value-of select="@fechaNacimiento"/></p>
                                        <p><b>Tel:</b> <xsl:value-of select="@telefono"/></p>
                                        <p><b>Correo:</b> <xsl:value-of select="@correo"/></p>
                                        <p><b>Dirección:</b> <xsl:value-of select="Direccion/Calle"/>, 
                                            <xsl:value-of select="Direccion/Ciudad"/>, 
                                            <xsl:value-of select="Direccion/Pais"/>
                                        </p>
                                        <p><b>Ocupación:</b> <xsl:value-of select="Ocupacion"/></p>
                                        <p><b>Estudios:</b> <xsl:value-of select="Estudios"/></p>
                                        <p><b>Nota:</b> <xsl:value-of select="Nota"/></p>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>

                    <!-- sección de padres -->
                    <div class="generation">
                        <h2>Padres</h2>
                        <div class="cards-container">
                            <!-- recorro las personas que son padres -->
                            <xsl:for-each select="ArbolGenealogico/Persona[@id='f1' or @id='f2']">
                                <div class="card border-primary">
                                    <div class="card-header">
                                        <xsl:value-of select="Nombre"/> <xsl:value-of select="Apellido"/>
                                    </div>
                                    <div class="card-body">
                                        <!-- genero -->
                                        <p><b>Género:</b> 
                                            <xsl:choose>
                                                <xsl:when test="@genero='Masculino'"><span class="genero-m">M</span></xsl:when>
                                                <xsl:otherwise><span class="genero-f">F</span></xsl:otherwise>
                                            </xsl:choose>
                                        </p>
                                        <!-- resto de datos -->
                                        <p><b>Fecha Nac.:</b> <xsl:value-of select="@fechaNacimiento"/></p>
                                        <p><b>Tel:</b> <xsl:value-of select="@telefono"/></p>
                                        <p><b>Correo:</b> <xsl:value-of select="@correo"/></p>
                                        <p><b>Dirección:</b> <xsl:value-of select="Direccion/Calle"/>, 
                                            <xsl:value-of select="Direccion/Ciudad"/>, 
                                            <xsl:value-of select="Direccion/Pais"/>
                                        </p>
                                        <p><b>Ocupación:</b> <xsl:value-of select="Ocupacion"/></p>
                                        <p><b>Estudios:</b> <xsl:value-of select="Estudios"/></p>
                                        <p><b>Nota:</b> <xsl:value-of select="Nota"/></p>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>

                    <!-- sección de hijos -->
                    <div class="generation">
                        <h2>Hijos</h2>
                        <div class="cards-container">
                            <!-- recorro las personas que son hijos -->
                            <xsl:for-each select="ArbolGenealogico/Persona[@id='f3' or @id='f4' or @id='f5' or @id='f6']">
                                <div class="card border-success">
                                    <div class="card-header">
                                        <xsl:value-of select="Nombre"/> <xsl:value-of select="Apellido"/>
                                    </div>
                                    <div class="card-body">
                                        <!-- genero -->
                                        <p><b>Género:</b> 
                                            <xsl:choose>
                                                <xsl:when test="@genero='Masculino'"><span class="genero-m">M</span></xsl:when>
                                                <xsl:otherwise><span class="genero-f">F</span></xsl:otherwise>
                                            </xsl:choose>
                                        </p>
                                        <!-- resto de datos -->
                                        <p><b>Fecha Nac.:</b> <xsl:value-of select="@fechaNacimiento"/></p>
                                        <p><b>Tel:</b> <xsl:value-of select="@telefono"/></p>
                                        <p><b>Correo:</b> <xsl:value-of select="@correo"/></p>
                                        <p><b>Dirección:</b> <xsl:value-of select="Direccion/Calle"/>, 
                                            <xsl:value-of select="Direccion/Ciudad"/>, 
                                            <xsl:value-of select="Direccion/Pais"/>
                                        </p>
                                        <p><b>Ocupación:</b> <xsl:value-of select="Ocupacion"/></p>
                                        <p><b>Estudios:</b> <xsl:value-of select="Estudios"/></p>
                                        <p><b>Nota:</b> <xsl:value-of select="Nota"/></p>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>

                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
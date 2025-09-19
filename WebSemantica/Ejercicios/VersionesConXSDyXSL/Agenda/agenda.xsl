<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- salida como HTML -->
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Agenda de Contactos</title>
                <!-- cargo tema de Bootswatch -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.2/cerulean/bootstrap.min.css"/>
                <style>
                    <!-- agrego algunos estilos -->
                    body { margin: 20px; }
                    h1 { text-align: center; margin-bottom: 30px; }
                    .card { margin-bottom: 20px; }
                    .card p { margin: 0; }
                    .contact-info b { width: 80px; display: inline-block; }
                </style>
            </head>
            <body>
                <div class="container">
                    <!-- título principal -->
                    <h1>Agenda de Contactos</h1>
                    <div class="row">
                        <!-- recorro cada contacto -->
                        <xsl:for-each select="agenda/contacto">
                            <div class="col-md-6 col-lg-4">
                                <div class="card">
                                    <div class="card-header">
                                        <!-- muestro nombre y apellido -->
                                        <strong><xsl:value-of select="@nombre"/> <xsl:value-of select="@apellido"/></strong>
                                        <!-- muestro nickname si existe -->
                                        <xsl:if test="@nickname"> (<xsl:value-of select="@nickname"/>)</xsl:if>
                                    </div>
                                    <div class="card-body">
                                        <!-- muestro grupo -->
                                        <p><b>Grupo:</b> <xsl:value-of select="@grupo"/></p>
                                        <!-- muestro fecha de nacimiento si existe -->
                                        <xsl:if test="@fechaNacimiento">
                                            <p><b>Fecha Nac.:</b> <xsl:value-of select="@fechaNacimiento"/></p>
                                        </xsl:if>

                                        <!-- muestro todos los teléfonos -->
                                        <xsl:if test="telefono">
                                            <p><b>Teléfonos:</b></p>
                                            <xsl:for-each select="telefono">
                                                <p><b><xsl:value-of select="@tipo"/>:</b> <xsl:value-of select="."/></p>
                                            </xsl:for-each>
                                        </xsl:if>

                                        <!-- muestro todos los correos -->
                                        <xsl:if test="correo">
                                            <p><b>Correos:</b></p>
                                            <xsl:for-each select="correo">
                                                <p><b><xsl:value-of select="@tipo"/>:</b> <xsl:value-of select="."/></p>
                                            </xsl:for-each>
                                        </xsl:if>

                                        <!-- muestro dirección si existe -->
                                        <xsl:if test="direccion">
                                            <p><b>Dirección:</b>
                                                <xsl:value-of select="direccion/calle"/>, 
                                                <xsl:value-of select="direccion/ciudad"/>, 
                                                <xsl:value-of select="direccion/estado"/>, 
                                                <xsl:value-of select="direccion/codigoPostal"/>, 
                                                <xsl:value-of select="direccion/pais"/>
                                            </p>
                                        </xsl:if>
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
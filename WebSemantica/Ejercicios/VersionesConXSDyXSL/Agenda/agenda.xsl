<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:a="http://www.agenda.com"
    exclude-result-prefixes="a">

    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Agenda de Contactos</title>
                <!-- Bootstrap CDN -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
            </head>
            <body class="bg-light">
                <div class="container py-4">
                    <h1 class="mb-4 text-center">Agenda de Contactos</h1>

                    <!-- Iterar sobre los contactos usando el namespace -->
                    <xsl:for-each select="a:agenda/a:contacto">
                        <div class="card mb-3">
                            <div class="card-header bg-primary text-white">
                                <strong>
                                    <xsl:value-of select="@nombre"/> <xsl:value-of select="@apellido"/>
                                </strong>
                                <xsl:if test="@nickname"> (<xsl:value-of select="@nickname"/>)</xsl:if>
                                - <em><xsl:value-of select="@grupo"/></em>
                            </div>
                            <div class="card-body">
                                <p>
                                    <strong>Fecha de nacimiento:</strong>
                                    <xsl:choose>
                                        <xsl:when test="@fechaNacimiento">
                                            <xsl:value-of select="@fechaNacimiento"/>
                                        </xsl:when>
                                        <xsl:otherwise>No especificada</xsl:otherwise>
                                    </xsl:choose>
                                </p>

                                <p><strong>Teléfonos:</strong>
                                    <xsl:for-each select="a:telefono">
                                        <span class="badge bg-info text-dark me-1">
                                            <xsl:value-of select="@tipo"/>: <xsl:value-of select="."/>
                                        </span>
                                    </xsl:for-each>
                                </p>

                                <p><strong>Correos:</strong>
                                    <xsl:for-each select="a:correo">
                                        <span class="badge bg-success me-1">
                                            <xsl:value-of select="@tipo"/>: <xsl:value-of select="."/>
                                        </span>
                                    </xsl:for-each>
                                </p>

                                <xsl:if test="a:direccion">
                                    <p><strong>Dirección:</strong><br/>
                                        <xsl:value-of select="a:direccion/a:calle"/>, 
                                        <xsl:value-of select="a:direccion/a:ciudad"/>, 
                                        <xsl:value-of select="a:direccion/a:estado"/>, 
                                        <xsl:value-of select="a:direccion/a:codigoPostal"/>, 
                                        <xsl:value-of select="a:direccion/a:pais"/>
                                    </p>
                                </xsl:if>
                            </div>
                        </div>
                    </xsl:for-each>

                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
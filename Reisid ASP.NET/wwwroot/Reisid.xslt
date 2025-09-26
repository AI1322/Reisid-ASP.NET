<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<style>
					table, th, td {
					border: 1px solid black;
					border-collapse: collapse;
					padding: 3px;
					}
				</style>
			</head>
			<body>
				<table>
					<tr>
						<th>ID</th>
						<th>Reisi number</th>
						<th>Lennufirma</th>
						<th>Sihtkoht</th>
						<th>Algus aeg</th>
						<th>Lõppu aeg</th>
						<th>Valjumine</th>
						<th>Saabumine</th>
						<th>Hind</th>
					</tr>
					<xsl:for-each select="/Reisid/Reis">
						<tr>
							<td>
								<xsl:value-of select="@id"/>
							</td>
							<td>
								<xsl:value-of select="@reisi_number"/>
							</td>
							<td>
								<xsl:value-of select="Lennufirma"/>
							</td>
							<td>
								<xsl:value-of select="Sihtkoht"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/@algus_aeg"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/@loppu_aev"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/Valjumine"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/Saabumine"/>
							</td>
							<td>
								<xsl:value-of select="Hind/@value"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

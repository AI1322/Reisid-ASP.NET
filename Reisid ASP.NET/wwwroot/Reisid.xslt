<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/Reisid">
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
				<xsl:variable name="sum" select="sum(Reis/Transport/@value)"/>
				<xsl:variable name="count" select="count(Reis)"/>
				<h2>
					Keskmine transpordi hind: <xsl:value-of select="$sum div $count"/> €
				</h2>
				<table>
					<tr>
						<th>ID</th>
						<th>Reisi number</th>
						<th>Tüüp</th>
						<th>Firma</th>
						<th>Sihtkoht</th>
						<th>Kestus</th>
						<th>Väljumine</th>
						<th>Saabumine</th>
						<th>Hind</th>
						<th>Kogumaksumus</th>
					</tr>
					<xsl:for-each select="Reis">
						<xsl:sort select="number(Hind/@value)" data-type="number" order="ascending"/>
						<xsl:variable name="pos" select="position()"/>
						<xsl:variable name="r" select="$pos * 40 mod 256"/>
						<xsl:variable name="g" select="$pos * 80 mod 256"/>
						<xsl:variable name="b" select="$pos * 120 mod 256"/>
						<tr>
							<xsl:attribute name="style">
								<xsl:text>background-color:rgb(</xsl:text>
								<xsl:value-of select="$r"/>
								<xsl:text>,</xsl:text>
								<xsl:value-of select="$g"/>
								<xsl:text>,</xsl:text>
								<xsl:value-of select="$b"/>
								<xsl:text>);</xsl:text>
							</xsl:attribute>
							<xsl:if test="Hind/@value &gt; 50">
								<xsl:attribute name="style">background-color:lightcoral;</xsl:attribute>
							</xsl:if>
							<td>
								<xsl:value-of select="@id"/>
							</td>
							<td>
								<xsl:value-of select="@reisi_number"/>
							</td>
							<td>
								<xsl:value-of select="Transport/@tuup"/>
							</td>
							<td>
								<xsl:value-of select="Firma"/>
							</td>
							<td>
								<xsl:value-of select="Sihtkoht"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/@kestus"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/Valjumine"/>
							</td>
							<td>
								<xsl:value-of select="Lennujaamad/Saabumine"/>
							</td>
							<td>
								<xsl:value-of select="Hind/@value"/> €
							</td>
							<td>
								<xsl:variable name="kogumaksumus"
								select="number(Transport/@value) 
										+ number(Majutus/@value) 
										+ number(Ekskursioonid/@value) 
										+ number(MuudKulud/@value)"/>
								<xsl:value-of select="$kogumaksumus"/> €
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
		<xsl:for-each select="Reis">
			<xsl:sort select="number(Hind/@value)" data-type="number" order="descending"/>
			<h5>
				<xsl:value-of select="Sihtkoht"/>
			</h5>
			<ul>
				<li>ID: <xsl:value-of select="@id"/></li>
				<li>Reisi number: <xsl:value-of select="@reisi_number"/></li>
				<li>Tüüp: <xsl:value-of select="Transport/@tuup"/> </li>
				<li>Firma: <xsl:value-of select="Firma"/></li>
				<li>Sihtkoht: <xsl:value-of select="Sihtkoht"/></li>
				<li>Kestus: <xsl:value-of select="Lennujaamad/@kestus"/></li>
				<li>
					Väljumine:
					<span style="background-color:yellow">
						<xsl:value-of select="Lennujaamad/Valjumine"/>
					</span>
				</li>
				<li>
					Saabumine:
					<span style="background-color:yellow">
						<xsl:value-of select="Lennujaamad/Saabumine"/>
					</span>
				</li>
				<li>
					Hind:
					<xsl:choose>
						<xsl:when test="Hind/@value &lt; 5">
							<span style="background-color:green; font-weight:bold">
								<xsl:value-of select="Hind/@value"/> €
							</span>
						</xsl:when>
						<xsl:otherwise>
							<span style="background-color:red; font-weight:bold">
								<xsl:value-of select="Hind/@value"/> €
							</span>
						</xsl:otherwise>
					</xsl:choose>
				</li>
				<li>
					Muu maksud:
					<ul>
						<li>
							Transpordi hind: <xsl:value-of select="Transport/@value"/> €
						</li>
						<li>
							Majutus: <xsl:value-of select="Majutus/@value"/> €
						</li>
						<li>
							Ekskursioon: <xsl:value-of select="Ekskursioonid/@value"/> €
						</li>
						<li>
							Muu: <xsl:value-of select="MuudKulud/@value"/> €
						</li>
					</ul>
				</li>
				<xsl:variable name="kogumaksumus"
			              select="number(Transport/@value) 
			                    + number(Majutus/@value) 
			                    + number(Ekskursioonid/@value) 
			                    + number(MuudKulud/@value)"/>
				<li>
					Kogumaksumus: <xsl:value-of select="$kogumaksumus"/> €
				</li>
			</ul>
		</xsl:for-each>
		
	</xsl:template>
</xsl:stylesheet>

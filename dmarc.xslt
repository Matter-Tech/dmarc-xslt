<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html style="font-family:Consolas;font-size:12pt;background:#1a1c20;color:#f3e9df;">
      <body>
        <h1>DMARC Report</h1>

        <h2>Report metadata</h2>
        <table border="1">
          <tr>
            <th style="padding: 8px">Organization</th>
            <th style="padding: 8px">Email</th>
            <th style="padding: 8px">Contact info</th>
            <th style="padding: 8px">Report ID</th>
            <th style="padding: 8px">Range</th>
          </tr>

          <tr style="padding: 8px">
            <td style="padding: 8px">
              <xsl:value-of select="feedback/report_metadata/org_name"/>
            </td>

            <td style="padding: 8px">
              <xsl:value-of select="feedback/report_metadata/email"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/report_metadata/extra_contact_info"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/report_metadata/report_id"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/report_metadata/date_range/begin"/>
              -
              <xsl:value-of select="feedback/report_metadata/date_range/end"/>

            </td>
          </tr>
        </table>

        <h2>Policy</h2>
        <table border="1">
          <tr>
            <th style="padding: 8px">Domain</th>
            <th style="padding: 8px">DKIM Alignment</th>
            <th style="padding: 8px">SPF Alignment</th>
            <th style="padding: 8px">Domain policy</th>
            <th style="padding: 8px">Subdomain policy</th>
            <th style="padding: 8px">Percentage</th>
          </tr>

          <tr style="padding: 8px">
            <td style="padding: 8px">
              <xsl:value-of select="feedback/policy_published/domain"/>
            </td>

            <td style="padding: 8px">
              <xsl:value-of select="feedback/policy_published/adkim"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/policy_published/aspf"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/policy_published/p"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/policy_published/sp"/>
            </td>
            <td style="padding: 8px">
              <xsl:value-of select="feedback/policy_published/pct"/>
            </td>
          </tr>
        </table>

        <h2>Records</h2>
        <table border="1">
          <tr>
            <th style="padding: 8px">Source IP</th>
            <th style="padding: 8px">Count</th>
            <th style="padding: 8px">Disposition</th>
            <th style="padding: 8px">DKIM</th>
            <th style="padding: 8px">SPF</th>
            <th style="padding: 8px">Header from</th>
            <th style="padding: 8px">SPF domain (result)</th>
            <th style="padding: 8px">DKIM domain (result)</th>
            <th style="padding: 8px">DKIM selector</th>
          </tr>
          <xsl:for-each select="feedback/record">
            <tr>
              <td style="padding: 8px">
                <xsl:value-of select="row/source_ip"/>
              </td>

              <td style="padding: 8px">
                <xsl:value-of select="row/count"/>
              </td>

              <td style="padding: 8px">
                <xsl:value-of select="row/policy_evaluated/disposition"/>
              </td>


              <td style="padding: 8px" align="center">
                <xsl:choose>
                  <xsl:when test="row/policy_evaluated/dkim='pass'">
                    ✔
                  </xsl:when>
                  <xsl:otherwise>
                    ❌
                  </xsl:otherwise>
                </xsl:choose>
              </td>

              <td style="padding: 8px" align="center">
                <xsl:choose>
                  <xsl:when test="row/policy_evaluated/spf='pass'">
                    ✔
                  </xsl:when>
                  <xsl:otherwise>
                    ❌
                  </xsl:otherwise>
                </xsl:choose>
              </td>

              <td style="padding: 8px">
                <xsl:value-of select="identifiers/header_from"/>
              </td>

              <td style="padding: 8px">
                <xsl:choose>
                  <xsl:when test="auth_results/spf/result='pass'">
                    ✔
                  </xsl:when>
                  <xsl:otherwise>
                    ❌
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="auth_results/spf/domain"/>
              </td>

              <td style="padding: 8px">
                <xsl:choose>
                  <xsl:when test="auth_results/dkim/result='pass'">
                    ✔
                  </xsl:when>
                  <xsl:otherwise>
                    ❌
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="auth_results/dkim/domain"/>
              </td>
              <td style="padding: 8px">
                <xsl:value-of select="auth_results/dkim/selector"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>


<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9">

  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Sitemap — Me vs. Collector</title>
        <style>
          :root {
            --charcoal:   #1c1c1e;
            --charcoal-2: #2a2a2d;
            --charcoal-3: #3a3a3e;
            --amber:      #e8a020;
            --cream:      #f5f0e8;
            --text-main:  #f0ece4;
            --text-muted: #a8a094;
            --border:     rgba(232,160,32,0.2);
          }
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            background: var(--charcoal);
            color: var(--text-main);
            font-family: 'DM Sans', -apple-system, sans-serif;
            font-size: 15px; line-height: 1.7;
          }
          header {
            background: var(--charcoal-2);
            border-bottom: 1px solid var(--border);
            padding: 1.2rem 2rem;
            display: flex; align-items: center; justify-content: space-between;
          }
          .logo {
            font-family: Georgia, serif;
            font-size: 1.15rem; font-weight: 700;
            color: var(--amber); text-decoration: none;
          }
          .back-link {
            font-size: .83rem; color: var(--text-muted);
            text-decoration: none;
          }
          .back-link:hover { color: var(--amber); }
          main { max-width: 860px; margin: 0 auto; padding: 2.5rem 1.5rem 4rem; }
          h1 {
            font-family: Georgia, serif;
            font-size: 1.8rem; font-weight: 700;
            color: var(--cream); margin-bottom: .4rem;
          }
          .meta {
            font-size: .82rem; color: var(--text-muted);
            margin-bottom: 2.5rem;
          }
          .meta strong { color: var(--amber); }
          table {
            width: 100%; border-collapse: collapse;
            font-size: .88rem;
          }
          thead { background: var(--charcoal-3); }
          th {
            padding: .75rem 1rem; text-align: left;
            font-size: .72rem; font-weight: 700;
            letter-spacing: .08em; text-transform: uppercase;
            color: var(--amber);
            border-bottom: 2px solid var(--border);
          }
          td {
            padding: .7rem 1rem;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            color: var(--text-muted); vertical-align: middle;
          }
          td a { color: var(--amber); text-decoration: none; word-break: break-all; }
          td a:hover { text-decoration: underline; }
          tr:hover td { background: rgba(232,160,32,0.03); }
          .priority-high   { color: #4caf7d; font-weight: 600; }
          .priority-medium { color: var(--amber); font-weight: 600; }
          .priority-low    { color: var(--text-muted); }
          footer {
            text-align: center; margin-top: 3rem;
            font-size: .78rem; color: var(--charcoal-3);
            border-top: 1px solid var(--border); padding-top: 1.5rem;
          }
        </style>
      </head>
      <body>
        <header>
          <a href="/" class="logo">Me vs. Collector</a>
          <a href="/" class="back-link">← Back to site</a>
        </header>
        <main>
          <h1>XML Sitemap</h1>
          <p class="meta">
            <strong><xsl:value-of select="count(sm:urlset/sm:url)"/></strong> URLs indexed ·
            Submit to Google Search Console at
            <strong>https://mevscollector.com/sitemap.xml</strong>
          </p>
          <table>
            <thead>
              <tr>
                <th>URL</th>
                <th>Last Modified</th>
                <th>Change Freq</th>
                <th>Priority</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sm:urlset/sm:url">
                <xsl:sort select="sm:priority" data-type="number" order="descending"/>
                <tr>
                  <td>
                    <a href="{sm:loc}">
                      <xsl:value-of select="sm:loc"/>
                    </a>
                  </td>
                  <td><xsl:value-of select="sm:lastmod"/></td>
                  <td><xsl:value-of select="sm:changefreq"/></td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="sm:priority >= 0.9">
                        <span class="priority-high"><xsl:value-of select="sm:priority"/></span>
                      </xsl:when>
                      <xsl:when test="sm:priority >= 0.7">
                        <span class="priority-medium"><xsl:value-of select="sm:priority"/></span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="priority-low"><xsl:value-of select="sm:priority"/></span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
          <footer>
            Generated for mevscollector.com · sitemap.xml ·
            Schema: sitemaps.org/schemas/sitemap/0.9
          </footer>
        </main>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>

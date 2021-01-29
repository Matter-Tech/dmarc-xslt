dmarc-xslt
---

Analyse DMARC aggregate reports using XSLT.

How to use
---
In an XML report file, add a reference to dmarc.xslt, e.g. like so:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<?xml-stylesheet type="text/xsl" href="https://raw.githubusercontent.com/Matter-Tech/dmarc-xslt/master/dmarc.xslt" ?>

<feedback>
  Here be reports
</feedback>
```
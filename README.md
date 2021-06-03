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

Script
---
Also provided is [a script](https://github.com/Matter-Tech/dmarc-xslt/blob/master/extract-reports.sh), which extracts all archives (.zip and .gz) in the current working directory, and inserts the stylesheet.

```
$ ls
extract-reports.sh  'google.com!example.org!1622592000!1622678399.zip'

$ ./extract-reports.sh
...

$ ls
extract-reports.sh  'google.com!example.org!1622592000!1622678399.xml'  'google.com!example.org!1622592000!1622678399.zip'

$ cat 'google.com!example.org!1622592000!1622678399.xml'
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="https://raw.githubusercontent.com/Matter-Tech/dmarc-xslt/master/dmarc.xslt" ?>
<feedback>
  <report_metadata>
    <org_name>google.com</org_name>
    <email>noreply-dmarc-support@google.com</email>
...
```

# CreateLocalDevelopmentCertificates

**Warning: no longer useable as modern browsers require Subject Alternative Names to be specified, and [makecert doesn't support this](https://stackoverflow.com/questions/6383054/add-or-create-subject-alternative-name-field-to-self-signed-certificate-using/43670781). 

Creates a Root CA in your machine's Trusted Root Certification Authorities store and a wildcard SSL certificate trusted by the Root CA for use when testing with SSL locally. Not for production use!

Edit these lines in `CreateCAAndWildcardCertificate.ps1` to the values you require:

```powershell
$wildcardCertificateDomain = "*.local-dev.com"
$rootCAName = "Local Development Root CA"
```

Run `CreateCAAndWildcardCertificate.ps1` as Administrator

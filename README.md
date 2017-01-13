# CreateLocalDevelopmentCertificates

Creates a Root CA in your machine's Trusted Root Certification Authorities store and a wildcard SSL certificate trusted by the Root CA for use when testing with SSL locally. Not for production use!

1. Edit these lines in `CreateCAAndWildcardCertificate.ps1` to the values you require:

$wildcardCertificateDomain = "*.local-dev.com"
$rootCAName = "Local Development Root CA"

2. Run `CreateCAAndWildcardCertificate.ps1` as Administrator

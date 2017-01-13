#Requires -RunAsAdministrator

# Based on:
# http://www.virtues.it/2015/08/howto-create-selfsigned-certificates-with-makecert/
# http://www.mikeobrien.net/blog/creating-self-signed-wildcard

$wildcardCertificateDomain = "*.local-dev.com"
$rootCAName = "Local Development Root CA"

# Create a self-signed Root CA certificate
# -r : Creates a self-signed certificate.
# -pe : Marks the generated private key as exportable. This allows the private key to be included in the certificate.
# -n : Specifies the subject's certificate name. This name must conform to the X.500 standard. The simplest method is to specify the name in double quotes, preceded by CN=; for example, -n "CN=myName".
# -a : Specifies the signature algorithm. algorithm must be md5, sha1 (the default), sha256, sha384, or sha512.
# -sky : Specifies the subject's key type, which must be one of the following: signature (which indicates that the key is used for a digital signature), exchange (which indicates that the key is used for key encryption and key exchange), or an integer that represents a provider type. By default, you can pass 1 for an exchange key or 2 for a signature key.
# -cy : Specifies the certificate type. Valid values are end for end-entity and authority for certification authority.
# -ss : Specifies the subject's certificate store name that stores the output certificate.
# -sr : Specifies the subject's certificate store location. location can be either currentuser (the default) or localmachine.
# -len : Specifies the generated key length, in bits.
# -m : Specifies the duration, in months, of the certificate validity period.
./makecert -r -pe -n "CN=$rootCAName" -a sha256 -sky signature -cy authority -ss root -sr localmachine -len 2048 -m 12


# Create a self-signed wildcard certificate using the Root CA certificate
# -pe : Marks the generated private key as exportable. This allows the private key to be included in the certificate.
# -n : Specifies the subject's certificate name. This name must conform to the X.500 standard. The simplest method is to specify the name in double quotes, preceded by CN=; for example, -n "CN=myName".
# -in : Specifies the issuer's certificate common name.
# -is : Specifies the issuer's certificate store name.
# -a : Specifies the signature algorithm. algorithm must be md5, sha1 (the default), sha256, sha384, or sha512.
# -len : Specifies the generated key length, in bits.
# -sky : Specifies the subject's key type, which must be one of the following: signature (which indicates that the key is used for a digital signature), exchange (which indicates that the key is used for key encryption and key exchange), or an integer that represents a provider type. By default, you can pass 1 for an exchange key or 2 for a signature key.
# -cy : Specifies the certificate type. Valid values are end for end-entity and authority for certification authority.
# -eku : Inserts a list of comma-separated, enhanced key usage object identifiers (OIDs) into the certificate. The Server Authentication OID is 1.3.6.1.5.5.7.3.1
# -ss : Specifies the subject's certificate store name that stores the output certificate.
# -sr : Specifies the subject's certificate store location. location can be either currentuser (the default) or localmachine.
# -m : Specifies the duration, in months, of the certificate validity period.
./makecert -pe -n "CN=$wildcardCertificateDomain" -in "$rootCAName" -is root -a sha256 -len 2048 -sky exchange -cy end -eku 1.3.6.1.5.5.7.3.1 -ss my -sr localmachine -m 12
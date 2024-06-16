exit 1

openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 > ../tls-ca-keys/i_myl7_org.key
openssl req -new -key ../tls-ca-keys/i_myl7_org.key -reqexts san -config <(cat /etc/ssl/openssl.cnf <(printf "\n[san]\nsubjectAltName=DNS:i.myl7.org,DNS:*.i.myl7.org")) > i_myl7_org.csr
: '
Country Name (2 letter code) [AU]:.
State or Province Name (full name) [Some-State]:.
Locality Name (eg, city) []:.
Organization Name (eg, company) [Internet Widgits Pty Ltd]:myl7
Organizational Unit Name (eg, section) []:i.myl7.org
Common Name (e.g. server FQDN or YOUR name) []:i.myl7.org
Email Address []:myl@myl.moe

A challenge password []:
An optional company name []:
'
openssl x509 -req -in i_myl7_org.csr -CA ca.pem -CAkey ../tls-ca-keys/ca.key -days 3650 -copy_extensions copy > i_myl7_org.pem

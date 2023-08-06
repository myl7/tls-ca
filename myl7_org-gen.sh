exit 1

openssl genpkey -algorithm ed25519 > ../ca-priv/myl7_org.key
openssl req -new -key ../ca-priv/myl7_org.key -reqexts san -config <(cat /etc/ssl/openssl.cnf <(printf "\n[san]\nsubjectAltName=DNS:myl7.org,DNS:*.myl7.org")) > myl7_org.csr
: '
Country Name (2 letter code) [AU]:.
State or Province Name (full name) [Some-State]:.
Locality Name (eg, city) []:.
Organization Name (eg, company) [Internet Widgits Pty Ltd]:myl7
Organizational Unit Name (eg, section) []:myl7.org
Common Name (e.g. server FQDN or YOUR name) []:myl7.org
Email Address []:myl@myl.moe

A challenge password []:
An optional company name []:
'
openssl x509 -req -in myl7_org.csr -CA ca.pem -CAkey ../ca-priv/ca.key -days 3650 > myl7_org.pem

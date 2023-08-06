exit 1

openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 > ../ca-priv/myl_moe.key
openssl req -new -key ../ca-priv/myl_moe.key -reqexts san -config <(cat /etc/ssl/openssl.cnf <(printf "\n[san]\nsubjectAltName=DNS:myl.moe,DNS:*.myl.moe")) > myl_moe.csr
: '
Country Name (2 letter code) [AU]:.
State or Province Name (full name) [Some-State]:.
Locality Name (eg, city) []:.
Organization Name (eg, company) [Internet Widgits Pty Ltd]:myl7
Organizational Unit Name (eg, section) []:myl.moe
Common Name (e.g. server FQDN or YOUR name) []:myl.moe
Email Address []:myl@myl.moe

A challenge password []:
An optional company name []:
'
openssl x509 -req -in myl_moe.csr -CA ca.pem -CAkey ../ca-priv/ca.key -days 3650 -copy_extensions copy > myl_moe.pem

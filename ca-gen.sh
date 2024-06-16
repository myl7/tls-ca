exit 1

openssl genpkey -algorithm ec -pkeyopt ec_paramgen_curve:P-256 > ../tls-ca-keys/ca.key
openssl req -x509 -key ../tls-ca-keys/ca.key -days 3650 > ca.pem
: '
Country Name (2 letter code) [AU]:.
State or Province Name (full name) [Some-State]:.
Locality Name (eg, city) []:.
Organization Name (eg, company) [Internet Widgits Pty Ltd]:myl7
Organizational Unit Name (eg, section) []:.
Common Name (e.g. server FQDN or YOUR name) []:myl7
Email Address []:myl@myl.moe
'

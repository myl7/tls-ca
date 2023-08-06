exit 1

openssl genpkey -algorithm ed25519 > ../ca-priv/ca.key
openssl req -x509 -key ../ca-priv/ca.key -days 3650 > ca.pem
: '
Country Name (2 letter code) [AU]:.
State or Province Name (full name) [Some-State]:.
Locality Name (eg, city) []:.
Organization Name (eg, company) [Internet Widgits Pty Ltd]:myl7
Organizational Unit Name (eg, section) []:.
Common Name (e.g. server FQDN or YOUR name) []:myl7
Email Address []:myl@myl.moe
'

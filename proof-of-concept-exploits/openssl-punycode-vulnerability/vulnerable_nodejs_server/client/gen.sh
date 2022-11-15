rm -rf index.txt serial private certs
touch index.txt
echo 01 > serial
mkdir private certs

openssl="$PWD/openssl/apps/openssl"

#########################
# Create CA certificate #
#########################

# Generate private key for CA certificate
openssl genrsa -out private/ca.key.pem 2048
# Generate CA certificate
openssl req -new -x509 -days 3650 -config configs/ca.cnf -key private/ca.key.pem -out certs/cacert.pem

#############################
# Create Client certificate #
#############################

# Generate private key for client certificate
openssl genrsa -out certs/client.key.pem 2048
# Generate CSR for client certificate
openssl req -new -key certs/client.key.pem -config configs/client.cnf -out certs/client.csr
# Create client certificate
openssl ca -config configs/ca.cnf -extfile configs/client_ext.cnf -days 1650 -notext -batch -in certs/client.csr -out certs/client.cert.pem

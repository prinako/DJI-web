#!/bin/sh

CERT_DIR="/etc/nginx/ssl"
KEY_FILE="${CERT_DIR}/localhost.key"
CRT_FILE="${CERT_DIR}/localhost.crt"

# Check if certificate and key files exist
if [ ! -f "$KEY_FILE" ] || [ ! -f "$CRT_FILE" ]; then
    echo "Generating self-signed certificate for Nginx..."

    # Ensure the SSL directory exists
    mkdir -p "$CERT_DIR"

    # Generate self-signed certificate and key
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_FILE" \
    -out "$CRT_FILE" \
    -subj "/C=US/ST=State/L=City/O=Local Development/CN=localhost"
    
    echo "Certificate generation complete."
fi

# Execute the Nginx startup command
exec nginx -g "daemon off;"
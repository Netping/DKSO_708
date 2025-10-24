#!/bin/sh

# Normalize serial number to 16 hex-digits
normalize_serial() {
    local serial="$1"
    # Delete all non hex-symbols (only 0-9, A-F, a-f)
    serial=$(echo "$serial" | tr -dc '0-9A-Fa-f')
    # Add left zero to 16 symbols
    while [ ${#serial} -lt 16 ]; do
        serial="0$serial"
    done
    # Cut serial number to 16 symbols (if more)
    serial=$(echo "$serial" | head -c 16)
    echo "$serial"
}

# Uppercase function
to_uppercase() {
    echo "$1" | tr 'a-f' 'A-F'
}

serial_number=$(normalize_serial "$1")

# Check if serial number is empty
if [[ -z "$serial_number" ]]; then
    echo "Error: serial number not found or empty!" >&2
    exit 1
fi

# Generate SHA-256 hash

hash_hex=$(echo -n "$serial_number" | sha256sum | awk '{print $1}')
    
# Extract 4 bytes (first 8 hex-digits)
b1=$(echo "$hash_hex" | cut -c1-2)
b2=$(echo "$hash_hex" | cut -c3-4)
b3=$(echo "$hash_hex" | cut -c5-6)
b4=$(echo "$hash_hex" | cut -c7-8)

# Generate first MAC in upper case
mac1="00:A3:$(to_uppercase "$b1"):$(to_uppercase "$b2"):$(to_uppercase "$b3"):$(to_uppercase "$b4")"
    
# Compute next MAC by increment las byte
b4_int=$(printf "%d" "0x$b4")
b4_next_int=$(( (b4_int + 1) % 256 ))
b4_next_hex=$(printf "%02X" "$b4_next_int")

b3_hex="$b3"
if [ "$b4_next_int" -eq 0 ]; then
    b3_int=$(printf "%d" "0x$b3")
    b3_next_int=$(( (b3_int + 1) % 256 ))
    b3_hex=$(printf "%02X" "$b3_next_int")
fi

mac2="00:A3:$(to_uppercase "$b1"):$(to_uppercase "$b2"):$(to_uppercase "$b3_hex"):$b4_next_hex"
    
# Write MAC addreses to file
touch /etc/macaddr
echo "$mac1 eth0" > /etc/macaddr
echo "$mac2 eth1" >> /etc/macaddr

echo "MAC addresses successfully generated:"
cat /etc/macaddr
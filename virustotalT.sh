#Add Api key and done

##Usage
virustotalT.sh domain.com

##CODE

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <base>"
    exit 1
fi

base="$1"
apikey="XXXXX"  # Replace XXX with your actual API key
url="https://www.virustotal.com/vtapi/v2/domain/report?apikey=$apikey&domain=$base"
file="./virustotal.$base.json"

# Download the content and save it to the file
curl -s "$url" -o "$file"

if [ $? -ne 0 ]; then
    echo "Failed to download content."
    exit 1
fi

echo "Downloaded content to $file"

# Check if the file exists after downloading
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found after download."
    exit 1
fi

# First command: Extract subdomains
gron "$file" | grep subdomains | awk '{print $3}' | sed 's/[\";]//g; s/^\[\(.*\)\]$/\1/; s/\/$//' | tee "$base.virustotal.subs.txt"


# Second command: Extract IP addresses
gron "$file" | grep ip_address | awk '{print $3}' | sed 's/[\";]//g; s/\/$//' | tee "$base.virustotal.ips.txt"

# Third command: Extract undetected URLs
gron "$file" | grep undetected_urls | awk '{print $3}' | grep -i http | sed 's/[\";]//g; s/\/$//' | tee "$base.virustotal.urls.txt"


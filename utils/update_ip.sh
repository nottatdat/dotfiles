#/bin/bash
update_ip() {
	curl -X PUT "https://api.cloudflare.com/client/v4/zones/$1/dns_records/$2" \
                -H "X-Auth-Email: $3" \
                -H "X-Auth-Key: $4" \
                -H "Content-Type: application/json" \
                --data '{"type":"A","name":"ssh","content":"'"$5"'","proxied":false,"ttl":1}'
}

update_home_ip() {
	update_ip $CF_ZONE $CF_DNS_RECORD $CF_API_EMAIL $CF_API_KEY $1
}

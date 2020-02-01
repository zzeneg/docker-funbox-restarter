#!/bin/sh

test_error() {
    ERROR=$(echo $1 | jq -c '.errors')
    if [ "$ERROR" != "null" ]; then
        echo "ERROR on $2: $1" && exit 1
    fi
}

echo 'start restarting'

AUTH=$(curl -s -S -w "\n" -c /cookies.txt -X POST "$BASE_URL/authenticate?username=$USERNAME&password=$PASSWORD")
test_error "$AUTH" "AUTH"

CONTEXT=$(echo "$AUTH" | jq -r '.data.contextID')

TURN_OFF=$(curl -s -S -w "\n" -b /cookies.txt -H "X-Context: $CONTEXT" "$BASE_URL/sysbus/NeMo/Intf/data:setFirstParameter" --data-binary '{"parameters":{"name":"Enable","value":0,"flag":"ppp","traverse":"down"}}')
test_error "$TURN_OFF" "TURN_OFF"

TURN_ON=$(curl -s -S -w "\n" -b /cookies.txt -H "X-Context: $CONTEXT" "$BASE_URL/sysbus/NeMo/Intf/data:setFirstParameter" --data-binary '{"parameters":{"name":"Enable","value":1,"flag":"ppp","traverse":"down"}}')
test_error "$TURN_ON" "TURN_ON"

echo 'restarted successfully'
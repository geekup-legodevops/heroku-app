
APPSMITH_INSTALLATION_ID=$(curl -s 'https://api64.ipify.org')

curl -s --location --request POST 'https://646139a6cd54c374ac409d247fe9684a.m.pipedream.net' \
--header 'Content-Type: text/plain' \
--data-raw '{
  "userId": "'"$APPSMITH_INSTALLATION_ID"'",
  "event": "Installation Success",
  "data": {
      "platform": "heroku",
      "os": "Ubuntu"
   }
}' > /dev/null

npm i -g now
cd server
now -e NODE_ENV=production --token $NOW_TOKEN --npm deploy --public
now alias --token=$NOW_TOKEN

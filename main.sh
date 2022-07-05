#!/bin/sh

# Check the variables exist
echo $API_URL
echo $API_KEY

# Check initial config
cat /app/src/environments/environment.prod.ts

# Replace config
cat >/app/src/environments/environment.prod.ts <<EOL
export const environment = {
  production: true,
  apiUrl: "${API_URL}",
  apiKey: "${API_KEY}",
};
EOL

# Check resuling config
cat /app/src/environments/environment.prod.ts

# Run the app
ng serve --host 0.0.0.0 --configuration production --live-reload false --disable-host-check true

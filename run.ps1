echo "Starting frontend..."
Start-Job -ScriptBlock { npx lite-server --baseDir c:\dist }

echo "Running npm install..."
cd c:/cypress
npm ci

echo "Waiting for frontend to be ready..."
npx wait-on http-get://localhost:3000

echo "Running Cypress with Chrome..."
npx cross-env DEBUG=cypress:* npx cypress run --browser chrome

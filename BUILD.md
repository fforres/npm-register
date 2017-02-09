## Build with
docker build -t pandora/register .

## Run with
docker run -p 3010:3000 -d pandora/register
docker run -e ENV_KEY=ENV_VALUE -e ENV_KEY2=ENV_VALUE2 -p 3010:3000 -d pandora/register 

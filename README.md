# Debian 9 (stretch) and 10 (buster) packages for GDAL 3.0.2

**including proj6, ogdi4 and libgeotiff5, all based on the official packages by the Debian GIS team from sid**

They have different names from the base packages, so installing the runtime only of proj6 and gdal26 along proj4 and gdal24 should be possible. The -dev packages are mutually exclusive. 

You can use the Dockerfiles to rebuild the packages yourself.

Or you can use the public repository at

***deb https://deb.meteo.guru/debian buster main***

Add the GPG key

`curl https://deb.meteo.guru/velivole-keyring.asc | sudo apt-key add -`

Add the repository

`sudo echo "deb https://deb.meteo.guru/debian buster main" > /etc/apt/sources.list.d/meteo.guru.list`
or
`sudo echo "deb https://deb.meteo.guru/debian stretch main" > /etc/apt/sources.list.d/meteo.guru.list`

Install the keyring

`sudo apt-get install -y velivole-keyring`

Update and install

`sudo apt-get update && apt-get install -y gdal-bin`

Sources used for building can be browsed at https://git.meteo.guru/


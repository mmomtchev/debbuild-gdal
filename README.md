# Debian 9 (stretch), 10 (buster), Ubuntu 19.04 (disco dingo), 19.10 (eoan ermine), 20.04 LTS (focal fossa) packages for GDAL 3.1.0

**including proj6, ogdi4, libgeotiff5 and spatialite 4, all based on a merge between GDAL git sources and the official packages by the Debian GIS team from sid**

They have different names from the base packages, so installing the runtime only of proj6 and gdal27 along proj4 and gdal24 should be possible. The -dev packages are mutually exclusive.

You can use the Dockerfiles to rebuild the packages yourself.

Or you can use the public repository at

***deb https://deb.meteo.guru/debian buster main***

***deb https://deb.meteo.guru/debian stretch main***

***deb https://deb.meteo.guru/ubuntu disco main*** (not supported anymore, last GDAL is 3.0.3)

***deb https://deb.meteo.guru/ubuntu eoan main***

***deb https://deb.meteo.guru/ubuntu focal main*** (only GDAL 3.1.0 as all the other packages are already up to date)

Add the GPG key

`curl https://deb.meteo.guru/velivole-keyring.asc | sudo apt-key add -`

Add the repository

`sudo echo "deb https://deb.meteo.guru/debian buster main" > /etc/apt/sources.list.d/meteo.guru.list`

or

`sudo echo "deb https://deb.meteo.guru/debian stretch main" > /etc/apt/sources.list.d/meteo.guru.list`

or

`sudo echo "deb [arch=amd64] https://deb.meteo.guru/ubuntu disco main" > /etc/apt/sources.list.d/meteo.guru.list`

or

`sudo echo "deb [arch=amd64] https://deb.meteo.guru/ubuntu eoan main" > /etc/apt/sources.list.d/meteo.guru.list`

or

`sudo echo "deb [arch=amd64] https://deb.meteo.guru/ubuntu focal main" > /etc/apt/sources.list.d/meteo.guru.list`

Update and install the keyring

`sudo apt-get update && sudo apt-get install -y velivole-keyring`

Install GDAL which will pull the rest

`sudo apt-get install -y gdal-bin`

Sources used for building can be browsed at https://git.meteo.guru/


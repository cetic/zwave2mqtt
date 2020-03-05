# Control ZWave to MQTT with Node-Red

This tutorial explains how to send and receive data from the ZWave network with the Node-Red tool.

For more information about node-red you can go to [nodered.org](https://nodered.org/)

## Dependecies

The installation is realized using the docker tool.

Before running the service you must configure the access to the `data` folder

```
sudo chown -R 1000:1000 ~/zwave2mqtt/addons/node-red/data/
```

## Runing test

In this project work with Raspberry Pi 0w. To run the service : 
```
docker run -d -p 1880:1880 --name mynodered -v ~/zwave2mqtt/addons/node-red/data:/data nodered/node-red:1.0.2-10-arm32v6
```

Note, if you work with another platform, you can use this command line : 
```
docker run -d -p 1880:1880 --name mynodered -v ~/zwave2mqtt/addons/node-red/data:/data nodered/node-red
```

**Full documentation** : [Running Node-Red under Docker](https://nodered.org/docs/getting-started/docker)

## Configuration

The project starts with a basic example.

The first time it is run, you have one mqtt subscriber which listens to all messages with the topic `zwave`. The messages are printed in the debug.

![node-red-exeample](https://user-images.githubusercontent.com/26742110/75868954-25326e00-5e09-11ea-8921-72faa2b4d5ff.JPG)

Just below, you have an injecter which allows to send *turn off* message for one plug. 
To configure you need to :
1. Doucle-clik on `Switch binary OFF` box
1. Change in topic case : `$YOUR_LOCATION$` and `$YOUR_NAME$`
1. Cick on `Done`
1. Click on `Deploy`

![node-red-publish](https://user-images.githubusercontent.com/26742110/75868956-26639b00-5e09-11ea-8336-d99a181c5563.JPG)

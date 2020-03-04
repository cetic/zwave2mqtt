# Control ZWave to MQTT with Node-Red

This tutorial explain how send and receive data from the ZWave network with the Node-Red tool.

For more informations about node-red you can go on [nodered.org](https://nodered.org/)

## Dependecies

The install is realize with the docker tool.

Before running the service you must configure the access at the `data` folder

```
sudo chown -R 1000:1000 ~/zwave2mqtt/addons/node-red/data/
```

## Runing test

In this project work with Raspberry pi 0w. To run on the service : 
```
docker run -d -p 1880:1880 --name mynodered -v ~/zwave2mqtt/addons/node-red/data:/data nodered/node-red:1.0.2-10-arm32v6
```

Note, if you work with an other platform, you can use this command line : 
```
docker run -d -p 1880:1880 --name mynodered -v ~/zwave2mqtt/addons/node-red/data:/data nodered/node-red
```

**Full docmentiion** : [Running Node-Red under Docker](https://nodered.org/docs/getting-started/docker)

## Configuration

The project start with a basic example.

In first time, you have one mqtt subscriber who listen all message with the topic `zwave`. This messages are print in the debug.

![node-red-exeample](https://user-images.githubusercontent.com/26742110/75868954-25326e00-5e09-11ea-8921-72faa2b4d5ff.JPG)

Just beyond, you have one injecter who allow to send *turn off* message for one plug. 
To configure you need to :
1. Doucle-clik on `Switch binary OFF` box
1. Change in topic case : `$YOUR_LOCATION$` and `$YOUR_NAME$`
1. Cick on `Done`
1. Click on `Deploy`

![node-red-publish](https://user-images.githubusercontent.com/26742110/75868956-26639b00-5e09-11ea-8336-d99a181c5563.JPG)


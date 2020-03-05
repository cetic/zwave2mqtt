# Control ZWave to MQTT with command-line

This tutorial explains how to send and receive data from the ZWave network.
To interact with zwave2mqtt from the command line, we use mosquitto clients.

## Dependecies

Install mosquitto clients tool :

```
sudo bash install.sh
```

## Configuration

To use both below commands, put some broker information :

| Parameter | Name       | Default               |
|:---------:|:----------:|:---------------------:|
| -t        | ZWave topic| # (all topics)        |
| -h        | IP or URL  | localhost or 127.0.0.1|
| -p        | port       | 1883                  |
| -v        | verbose    | only subscribe mode   |

## Runing test

### Collect data 

To get ZWave information, execute : 
```
mosquitto_sub -h 127.0.0.1 -p 1883 -t '#' -v
```

### Send command

To turn off one wall plug (switch binary) :
* Fix `$LOCATION$` and `$NODE-NAME$`
* Put `/set` at end of the topic
* Send message : '0'

```
mosquitto_pub -h 127.0.0.1 -p 1883 -t 'zwave/$LOCATION$/$NODE-NAME$/switch_binary/switch/set' -m '0'
```

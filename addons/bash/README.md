# Control ZWave to MQTT with commande line

## Dependecies

Install mosquitto clients tools :

```
sudo bash install.sh
```

## Configuration

To use the both commande you need to put some broker information :

| Parameter | Name       | Default               |
|:---------:|:----------:|:---------------------:|
| -t        | ZWave topic| # (all topics)        |
| -h        | IP or URL  | localhost or 127.0.0.1|
| -p        | port       | 1883                  |
| -v        | verbose    | only subscribe mode   |

## Runing test

* To collect data :

```
mosquitto_sub -h 127.0.0.1 -p 1883 -t '#' -v
```

* To Send command :

To turn off one wall plug (switch binary) you need :
* Fix `$LOCATION$` and `$NODE-NAME$`
* Put /set at end of the topic
* Send message : '0'

```
mosquitto_pub -h 127.0.0.1 -p 1883 -t 'zwave/$LOCATION$/$NODE-NAME$/switch_binary/switch/set' -m '0'
```







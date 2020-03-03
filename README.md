# zwave2mqtt

This project allow to deploy zwave sensor network on raspberry pi 0w with docker and docker-compose. To manage all data collected, one local brocker is installed (mosquitto).

## Getting Started

To deploy the service you need to install raspbian on your raspberry pi 0w : [download raspbian](https://www.raspberrypi.org/downloads/raspbian/)

### Prerequisites

Update your platform and install git to clone the project :

```
sudo apt update
sudo apt upgrade
sudo apt install git
```

### Installing

To deploy the service, you don't need to install any source. All installation will be manage with docker. Each configuration wil be manage by docker-compose. To install this two tools, you can launch the `install.sh` 

```
cd ~/zwave2mqtt
sudo bash install.sh
sudo reboot
```


## Running the service

Go to your project and launch docker-compose :

```
cd ~/zwave2mqtt
docker-compose up -d
```

### Tests

After the service deployment, with your browser, you can go on the home page : http://`$YOUR_IP`:8091

![ZWavetoMQTT home page](https://hub-creatif.cetic.be/sites/default/files/inline-images/oooo.PNG)

## Configuration

For configuration and more details on ZWave deployement, go to this page step 2 (French link) : http://hub-creatif.ext.cetic.be/node/2

The configuration explain how : 
* Manage your ZWave network
* Configure your MQTT installation
* Customize your gateway service

## Built With

* [Docker](https://www.docker.com/) - Use to deploy service
* [Docker-Compose](https://docs.docker.com/compose/) - Use to management service
* [Mosquitto](https://mosquitto.org/) - MQTT brocker use to share data
* [ZWavetoMqtt](https://github.com/OpenZWave/Zwave2Mqtt) - source of the project

## Authors

* **Benjmain Bernaud** - *Initial work* - [contact](https://github.com/bbenjamin11)

See also the list of [contributors](https://github.com/cetic/zwave2mqtt/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


# zwave2mqtt

This project allows to deploy zwave sensor network on Raspberry Pi 0w with docker and docker-compose. To manage collected data, a local brocker is installed (mosquitto).

## Getting Started

To deploy the service, you need to install raspbian on your Raspberry Pi 0w : [download raspbian](https://www.raspberrypi.org/downloads/raspbian/)

### Prerequisites

Update your platform and install git to clone the project :

```
sudo apt update
sudo apt upgrade
sudo apt install git
```

### Installing

To deploy the service, you don't need to install any source. All installations will be managed by docker. Each configuration wil be managed by docker-compose. To install these two tools, you can run `install.sh` 

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

After deploying the service, in your browser, you can go to the page : http://`$YOUR_IP`:8091

[HOME_PAGE_PNG](https://hub-creatif.cetic.be/sites/default/files/inline-images/oooo.PNG)

## Configuration

For configuration and more details on ZWave deployement, go to this page and see Step 2 (French link) : http://hub-creatif.ext.cetic.be/node/2

The configuration explains how to: 
* Manage your ZWave network
* Configure your MQTT installation
* Customize your gateway service

## Built With

* [Docker](https://www.docker.com/) - Use to deploy the services
* [Docker-Compose](https://docs.docker.com/compose/) - Use to manage the services
* [Mosquitto](https://mosquitto.org/) - MQTT brocker Use to share data
* [ZWavetoMqtt](https://github.com/OpenZWave/Zwave2Mqtt) - Project source

## Authors

* **Benjmain Bernaud** - *Initial work* - [contact](https://github.com/bbenjamin11)

See also the list of [contributors](https://github.com/cetic/zwave2mqtt/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

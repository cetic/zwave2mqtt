# zwave2mqtt

This project allow to deploy zwave sensor network on raspberry pi 0w with docker and docker-compose

## Getting Started

To deploy the service you need to install raspbian on your raspberry pi 0w : [download raspbian](https://www.raspberrypi.org/downloads/raspbian/)

### Prerequisites

Intall git to clone the project
```
sudo apt update
sudo apt upgrade
sudo apt install git
```

### Installing

To deploy the service, you don't need to install any source. All installation will be manage with docker and each configuration with docker-compose. To install this two tools, you can launch the `install.sh` 

```
sudo bash install.sh
sudo reboot
```


## Running the service

```
docker-compose up -d
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc


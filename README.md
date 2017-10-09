# Docker Test App

Using [ruby 2.1.2 image](https://hub.docker.com/_/ruby/). The reason for 2.1.2
is our application at [Promptcloud](www.promptcloud.com) is using ruby 2.1.2.

### This app is using 3 docker images

1. shivakumaarmgs/ruby2.1.2-test:v3 image

A basic docker image build on [ruby 2.1.2 image](https://hub.docker.com/_/ruby/)
with nodejs and other minor dependencies installed. Those dependencies can be
found at [Dockerfile](https://github.com/shivakumaarmgs/docker-test-app-1/blob/master/Dockerfile).  
[https://hub.docker.com/r/shivakumaarmgs/ruby2.1.2-test/](https://hub.docker.com/r/shivakumaarmgs/ruby2.1.2-test/)

2. mysql  
[https://hub.docker.com/mysql](https://hub.docker.com/_/mysql)

3. selenium/standalone-chrome  
[https://hub.docker.com/r/selenium/standalone-chrome/](https://hub.docker.com/r/selenium/standalone-chrome/)

## To build the application
```
docker-compose build
```
This pulls all the necessary images and prepares your container.
It doesn't start the development server.

### To run the tests
```
docker-compose up --exit-code-from web
```
These commands will create the database if needed and migrate the database. Then
it runs the tests. Please look at `entry.sh` and `test.sh` for more details. In
test.sh we wait till the mysql service is up and running. Its implemeted based
on these links [startup-order](https://docs.docker.com/compose/startup-order/)
and [docker-compose-wait-for-dependencies](https://8thlight.com/blog/dariusz-pasciak/2016/10/17/docker-compose-wait-for-dependencies.html)

#### Capybara configuration
Capybara is configured to run tests on a selenium remote machine which is
running in a another container along side our rails app container. This
configuration is taken from [https://medium.com/@georgediaz/docker-container-for-running-browser-tests-9b234e68f83c](https://medium.com/@georgediaz/docker-container-for-running-browser-tests-9b234e68f83c)

### TODO
1. Add redis service to compose file
2. Try and use [parallel_tests](https://github.com/grosser/parallel_tests/issues)

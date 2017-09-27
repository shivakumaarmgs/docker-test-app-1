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

## To run the application
```
docker-compose run --rm web rake db:create
docker-compose run --rm web rake db:migrate
docker-compose up
```
This pulls all the images and start the server in development mode. You can visit
`http://localhost:3000` to view the sample root page.

### To run the tests
```
docker-compose run --rm web rspec spec/models
docker-compose run --rm --service-ports web rspec spec/features
```
These commands will run the model and feature specs. While running feature specs
`--service-ports` is really important.

#### Capybara configuration
Capybara is configured to run tests on a selenium remote machine which is
running in a another container along side our rails app container. This
configuration is taken from [https://medium.com/@georgediaz/docker-container-for-running-browser-tests-9b234e68f83c](https://medium.com/@georgediaz/docker-container-for-running-browser-tests-9b234e68f83c)

### TODO
1. Add redis service to compose file
2. Try and use [parallel_tests](https://github.com/grosser/parallel_tests/issues)

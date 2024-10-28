# MicroApp

MicroApp is novel way to host micro applications in a single file. It's not meant be be a microservice framework. It's meant to be a way to create and deploy small applications in a simple way. Need to create a landing page? A slack bot? A scheduled task? A websocket server? A background worker? A file storage? A cache? A database? All together and combined? MicroApp can do it all.

# WARNING: This is a work in progress and not ready for production use, not everything described here is implemented yet

## Implemented features

| Platform       | web | schedule | worker | websocket | db | cache | filestorage |
|----------------|-----|----------|--------|-----------|----|-------|-------------|
| Local          | ❌   | ❌        | ❌      | ❌         | ❌  | ❌     | ❌           |
| Docker         | ❌   | ❌        | ❌      | ❌         | ❌  | ❌     | ❌           |
| Docker Compose | ❌   | ❌        | ❌      | ❌         | ❌  | ❌     | ❌           |
| AWS SAM        | ❌   | ❌        | ❌      | ❌         | ❌  | ❌     | ❌           |
| MicroApp Cloud | ❌   | ❌        | ❌      | ❌         | ❌  | ❌     | ❌           |


## Creating a MicroApp

MicroApp is a Ruby gem that is providing a way to create and deploy microapplications in a simple way.


## Deployment Methods

MicroApp is trying to abstract from infrastructure it's running on. It can be deployed in different ways:
 - `microapp deploy local` - one single Ruby process that is trying to mimic other deployment methods locally
 - `microapp deploy docker-single` - Docker container with all dependencies inside using Procfile
 - `microapp deploy docker-compose` - Docker container with all dependencies inside using docker-compose.yml
 - `microapp deploy aws-cloud-sam` - AWS Lambda function using AWS SAM (Serverless Application Model) with Cloudformation template
 - `microapp deploy microapp-cloud` - MicroApp Cloud - a cloud service that is running MicroApp on AWS, GCP, Azure, etc.


## MicroApp Elements

MicroApp can have many elements:
 - `web` - a web application, that is using Sinatra as a web framework (Sinatra with Lamby on AWS Lambda)
 - `schedule` - a scheduled task, that is using Rufus-scheduler or AWS 
 - `worker` - a background worker, that is using Sidekiq or AWS SQS
 - `websocket` - a websocket server, that is using XXX (probably Faye or Thin with EventMachine) or AWS API Gateway
 - `db` - a database, that is using XXX or AWS DynamoDB
 - `cache` - a cache, that is using XXX or AWS ElastiCache
 - `filestorage` - a file storage, that is using XXX or AWS S3
 
## MicroApp Dokker Image

MicroApp provides official Docker image that is capable of running any MicroApp.

 - `docker run microapp/microapp github:microapp/microapp/examples/web-slack-bot.rb` - run a Websocket Chat MicroApp
 - `docker run -v $(pwd):/microapp microapp/microapp` - run your MicroApp from the current directory
 - 

## MicroApp Repository

MicroApps can be created in any Github repository 

## MicroApp Caveats

Not every deployment infrastructure can be replicated 1:1 which means that some features may not work on all deployment methods.

1. File upload on Lambda is Limited an

## MicroApp Examples

MicroApp can be used in many ways, here are some examples:
 - [Slack Bot](examples/web-slack-bot.rb) - a simple Slack bot that is responding to messages
 - [Scheduled Monitor](examples/schedule-currency-monitor.rb) - a scheduled task that is checking currency rates
 - [Background Worker](examples/worker-email-sender.rb) - a background worker that is sending emails
 - [Websocket Server](examples/websocket-chat.rb) - a websocket server that is handling chat messages

## More Ideas
 - MicroApp can define two or more apps
   - This is useful for microservices that are working together, but also we can use one docker container to run multiple apps

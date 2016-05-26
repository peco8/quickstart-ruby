# quickstart-ruby
A simple Ruby app ( using Sinatra: a DSL for quickly creating web applications in Ruby with minimal effort http://www.sinatrarb.com/ ) which can easily be deployed to Arukas.

## Running locally

```
$ git clone https://github.com/peco8/quickstart-ruby.git
$ cd quickstart-ruby
$ docker build --no-cache --tag quickstart-ruby .
$ docker run -rm -d -p 4567:4567 quickstart-ruby
```

Your app should now be running:

```
$ curl 192.168.59.103:4567
Hello World!
```

## Deploying to Arukas

[Install the Arukas CLI.](https://github.com/arukasio/cli)

or If you have docker installed already,
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<APIT_TOKEN> \
                  -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> \
                    arukasio/arukas run --instances=1 \
                                        --mem=512 \
                                        --ports=4567:tcp peco8/quickstart-ruby
```
## Authors

* Toshiki Inami (<t-inami@arukas.io>)

## License

This project is licensed under the terms of the MIT license.

**Continue with this tutorial [here](/).**

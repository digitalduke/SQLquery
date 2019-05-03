## Docker files for testing purposes of different DokuWiki versions.

All these images based on Alpine and have a specified version of DokuWiki running under Nginx.

* [Elenor of Tsort](https://github.com/digitalduke/sqlquery/tree/master/docker/Elenor%20of%20Tsort) version 2016-06-26e
* [Frusterick Manners](https://github.com/digitalduke/sqlquery/tree/master/docker/Frusterick%20Manners) version 2017-02-19f
* [Greebo](https://github.com/digitalduke/sqlquery/tree/master/docker/Greebo) version 2018-04-22b


### How to use

#### Build

```docker build -t my_wiki .```

#### Run

```docker run -d -p 80:80 my_wiki```

#### Open

Access the install page in the browser by going to ```http://127.0.0.1/install.php```

#### Management

For the easy build, manage and maintain your Docker environments you may use side software like [Portainer](https://www.portainer.io/).

### Warning

All images provided as-is without any warranty and support at all.

# SVN Apache

Subversion with apache in a docker container.

This container is meant as a simple appliance to get svn up and running over webdav.
The apache web-server is used for the webdav interface.

**Important:**
This container should not be used as a stand-alone solution in production.
It is configured to use basic authentication over an unencrypted connection.
Please either change the configuration or use this container with an SSL-proxy.

# Configuration

The main apache configuration file is located at `/etc/apache2/httpd.config`.
The rest of this section assumes that you are using the configuration file provided with the container.

## Port

With the default configuration port 80 is exposed.

## SVN repository directory

The default repository directory is `/var/svn`.
You can mount a host volume to this path using the `-v` argument (e.g. `-v /custom/path:/var/svn`).

## Authentication

The default authentication scheme is *basic*.
The password file is located at `/etc/svn/auth.htpasswd`.
New users can be added using the following command:

```
htpasswd -c -m /etc/svn/auth.htpasswd <username>
```

## Authorization

The default is configuration relies on path authorization using the file `/etc/svn/authorization`.
A simple example file for  path authorization looks like this:

```
[/]
* = r
<username> = rw
```

# Running the container

This is a simple example mounting host volumes for the svn repository and configuration.
The default port (80) is mapped to 8080 on the host.

```
docker run --name svn -v /custom/repo/path:/var/svn -v /custom/config/path:/etc/svn -p 8080:80 -d svn-apache
```

# Administration

You can do administrative tasks by launching a shell in the running container.

```
docker exec -it <name of svn container> sh
```

## Create a new repository

From within the container execute

```
svnadmin create <name of repository>
```

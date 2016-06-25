# docker-svn-apache
Subversion with apache in a docker container.

# Example usage

```
docker run --name svn -v /tmp/svn/repos:/var/svn -v /tmp/svn/etc:/etc/svn -p 8080:80 -d svn-apache
```
## User creation

```
htpasswd -c -m /etc/svn/auth.htpasswd <username>
```

## Path authorization

```
[/]
* = r
<username> = rw
```

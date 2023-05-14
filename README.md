# Docker for Symfony

## After install

`docker exec -it nginx bash`

`certbot --nginx -d arthsdev.de`

---

`docker exec -it php bash`

`composer install -n`

`composer recipes`

---

### How to clear docker stuff
**To delete all containers including its volumes use,**

`docker rm -vf $(docker ps -aq)`


**To delete all the images,**

`docker rmi -f $(docker images -aq)`

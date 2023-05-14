# Docker for Symfony

## After install

`docker exec -it nginx bash`

`certbot --nginx -d arthsdev.de`

---

`docker exec -it php bash`

`composer install -n`

`composer recipes`

### SSL

`certbot certonly --email hi@hi.local --agree-tos --no-eff-email --staging -d hi.local`

if all good

``certbot certonly --email hi@hi.local --agree-tos --no-eff-email --force-renewal -d hi.local``

---

### How to clear docker stuff
**To delete all containers including its volumes use,**

`docker rm -vf $(docker ps -aq)`


**To delete all the images,**

`docker rmi -f $(docker images -aq)`

**To remove all Docker volumes,**

`docker volume rm $(docker volume ls -q)`

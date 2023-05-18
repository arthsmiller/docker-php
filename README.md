# Docker for Symfony

## After docker compose up

### SSL

`docker exec -it nginx bash`

`certbot --nginx --email hi@hi.local --agree-tos --no-eff-email --staging -d hi.local`

if all good

`certbot --nginx --email hi@hi.local --agree-tos --no-eff-email --force-renewal -d hi.local`

then uncomment the SSL relevant lines in the nginx default.conf

### Create Symfony webapp

`docker exec -it php bash`

`composer install -n`

`composer recipes`

### Webpack & Tailwind

Still in php container

`yarn`

`yarn add tailwindcss postcss postcss-loader autoprefixer alpinejs --dev`

`yarn tailwindcss init -p`

Add to webpack.config.js:

> .enablePostCssLoader()

Add to tailwind.config.js content array:

> "./assets/**/*.js",
>    
> "./templates/**/*.html.twig",

app.css:

> @tailwind base;
>
> @tailwind components;
>
> @tailwind utilities;

To compile JS & CSS:

`yarn watch`

---

### How to clear docker stuff
**To delete all containers including its volumes use,**

`docker rm -vf $(docker ps -aq)`

**To delete all the images,**

`docker rmi -f $(docker images -aq)`

**To remove all Docker volumes,**

`docker volume rm $(docker volume ls -q)`

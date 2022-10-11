# Colmanag

A webapp to create and explore collections of items - books, movies, music, etc.

## Run locally (dev)

```
1. Start docker compose by running an alias to `docker compose up`:
> npm run dev
```

> Live reload works with this method. `node_modules` and `dist` are created in a project folder. While the container is running, new npm modules can only be installed with `docker compose run web npm i <package>`

## Deploy to heroku

```
1. Create a new app on heroku

2. Login to heroku CLI:
> heroku login

3. Add a heroku remote, so heroku CLI knows for which app to execute its commands:
> heroku git:remote -a <app_name>
```

#### Automatic deploys when pushing to github

```
1. Tell heroku to build the app with docker:
> heroku stack:set container

2. In heroku dashboard, go to `Deploy` tab, select `Github`, connect the app to this repository

3. Enable automatic deploys in a section below (`Enable Automatic Deploys` button)
```

#### Quick deploy from a local machine

```
1. Sign into Container Registry:
> heroku container:login

2. Build, push and release by running an alias to `heroku container:push web && heroku container:release web`:
> npm run deploy
```

> This method is usually faster than automatic deploys, since, when building the docker image on a local machine, docker caches most of the steps. But when heroku builts the image itself, it builds it from scratch.

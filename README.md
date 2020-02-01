# docker-funbox-restarter
Restart internet session on Orange Funbox 3.0 on schedule

Published on [Docker Hub](https://hub.docker.com/r/zzeneg/funbox-restarter)

Orange Funbox 3.0 automatically restart a session every 22 hours which is not every convenient. To overcome this you can schedule your restarts automatically on a specified time.

This works only from inside the network, it seems the router does not support restarting sessions using remote access.

## Usage
- specify environment variables:
  - CRON - schedule for your restarts in cron format - `0 5 * * *`
  - BASE_URL - url of the Funbox - `http://192.168.1.1'`
  - USERNAME - Funbox username
  - PASSWORD - Funbox password
- docker-compose example
  ```yaml
  funbox:
    container_name: funbox
    image: zzeneg/funbox-restarter
    restart: unless-stopped
    environment:
      CRON: "0 5 * * *"
      BASE_URL: http://192.168.1.1
      USERNAME: admin
      PASSWORD: password
  ```


# URBackup Client in Docker

## Build

```
docker build -t croc/urbackupclient .
```

## Run

```
docker run -tid --net=host --name=urbackupclient -v /mnt/mydir:/mnt/mydir croc/urbackupclient /opt/start.sh
```

  - the `--net=host` option is recommended for the urbackup client-server communication
  - you select a backup source folder with docker volume. Example: `-v /mnt/mydir:/mnt/mydir`

## Usage

### Add a backup source

You have to add backup source folder in the client container.

```
docker exec -ti urbackupclient urbackupclientctl add-backupdir -d /mnt/mydir
```

### List backup sources

You can list all backup sources.

```
docker exec -ti urbackupclient urbackupclientctl list-backupdir
```

### Recovery

You can recover any files in the URBackup Server's WEBUI by default.

# Electrs Dockerfile  
> Dockerfile for a Electrs Server container

---

**⚠️ This is experimental. Please use at your own risk.⚠️**

---

## Build
> Note: tag name can be whatever you'd like
```
$docker build . -t electrs:latest
```
## Run
> If you'd like to run the container, make sure to add a directory to hold the electrs data (i.e. /electrsdata) and an electrs config file (electrs_config.toml) and make sure to connect them to the container. Also, make sure you pass the container the bitcoin data directly (i.e. on mac it would be ~/Library/Application Support/Bitcoin). Lastly, make sure you expose the ports to your local machine to query the server (i.e. make rpc port accessible).
```
docker run --name electrs-server -v $(pwd)/electrsdata:/electrsdata -v $(pwd)/electrs_config.toml:/electrs_config.toml -v /Users/joe/code/bitcoin-core-node/btcdata:/root/.bitcoin -p 127.0.0.1:60001:60001/tcp -it -d electrs:latest
```
## Start the Electrs server
1) ssh into the container
```
$ docker exec -it electrs-server /bin/bash
```
2) Start Electrs Server from inside the container
```
ELECTRS_DAEMON_RPC_ADDR=host.docker.internal:18332 ELECTRS_DAEMON_P2P_ADDR=host.docker.internal:18333 ELECTRS_ELECTRUM_RPC_ADDR=127.0.0.1:60001 /electrs/target/release/electrs --conf /electrs_config.toml
```

## License
MIT © [Joe Gesualdo]()


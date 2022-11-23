# Modular Fellow MVP

## What does it do? 
Building a small blockchain game and `SDK`. 
It will use `Celestia` for `Data Availability`, `Rollmint`, `Ignite CLI`, `Cosmos SDK`, and `Optimism` in order to have a faster development in building 2d modular blockchain game. 

## How will it be built?
Using `Flutter` and `Dart` to create the blockchain game that is modular in `Web`, `Desktop` both `Window`, `MacOS` and `Linux` and  maybe `android` and `ios`.  

## Tech Spec

* `Dart` 2.18.4
* `Flutter`  3.3.8
* `Go` 1.18

What components of the `Celestia stack` does it interact with?
The components of the `Celestia stack` for this project: 

* Data Availability
* Rollmint
* Ignite CLI
* Cosmos SDK
* Optimism (Coming Soon)

In the future a modular game scaffolder in order to have a faster development in building 2d modular blockchain game.

## Setup Requirements
* [Flutter ](https://docs.flutter.dev/get-started/install) 
* [Go](https://go.dev/dl/)
* [Ignite CLI](https://docs.ignite.com/)

# Game App Layer

## To run the Desktop App 

```bash
cd modular_gm_game
flutter run -d macos
```

## To run the Chrome 
```bash
cd modular_gm_game
flutter run -d chrome
```

# Celestia  Layer

## To run a celestia Node 
```bash
./build/celestia light start --node.network arabica-1
```
```bash
PATH=$PATH:$(go env GOPATH)/bin
```
### run light node
```bash
./build/celestia light start --core.ip https://limani.celestia-devops.dev --core.grpc.port 9090
```

curl -X GET http://XX.XX.XXX.XXX:26658/balance

### Start the Game Rollup

```
modulargamed start --rollmint.aggregator true --rollmint.da_layer celestia --rollmint.da_config='{"base_url":"http://XX.XX.XXX.XXX:26658","timeout":60000000000,"gas_limit":6000000}' --rollmint.namespace_id 000000000000FFFF --rollmint.da_start_height 100783
```

sudo kill -9 $(sudo lsof -t -i:8080)

##  To query all of the on-chain fellows their position and scores:
```bash
./modulargamed q modulargame fellows 
```

## To send a transaction from a user 

#### Command sending  score,   x position, and  y position.
```bash
./modulargamed tx modulargame create-fellow 0 0 0  --from alice 
```
#### Command sending  score,   x position, and  y position sending a yes confirmation
```bash
./modulargamed tx modulargame create-fellow 0 0 0  --from alice --yes 
```


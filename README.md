# Modular Fellow MVP

# What does it do? 
Building a small blockchain game and SDK. 
It will use Celestia for Data Availability, Rollmint, Ignite CLI, Cosmos SDK, and Optimism in order to have a faster development in building 2d modular blockchain game. 


# How will it be built?
Using Flutter and Dart to create the blockchain game that is modular in Desktop both Window, MacOS and Linux and  maybe mobile devices.  

What components of the Celestia stack does it interact with?
The components of the Celestia for Data Availability, Rollmint, Ignite CLI, Cosmos SDK in order to have a faster development in building 2d modular blockchain game.






./build/celestia light start --node.network arabica-1

PATH=$PATH:$(go env GOPATH)/bin


./build/celestia light start --core.ip https://limani.celestia-devops.dev --core.grpc.port 9090

curl -X GET http://52.26.186.106:26658/balance


recipesd start --rollmint.aggregator true --rollmint.da_layer celestia --rollmint.da_config='{"base_url":"http://52.26.186.106:26658","timeout":60000000000,"gas_limit":6000000}' --rollmint.namespace_id 000000000000FFFF --rollmint.da_start_height 100783


modulargamed start --rollmint.aggregator true --rollmint.da_layer celestia --rollmint.da_config='{"base_url":"http://52.26.186.106:26658","timeout":60000000000,"gas_limit":6000000}' --rollmint.namespace_id 000000000000FFFF --rollmint.da_start_height 100783

./recipesd q recipes dishes 

recipesd tx recipes create-recipe salad "spinach, mandarin oranges, sliced almonds, smoked gouda, citrus vinagrette" --from alice

recipesd start --rollmint.aggregator true --rollmint.da_layer celestia --rollmint.da_config='{"base_url":"http://52.33.155.255:26658","timeout":60000000000,"gas_limit":6000000}' --rollmint.namespace_id 000000000000FFFF --rollmint.da_start_height 61513

sudo kill -9 $(sudo lsof -t -i:8080)

modulargamed tx modulargame create-fellow 0 0 0  --from alice 

./modulargamed tx modulargame create-fellow 0 0 0  --from alice --yes 

./modulargamed q modulargame fellows 
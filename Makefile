# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

.PHONY : build update test clean snapshot

update:; forge update
build  :; forge build
test   :; forge test -vvv --rpc-url=${RPC_URL} --fork-block-number 15081760
clean  :; forge clean
snapshot :; forge snapshot
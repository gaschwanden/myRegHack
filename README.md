# Ethereum Truffle for RegHack Melbourne
Based on a example webpack project with Truffle the team built a landregister and land tenure contracts that are compliance complete by design.

## Team

Prabhat Shrestha - tasker.prabhat@gmail.com
Sunjay Sharma - sunjoy@yahoo.com
Andrew Tran - andrewnamt@gmail.com
Hooman Reisi Dehkordi - hreisi@live.com
Enrique Klix -  enrique.klix@gmail.com
Gideon Aschwanden - gideon.aschwanden@gmail.com

## Usage

1. $ testrpc            // Start your local Node
2. $ ..cd truffle       // Go to truffle directory
3. $ truffle compile    // Compiling the contracts existing in /contracts and defined in /migrations/2_deploy_contracts.js
4. $ truffle migrate    // Migrate the contracts onto the local Node
5. $ npm run dev        // Starts your localhost:8080 where you can interact with the contracts

### Using Javascript

Additionally you can interact with the contracts directly with the terminal. Commands are stored in

## Building and the frontend

1. First run `truffle compile`, then run `truffle migrate` to deploy the contracts onto your network of choice (default "development").
1. Then run `npm run dev` to build the app and serve it on http://localhost:8080

## Possible upgrades

* Use the webpack hotloader to sense when contracts or javascript have been recompiled and rebuild the application. Contributions welcome!

## Common Errors

* **Error: Can't resolve '../build/contracts/MetaCoin.json'**

This means you haven't compiled or migrated your contracts yet. Run `truffle compile` and `truffle migrate` first.

Full error:

```
ERROR in ./app/main.js
Module not found: Error: Can't resolve '../build/contracts/MetaCoin.json' in '/Users/tim/Documents/workspace/Consensys/test3/app'
 @ ./app/main.js 11:16-59
```

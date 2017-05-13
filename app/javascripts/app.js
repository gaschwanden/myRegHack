// Import the page's CSS. Webpack will know what to do with it.
import "../stylesheets/app.css";

// Import libraries we need.
import { default as Web3} from 'web3';
import { default as contract } from 'truffle-contract'

// Import our contract artifacts and turn them into usable abstractions.
import landregistry_artifacts from '../../build/contracts/LandRegistry.json'

// MetaCoin is our usable abstraction, which we'll use through the code below.
var LandRegistry = contract(landregistry_artifacts);

// The following code is simple to show off interacting with your contracts.
// As your needs grow you will likely need to change its form and structure.
// For application bootstrapping, check out window.addEventListener below.
var accounts;
var account;

window.App = {
  start: function() {
    var self = this;

    // Bootstrap the MetaCoin abstraction for Use.
    LandRegistry.setProvider(web3.currentProvider);

    // Get the initial account balance so it can be displayed.
    web3.eth.getAccounts(function(err, accs) {
      if (err != null) {
        alert("There was an error fetching your accounts.");
        return;
      }

      if (accs.length == 0) {
        alert("Couldn't get any accounts! Make sure your Ethereum client is configured correctly.");
        return;
      }

      accounts = accs;
      account = accounts[0];
    });
  },

  setStatus: function(message) {
    var status = document.getElementById("status");
    status.innerHTML = message;
  },

  getLandByOwner: function() {
    var self = this;
    var landId = parseInt(document.getElementById("landId").value);

    this.setStatus("Searching for land details... (please wait)");

    var registry;
    LandRegistry.deployed().then(function(instance) {
      registry = instance;
      return registry.getLandByOwner(landId);
    }).then(function() {
      self.setStatus("Land details received!");
    }).catch(function(e) {
      console.log(e);
      self.setStatus("Error finding land details.");
    });
  },

  registerLand: function() {
    var self = this;
    var owner = document.getElementById("ownerId").value;
    var physicalAddress = document.getElementById("physical_address").value;
    var landId;

    this.setStatus('Registering land... (please wait)');

    var registry;
    LandRegistry.deployed().then(function(instance) {
      registry = instance;
      registry.registerLand(owner, physicalAddress);
      return self.getLandByOwner(owner);
    }).then(function(landId) {
      self.setStatus('Land registered with ID: ' + landId);
    }).catch(function(e) {
      console.log(e);
      self.setStatus('Error: Could not register land;');
    });
  }
};



window.addEventListener('load', function() {
  // Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 !== 'undefined') {
    console.warn("Using web3 detected from external source. If you find that your accounts don't appear or you have 0 MetaCoin, ensure you've configured that source properly. If using MetaMask, see the following link. Feel free to delete this warning. :) http://truffleframework.com/tutorials/truffle-and-metamask")
    // Use Mist/MetaMask's provider
    window.web3 = new Web3(web3.currentProvider);
  } else {
    console.warn("No web3 detected. Falling back to http://localhost:8545. You should remove this fallback when you deploy live, as it's inherently insecure. Consider switching to Metamask for development. More info here: http://truffleframework.com/tutorials/truffle-and-metamask");
    // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    window.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
  }

  App.start();
});

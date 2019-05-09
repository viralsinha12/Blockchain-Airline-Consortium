pragma solidity ^0.4.25;

contract Migrations {

  // A function with the signature `setCompleted(uint)` is required. -- start
  uint public last_completed_migration;
  function setCompleted(uint completed) public {
    last_completed_migration = completed;
  }
  // A function with the signature `setCompleted(uint)` is required. -- end

  struct requestLog{
    address requestedBy;
    address requestedTo;
    uint requestNumber;
  }

  struct responseLog{
    address responseBy;
    address responseTo;
    uint responseNumber;
  }

  struct payment{
    address sender;
    address receiver;
    uint value;
  }

  uint requests = 0;
  uint responses = 0;
  uint payments = 0;

  mapping(address=>bool) users;
  mapping(address=>bool) airlines;
  mapping(uint=>requestLog) requestLogs;
  mapping(uint=>responseLog) responseLogs;
  mapping(uint=>payment) paymentLogs;

  modifier onlyRegisteredAirlines
  {
    require(airlines[msg.sender]==true);
    _;
  }

  function registerUser(address userAddress) public {
      users[userAddress] = true;
  }

  function UnregisterUser(address userAddress) public {
      users[userAddress] = false;
  }

  function unregisterAirline(address airlineAddress) public {
      airlines[airlineAddress] = false;
  }

  function registerAirline(address airlineAddress) public {
      airlines[airlineAddress] = true;
  }

  function registerRequest(address requestedBy,address requestedTo,uint requestNumber) onlyRegisteredAirlines public{
    requestLog memory req = requestLogs[requests];
    req.requestedBy = requestedBy;
    req.requestedTo = requestedTo;
    req.requestNumber = requestNumber;
    requests = requests+1;
  }  

  function registerResponse(address responseBy,address responseTo,uint responseNumber) onlyRegisteredAirlines public{
    responseLog memory res = responseLogs[responses];
    res.responseBy = responseBy;
    res.responseTo = responseTo;
    res.responseNumber = responseNumber;
    responses = responses+1;
  }
}

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
    string bookingId;
  }

  struct responseLog{
    address responseBy;
    address responseTo;
    string bookingId;
    string requestStatus;
  }

  struct payment{
    address sender;
    address receiver;
    uint value;
  }

  uint requests = 0;
  uint responses = 0;
  uint payments = 0;

  mapping(address=>bool) airlines;
  mapping(uint=>requestLog) requestLogs;
  mapping(uint=>responseLog) responseLogs;
  mapping(uint=>payment) paymentLogs;

  function registerAirline(address airlineAddress) public {
      airlines[airlineAddress] = true;
  }

  function registerRequest(address requestedBy,address requestedTo,string memory bookingId) public{
    requestLog memory req = requestLogs[requests];
    req.requestedBy = requestedBy;
    req.requestedTo = requestedTo;
    req.bookingId = bookingId;
    requests = requests+1;
  }  

  function registerResponse(address responseBy,address responseTo,string memory bookingId,string memory requestStatus) public{
    responseLog memory res = responseLogs[responses];
    res.responseBy = responseBy;
    res.responseTo = responseTo;
    res.bookingId = bookingId;
    res.requestStatus = requestStatus;
    responses = responses+1;
  }

  function settlePayment(address sender,address receiver) public payable{
    receiver.transfer(msg.value);
    payment memory pay = paymentLogs[payments];
    pay.sender = sender;
    pay.receiver = receiver;
    pay.value = 1;
  }
}

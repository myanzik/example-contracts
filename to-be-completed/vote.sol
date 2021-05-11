pragma solidity ^0.6.4;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }


    mapping() public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping() hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added
    constructor() public {
    
    //TODO set contract caller as owner
    //TODO set some intitial cities.
    }
 
 
    function addCity() public {
      //  TODO: add city to the CityStruct

    }
    
    function vote() public {
        
        //TODO Vote the selected city through cityID

    }
    function getCity() public view returns (string memory) {
     // TODO get the city details through cityID
    }
    function getVote() public view returns (uint256) {
    // TODO get the vote of the city with its ID
    }
}

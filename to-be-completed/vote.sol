pragma solidity ^0.6.4;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        //you can add city details if you want
    }


    mapping(uint256 => City) public cities; //mapping city Id with the City ctruct - cityId should be uint256
    mapping(address => bool) hasVoted; //mapping to check if the address/account has voted or not

    address owner;
    uint256 public cityCount = 0; // number of city added
    constructor() public {
    
    //TODO set contract caller as owner
    //TODO set some intitial cities.
    owner = msg.sender;
    cities[0]=City("Lalitpur",0);
    cities[1]=City("Bhaktapur",0);
    cityCount = 2;
    }
 
    function addCity(string memory name) public {
      //  TODO: add city to the CityStruct
    require(CheckCity(name)==false, 'City Already Exists');
    cities[cityCount]=City(name,0);
    cityCount ++;
    }
    
    function vote(uint256 cityId) public {
        
        //TODO Vote the selected city through cityID
        require(hasVoted[msg.sender] == false, 'Already Voted');
        cities[cityId].vote +=1;
        hasVoted[msg.sender] = true;
    }

    function getCity(uint256 cityId) public view returns (string memory) {
     // TODO get the city details through cityID
    return cities[cityId].cityName;
    }

    function getVote(uint256 cityId) public view returns (uint256) {
    // TODO get the vote of the city with its ID
    return cities[cityId].vote;
    }
    
    function CheckCity(string memory name) private view returns(bool){
        for(uint256 i=0; i < cityCount; i++){
            if(keccak256(abi.encodePacked((cities[i].cityName))) == keccak256(abi.encodePacked((name))))
            return true;
        }
        return false;
    }
}

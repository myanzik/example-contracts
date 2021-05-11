pragma solidity ^0.6.4;

/**
 * @title Storage
 * @dev Store & retreive value in a variable
 */
contract Storage {

    uint256 number;
    int256 integer;
    bytes32 hexValue;
    address account;
    bool working;
    enum action {right,left}
    action choices;
    struct data{
        uint number;
        string name;
    }
    
    string someString;
    
    address admin;
    constructor() public {
        admin = msg.sender;
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        require(admin == msg.sender,'caller must be admin');
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retreive() public view returns (uint256){
        return number;
    }
}

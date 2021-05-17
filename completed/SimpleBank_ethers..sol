//A simple bank where customer will be enrolled and can deposit and withdraw ether

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/utils/Address.sol";

import "../ERC20.sol";

pragma solidity ^0.6.4;

contract SimpleBank{
    
    using SafeMath for uint;
    using Address for address;
    
    
    Token tokenContract;
    
    //
    // State variables
    //
    
    //create a mapping names balances that maps address to uint
    /* visibility: private --We want to protect our users balance from other contracts*/
    
    mapping(address=>uint) private balances;
    
    //create a mapping names enrolled that maps address to bool
    /*visibility: public --We want to create a getter function and allow contracts to be able to see if a user is enrolled.  */
    
   mapping(address=>bool) enrolled;
   
   //create address owner to store contracts owner address 
   address public owner;
    
    
      modifier OnlyOwner {
        require(owner == msg.sender,"only owner can execute this contract");
        _;
    }
    
    modifier isEnrolled {
        require(enrolled[msg.sender],'you should be enrolled to deposit');
        _;
    }

    //
    // Functions
    //

    /* Use the appropriate global variable to get the sender of the transaction */
    constructor(Token _tokenContract) public {
        /* Set the owner to the creator of this contract */
        owner = msg.sender;
        tokenContract = _tokenContract;
    }
    
    function getTokenName() public view returns(string memory){
        return tokenContract.name();
    }

    // Fallback function - Called if other functions don't match call or
    // sent ether without data
    // Typically, called when invalid data is sent
    // Added so ether sent to this contract is reverted if the contract fails
    // otherwise, the sender's money is transferred to contract
    receive() external payable {
        balances[owner] += msg.value;
    }

    /// @notice Get balance
    /// @return The balance of the user
    // A SPECIAL KEYWORD "view" prevents function from editing state variables;
    // allows function to run locally/off blockchain
    
    function getBalance() view public returns (uint) {
        /* Get the balance of the sender of this transaction */
     
        return balances[msg.sender];
    }

    /// @notice Enroll a customer with the bank
    /// @return The users enrolled status
    
    function enroll(address _account) public OnlyOwner returns (bool) {
        
      
    enrolled[_account] = true;
    
    return enrolled[_account];

    }

    /// @notice Deposit ether into bank
    /// @return The balance of the user after the deposit is made
    // the keyword "payable" means this function can receive ether
    // Global Variables : msg.sender == address of caller of this contract
                        //msg.value == amount of ether sent while calling this function 
    
    function deposit() public payable isEnrolled returns (uint)  {
        /* Add the amount to the user's balance, call the event associated with a deposit,
          then return the balance of the user */
    //    msg.value
     
     require(msg.value != 0 , "deposit amount cannot be zero");
     
     balances[msg.sender] =  balances[msg.sender].add(msg.value) ;
     
     return balances[msg.sender];
    
    }

    /// @notice Withdraw ether from bank
    /// @dev This does not return any excess ether sent to it
    /// @param withdrawAmount amount you want to withdraw
    /// @return The balance remaining for the user
    function withdraw(uint withdrawAmount) public isEnrolled returns (uint) {
        /* If the sender's balance is at least the amount they want to withdraw,
           Subtract the amount from the sender's balance, and send that amount of ether
           to the user attempting to withdraw. 
           return the user's balance.*/
    
        require(withdrawAmount <= balances[msg.sender],'not enough balance in your account');
        
        balances[msg.sender] =  balances[msg.sender].sub(withdrawAmount)  ;
        address payable ac = msg.sender;
        ac.transfer(withdrawAmount);
        return balances[msg.sender];

    }
    
    
    function getContracttBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    
    function checkAddress(address _account) public view returns(bool){
        return _account.isContract();
    }

}
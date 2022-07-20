pragma solidity ^0.5.0;

contract JointSavings{
    address payable accountOne = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb ;
    address payable accountTwo = 0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0; 
    address public lastToWithdraw; 
    uint public lastWithdrawAmount;
    uint public contractBalance;

    function withdraw(uint amount, address payable recipient) public{
        require(recipient == accountOne || recipient ==  accountTwo, "You don't own this account");
        
        require (contractBalance >= amount, "Insufficient funds!");
        
        if (lastToWithdraw != recipient){
            lastToWithdraw = recipient;
        }
        recipient.transfer(amount); 
        lastWithdrawAmount = amount; 
        contractBalance = address(this).balance;
    }

    
    function deposit() public payable {
        contractBalance = address(this).balance;
    }

    function setAccounts(address payable account1, address payable account2) public{
        accountOne = account1;  
        accountTwo = account2;
    }

    function() external payable {}
}


/*
Joint Savings Account
---------------------
// Define a new contract named `JointSavings`
contract JointSavings {

    /*
    Inside the new contract define the following variables:
    - Two variables of type `address payable` named `accountOne` and `accountTwo`
    - A variable of type `address public` named `lastToWithdraw`
    - Two variables of type `uint public` named `lastWithdrawAmount` and `contractBalance`.
    */
    // See lines 3-8. 

    /*
    Define a function named **withdraw** that will accept two arguments.
    - A `uint` variable named `amount`
    - A `payable address` named `recipient`
    */
    function withdraw(uint amount, address payable recipient) public {

        /*
        Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`. The `requiere` statement returns the text `"You don't own this account!"` if it does not.
        */
        // See line 11. 

        /*
        Define a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. If there are insufficient funds, the text `Insufficient funds!` is returned.
        */
        // See line 13. 

        /*
        Add and `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient` If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        */
        // See lines 15-17. 

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        // See line 18. 

        // Set  `lastWithdrawAmount` equal to `amount`
        // See line 19.

        // Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
        // See line 20. 
    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {

        /*
        Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance`.
        */
        // See line 25. 
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        // See lines 29-30. 
    }

    /*
    Finally, add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
    */
    // See line 33. 
}

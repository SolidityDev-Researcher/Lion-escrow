// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function mint(address to, uint amount) external;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    event Deposited(address indexed depositor, uint256 amount);
    event Released(address indexed depositor, uint256 amount, uint256 fee);

}


contract Lion_Escrow{
    
    address public immutable Escrow_Owner;
    address public EscrowToken;

    mapping ( address => Depositor_Info) public Escrower;
    // mapping ( address => uint256) public balanceOf;

    struct Depositor_Info{
        uint256 amount;
        address depositor_address;
        uint256 time;
        uint256 fees;
    }   

    uint256 fees;

    constructor(){
        Escrow_Owner= payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        EscrowToken= 0x5FbDB2315678afecb367f032d93F642f64180aa3;
    }

    function Deposit(uint256 amount) public returns (bool) {
    require(amount > 0, "Amount must be greater than 0");

    // Transfer tokens from depositor to Lion_Escrow
    bool success = IERC20(EscrowToken).transferFrom(
        msg.sender,
        address(this),
        amount
    );
    require(success, "Token transfer failed");

    // Store deposit info
    uint256 fee = amount * 5 / 100;
    uint256 netAmount = amount - fee;


    Depositor_Info storage depositors= Escrower[msg.sender];
    depositors.amount+= netAmount;
    depositors.depositor_address= msg.sender;
    depositors.time= block.timestamp;
    depositors.fees+=fee;


    emit IERC20.Deposited(msg.sender, amount);
    return true;
}

    function Release(address _escrower)public onlyOwner returns (bool){
        require(Escrower[_escrower].amount > 0, "Escrower has no funds");

        uint release_Amount= Escrower[_escrower].amount;
        uint fee= Escrower[_escrower].fees;


    // Transfer tokens from Lion_Escrow to depositor
        IERC20(EscrowToken).transfer(_escrower, release_Amount);
        IERC20(EscrowToken).transfer(Escrow_Owner, fee);

        delete Escrower[_escrower];
        emit IERC20.Released(_escrower, release_Amount, fee);
        return true;
    }

     modifier onlyOwner(){
         require(msg.sender == Escrow_Owner, "Not Owner");
      _;
    }



}
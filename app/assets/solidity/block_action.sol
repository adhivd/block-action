pragma solidity ^0.4.0;

contract BlockAction {

    //goal is to use this to store other key information (preferred payment type, etc)
    struct ClassMember {
        uint share; //out of 1 million
        uint preferred_payment;
    }

    address admin; //super user the can initiate suits, trades, settlements
    bytes32 suit;  //name of suit


    mapping(address => ClassMember) members;
    address[] member_addresses; // ??? used to iterate, seems like arrays are inefficient
                                // they seemed like the most logical way to iterate

    constructor(bytes32 _suit) public {
        admin = msg.sender;
        suit = _suit;
    }

    /*
        BlockAction.at('0x4acecbe230cf637ac5f07934e2b57916bb72bc36').start_suit(["0x14723a09acff6d2a60dcdf7aa4aff308fddc160c", "0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db", "0x583031d1113ad414f02576bd6afabfb302140225"], [333333,333333,333333], [1,1,1])

        Starts a suit by assigning class members shares of the settlement as defined
        by numbers less that 1 million (1/3 of the settlement = 1 million / 3)
    */
    function start_suit(address[] class_members, uint32[] shares, uint32[] preferred_payments) public returns (uint error_code){
        require (msg.sender == admin);
        require (class_members.length == shares.length);
        require (class_members.length == preferred_payments.length);
        for (uint i = 0; i < class_members.length; i++) {
            members[class_members[i]].share = uint(shares[i]);
            members[class_members[i]].preferred_payment = uint(preferred_payments[i]);
        }
        member_addresses = class_members;
        return 0;
    }



    function transfer(address from, address to, uint shares_to_transfer) public returns (uint error_code) {
        require(msg.sender != admin || msg.sender != from); //incorrect sender
        require (members[from].share > shares_to_transfer) ; //insufficient balance
        members[to].share += shares_to_transfer;
        members[from].share -= shares_to_transfer;
        return 0; //success
    }

    /*
        BlockAction.at('0x4acecbe230cf637ac5f07934e2b57916bb72bc36').settle({value: 1000000000000000000})

        Admin sends money to this function and that money gets sent to all the class members
    */
    function settle() public payable {

        require (msg.sender == admin);
        uint balance = msg.value;
        for (uint i = 0; i < member_addresses.length; i++) {
            address member_address = member_addresses[i];
            uint settlement_share = (members[member_address].share*balance)/1000000;
            member_address.transfer(settlement_share);
        }
    }

    function () public payable {
        revert();
    }
}

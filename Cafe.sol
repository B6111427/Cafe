pragma solidity ^0.5.1;

contract Cafe {  
    
    struct Ordersdata{
        string name;
        uint datetime;
        address owner;
    }

    Ordersdata[] Order;
    uint count = 0;
    //--Event--
    event OrderAdded(
      address from,
      string text,
      uint datetime
      );
      
    event OrderError(
        address from,
        string text,
        string reason
      );
      
  
    function StoreData(address sender,string memory menu) private{
        emit OrderAdded(msg.sender,menu,now);
        Ordersdata memory data;
        data.name = menu;
        data.datetime = now;
        data.owner = sender;
        Order.push(data);
        count++;
    }
    //Create Order
    function CreateOrder(string memory name) public payable{
       if(msg.value == 0.02 ether && hashing(name) == hashing("Chocolate Fondu")){
           StoreData(msg.sender,name);
       }
       else if(msg.value == 0.025 ether && hashing(name) == hashing("Caramelised Apple Crumble")){
           StoreData(msg.sender,name);
       }
       else if(msg.value == 0.03 ether && hashing(name) == hashing("Cocoa Toffee Banana Crunch")){
           StoreData(msg.sender,name);
       }
       else if(msg.value == 0.01 ether && hashing(name) == hashing("Espresso")){
           StoreData(msg.sender,name);
       }
       else if(msg.value == 0.015 ether && hashing(name) == hashing("Americano")){
           StoreData(msg.sender,name);
       }
       else if(msg.value == 0.02 ether && hashing(name) == hashing("Latte")){
           StoreData(msg.sender,name);
       }
       else{
           string memory message = "Incorrect amount of Ether. For order";
           emit OrderError(msg.sender,name,message);
           msg.sender.transfer(msg.value);
       }
    }
  
    //SHA256 for Integrity
    function hashing(string memory name) private pure returns (bytes32){
            return sha256(bytes(name));
    }
    function GetOrderName(uint i) public view returns (string memory){
        return Order[i].name;
    }
    function GetOrdeDate(uint i) public view returns (uint){
        return Order[i].datetime;
    }  
    function GetOrderOwner(uint i) public view returns (address){
        return Order[i].owner;
    }  
    function GetCount() public view returns (uint){
        return count;
    } 
    

}
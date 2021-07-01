//SPDX-License-Identifier: 123

pragma solidity >=0.4.22 <0.9.0;

contract myContract {
    int public myInt = 1;
    uint public myUint = 1;
    uint256 public myUint256 = 1;

    string public myString = "hello world";

    address public myAddress = 0xDd80dC4C59185205d9C63b802ca4A3e18ddaE82F;

    string[] public values;

    struct MyPerson {
        uint myUint;
        string myName;
    }

    mapping(uint => string) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    uint[] public numbers = [1,2,3,4,5,6,7,8,10];

    address public owner;




    struct Book {
        string title;
        string author;
    }

    function isEven(uint _number) public pure returns(bool) {
        if(_number % 2 == 0) {
            return  true;
        } else {
            return false;
        }
    }

    function countEvenNum() public view returns(uint) {
        uint count = 0;

        for(uint i = 0; i < numbers.length; i ++) {
            if(isEven(numbers[i])) {
                count++;
            }
        }
            return count;
    }






    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }



    MyPerson public myPerson = MyPerson(1, "Hi");

    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function valueCount() public view returns (uint) {
        return values.length;
    }

}
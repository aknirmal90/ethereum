^pragma solidity 0.13.4

contract Purse {
	
	address public owner;
	address[] whitelist;

	modifier onlyOwner {
		require(msg.sender=owner);
		_;
	}

	function getWhitelist() onlyOwner returns address[] {
		return whitelist;
	}

	function addToWhitelist(address _addr) onlyOwner returns bool {
		require(_addr != 0x);
		whitelist.push(_addr);
		return True;
	}

	function removeFromWhitelist(address _addr) onlyOwner returns bool {
		for (uint i=0; i < whitelist.length; i++) {
			if (whitelist[i] == _addr) {
				whitelist.pop(i);
				return True;
			}
		}
	return False;
	}

	function getTotalValue() onlyOwner returns uint256 constant {
		uint256 balance = 0;
		for (uint i=0; i < whitelist.length; i++) {
			balance += whitelist[i].balance;
		}
		return balance;
	}

	function getPiecewiseValue() onlyOwner return uint256 constant {
		mapping balances[address => uint256];
		for (uint i=0; i < whitelist.length; i++) {
			balance += whitelist[i].balance;
		}
		return balances;		
	}
}
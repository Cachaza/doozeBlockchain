pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Dooze is ERC1155, ERC1155Burnable, Ownable, ERC1155Supply {
    string public name = "Dooze Token";

    uint256 public constant Sudadera1 = 1;
    uint256 public constant Sudadera2 = 2;

    constructor() ERC1155("https://raw.githubusercontent.com/Cachaza/doozeBlockchain/main/{id}.json") {
        name = name;
        _mint(msg.sender, Sudadera1, 40, "");
        _mint(msg.sender, Sudadera2, 55, "");
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }



    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
    function uri(uint256 _tokenid) override public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://raw.githubusercontent.com/Cachaza/doozeBlockchain/main/000000000000000000000000000000000000000000000000000000000000000",
                Strings.toString(_tokenid),".json"
            )
        );
    }

}

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract YourContract is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address public _contract_owner;

    constructor() ERC721("Artifacts", "FACTS") {
        // TODO change this to msg.sender
        _contract_owner = 0xe66c9fFe7BC3a00fD3C967f49c823246ca14e908;
    }

    modifier onlyOwner() {
        require(msg.sender == _contract_owner);
        _;
    }

    function awardItem(address player, string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}

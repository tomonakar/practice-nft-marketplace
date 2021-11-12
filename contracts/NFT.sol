//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// openzeppelin ERC721 NFT の機能を呼び出す

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;

    // tokenIdsを追跡するためのカウンター
    Counters.Counter private _tokenIds;
    // NFTマーケットプレイスのアドレスを追加する
    address contractAddress;

    // OBJ: NFTマーケットプレイスに、トークンを取引したり所有者を変更する機能を追加する
    // setApprovalForAllを使用すると、contractアドレスを使用してこれを行うことができます

    // アドレスをセットするコンストラクター
    constructor(address marketplaceAddress) ERC721("KryptoBirdz", "KBIRDZ") {
        contractAddress = marketplaceAddress;
    }

    // memo: 文字列はバイト配列であり、それらはEVMのストレージを占有するので、関数を実行する際はガスを削減するためにmemoryを使用する
    function mintToken(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        // NFTを鋳造する
        _mint(msg.sender, newItemId);

        // set the token URI: id and url
        _setTokenURI(newItemId, tokenURI);
        // give the marketplace the approval to transact between users
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}

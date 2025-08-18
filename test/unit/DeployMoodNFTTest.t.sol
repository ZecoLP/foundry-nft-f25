// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNFT} from "script/DeployMoodNFT.s.sol";

contract DeployMoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri =
            "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIwIiB5PSIxNSIgZmlsbD0iYmxhY2siPiBIaSEgWW91ciBicm93c2VyIGRlY29kZWQgdGhpcyEgPC90ZXh0Pjwvc3ZnPg==";
        string memory svg =
            '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black"> Hi! Your browser decoded this! </text></svg>';
        string memory actualUri = deployer.svgToImageUri(svg);
        assert(keccak256(abi.encodePacked(expectedUri)) == keccak256(abi.encodePacked(actualUri)));
    }
}

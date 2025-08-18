// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNFT is Script {
    function run() external returns (MoodNFT) {
        string memory sadSvg = vm.readFile("img/sad.svg");
        string memory happySvg = vm.readFile("img/happy.svg");

        vm.startBroadcast();
        MoodNFT moodNFT = new MoodNFT(svgToImageUri(sadSvg), svgToImageUri(happySvg));
        vm.stopBroadcast();
        return moodNFT;
    }

    function svgToImageUri(string memory svg) public pure returns (string memory) {
        // example:
        // <svg viewBox="0 0 200 200" width="400"  height="400" ...>
        // data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDA..

        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}

// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Verifier} from "./Verifier.sol";
import {IVerifier} from "./chain-interfaces/IVerifier.sol";

contract TestnetVerifier is Verifier {
    constructor() {
        assert(block.chainid != 1);
    }

    function verify(uint256[] calldata _publicInputs, uint256[] calldata _proof) public view override returns (bool) {
        // We allow skipping the zkp verification for the test(net) environment
        // If the proof is not empty, verify it, otherwise, skip the verification
        if (_proof.length == 0) {
            return true;
        }

        return super.verify(_publicInputs, _proof);
    }
}

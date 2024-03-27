//SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.8.20;

import {HorseStore} from "../../src/HorseStoreV1/HorseStore.sol";
import {Test, console} from "forge-std/Test.sol";

abstract contract Base_TestV1 is Test {
    HorseStore public horseStore;

    function setUp() public virtual {
        horseStore = new HorseStore();
    }

    function testReadHorses() external view {
        uint256 initialNumber = horseStore.readNumberOfHorses();
        assertEq(initialNumber, 0);
    }

    function testUpdateHorses(uint256 numberOfHorses) external {
        horseStore.updateHorseNumber(numberOfHorses);
        assertEq(horseStore.readNumberOfHorses(), numberOfHorses);
    }
}

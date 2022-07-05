// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from 'forge-std/Test.sol';

import {PayloadBountyHacxykFallbackOracle} from '../src/contracts/PayloadBountyHacxykFallbackOracle.sol';
import {GovHelpers, IAaveGov} from './helpers/AaveGovHelpers.sol';

contract PayloadBountyHacxykFallbackOracleTest is Test {
  function setUp() public {}

  function testPayment() public {
    PayloadBountyHacxykFallbackOracle payload = new PayloadBountyHacxykFallbackOracle();

    address[] memory targets = new address[](1);
    targets[0] = address(payload);
    uint256[] memory values = new uint256[](1);
    values[0] = 0;
    string[] memory signatures = new string[](1);
    signatures[0] = 'execute()';
    bytes[] memory calldatas = new bytes[](1);
    calldatas[0] = '';
    bool[] memory withDelegatecalls = new bool[](1);
    withDelegatecalls[0] = true;

    IAaveGov.SPropCreateParams memory createParams = IAaveGov
      .SPropCreateParams({
        executor: GovHelpers.SHORT_EXECUTOR,
        targets: targets,
        values: values,
        signatures: signatures,
        calldatas: calldatas,
        withDelegatecalls: withDelegatecalls,
        ipfsHash: bytes32(0)
      });

    uint256 proposalId = GovHelpers.createProposal(vm, createParams);

    uint256 balanceRecipientUsdcBefore = payload.USDC().balanceOf(
      payload.FUNDS_RECIPIENT()
    );

    GovHelpers.passVoteAndExecute(vm, proposalId);

    uint256 balanceRecipientUsdcAfter = payload.USDC().balanceOf(
      payload.FUNDS_RECIPIENT()
    );

    require(
      balanceRecipientUsdcAfter ==
        balanceRecipientUsdcBefore + payload.USDC_AMOUNT(),
      'INVALID_FUNDS_RECEIVED'
    );
  }
}

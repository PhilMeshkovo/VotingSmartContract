// SPDX-License-Identifier: MIT
pragma solidity  >=0.7.0 <0.9.0;

import "remix_tests.sol"; // импорт тестовых библиотек Remix
import "remix_accounts.sol"; // импорт для работы с аккаунтами

import "./Voting.sol"; // импорт тестируемого контракта

contract VotingTest {
    Voting voting;

     function beforeAll() public {
        // Инициализация контракта с начальными предложениями
        string[] memory initialProposals = new string[](3);
        initialProposals[0] = "Proposal 1";
        initialProposals[1] = "Proposal 2";
        initialProposals[2] = "Proposal 3";
        voting = new Voting(initialProposals);
    }

    // Тест на добавление предложения
    function testAddProposal() public {
        (string memory description, uint256 voteCount) =  voting.getProposal(2);
        Assert.equal(description, "Proposal 3", "The proposal description should be 'Proposal 3'");
        Assert.equal(voteCount, 0, "The initial vote count should be 0");
    }

    // Тест на голосование
    function testVote() public {
        voting.vote(0);
        (, uint voteCount) = voting.getProposal(0);
        Assert.equal(voteCount, 1, "The vote count for proposal 0 should be 1");
    }

    // Тест на проверку всех предложений
    function testGetAllProposals() public {
        (string memory description1, uint256 voteCount1) = voting.getProposal(0);
        (string memory description2, uint256 voteCount2) = voting.getProposal(1);
        (string memory description3, uint256 voteCount3) = voting.getProposal(2);
        Assert.equal(description1, "Proposal 1", "The proposal description should be 'Proposal 1'");
        Assert.equal(voteCount1, 0, "The initial vote count should be 0 for Proposal 1");
        Assert.equal(description2, "Proposal 2", "The proposal description should be 'Proposal 2'");
        Assert.equal(voteCount2, 0, "The initial vote count should be 0 for Proposal 2");
        Assert.equal(description3, "Proposal 3", "The proposal description should be 'Proposal 3'");
        Assert.equal(voteCount3, 0, "The initial vote count should be 0 for Proposal 3");
    }
}

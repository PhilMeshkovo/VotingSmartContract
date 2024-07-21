// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Voting {
    struct Proposal {
        string description;
        uint voteCount;
    }

    address public chairperson;
    mapping(address => bool) public hasVoted;
    Proposal[] public proposals;

    event VoteCasted(address voter, uint proposalIndex);

    modifier onlyChairperson() {
        require(msg.sender == chairperson, "You are not the chairperson.");
        _;
    }

    constructor(string[] memory proposalDescriptions) {
        chairperson = msg.sender;

        for (uint i = 0; i < proposalDescriptions.length; i++) {
            proposals.push(Proposal({
                description: proposalDescriptions[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint proposalIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(proposalIndex < proposals.length, "Invalid proposal index.");

        hasVoted[msg.sender] = true;
        proposals[proposalIndex].voteCount += 1;

        emit VoteCasted(msg.sender, proposalIndex);
    }

     function addProposal(string memory description) public  {
        proposals.push(Proposal({
            description: description,
            voteCount: 0
        }));
    }

    function getProposal(uint proposalIndex) public view onlyChairperson returns (string memory description, uint voteCount) {
        require(proposalIndex < proposals.length, "Invalid proposal index.");
        
        Proposal storage proposal = proposals[proposalIndex];
        return (proposal.description, proposal.voteCount);
    }

    function getAllProposals() public view onlyChairperson returns (Proposal[] memory) {
        return proposals;
    }

    function getWinningProposal() public view returns (string memory winningProposalDescription) {
        uint winningVoteCount = 0;
        uint winningProposalIndex = 0;

        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposalIndex = i;
            }
        }

        return proposals[winningProposalIndex].description;
    }
}

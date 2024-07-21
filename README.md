# VotingSmartContract
Voting Smart Contract With Tests


1. **Voting contract**: This is the smart contract that will hold all the logic related to the voting process. 

2. **Proposal struct**: A structure named `Proposal` is defined with two properties - `description` and `voteCount`. The description is a string containing the proposal details, while vote count represents how many votes this proposal has received.

3. **chairperson variable**: This is an address that will be set to the creator of the contract when it's deployed (i.e., the chairperson). It can only perform certain operations if they are the chairperson.

4. **hasVoted mapping**: A boolean mapping is used to keep track of which addresses have already voted in this election. This prevents an address from voting multiple times.

5. **proposals array**: An array containing all proposals. Proposals can be added during the contract's initialization or by the chairperson after the fact.

6. **VoteCasted event**: Each time a vote is cast, this event will emit an address of the voter and the index of the proposal they voted for. 

7. **onlyChairperson modifier**: This function modifier checks if the sender of the transaction is the chairperson before executing certain functions.

8. **Constructor function**: The constructor function takes an array of strings (proposal descriptions) as input and creates a new `Proposal` for each description in the proposals array, initializing vote count to 0. It also sets the sender's address as the chairperson.

9. **vote() function**: A public function that allows an address to cast their vote for a proposal. The voter must not have already voted and the proposal index must be valid. After successful casting, it increments the vote count of the chosen proposal and logs the vote in the `VoteCasted` event.

10. **addProposal() function**: A public function that allows the chairperson to add a new proposal with an initial vote count of 0.

11. **getProposal() function**: A public view function that returns the description and vote count for a specific proposal. The chairperson can only call this function.

12. **getAllProposals() function**: A public view function that returns all proposals in an array. The chairperson can only call this function.

13. **getWinningProposal() function**: A public view function that iterates over the proposals and returns the description of the proposal with the highest vote count. 

This is a simple voting system smart contract. In real-world scenarios, more complex data structures or functions might be necessary to handle different use cases.

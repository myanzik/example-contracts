pragma solidity ^0.5.0;

contract ProofOfExistence {
      // state
      
      mapping(bytes32 => address) storedBy;
      mapping(bytes32 => uint256) storedOn;
      
      
      struct doc {
          address storedBy;
          uint256 storedOn;
      }

        mapping(bytes32 => doc) docs;
      // calculate and store the proof for a document
      // *transactional function*
      function notarize(string memory _document) public {
        bytes32 proof = proofFor(_document);
        storedBy[proof] = msg.sender;
        storedOn[proof] = block.timestamp;
        // docs[proof].storedBy = msg.sender;
        // docs[proof].storedOn= block.timestamp;
      }

      // helper function to get a document's sha256
      // *read-only function*
      function proofFor(string memory _document) public pure returns (bytes32) {
        return sha256(abi.encodePacked(_document));
      }
      
      
      function getStorer(string memory _document) public view returns (address){
            bytes32 proof = proofFor(_document);
            return storedBy[proof];
      }
      
      
      function getDoc(string memory _document) public view returns(address,uint256){
          bytes32 proof = proofFor(_document);
          return (storedBy[proof],storedOn[proof]);
      }
      

}

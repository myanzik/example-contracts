pragma solidity ^0.5.0;

contract ProofOfExistence3 {

  mapping (bytes32 => bool) private proofs;
  
  // store a proof of existence in the contract state
  function storeProof(bytes32 proof) 
    internal 
  {

  }
  
  // calculate and store the proof for a document
  function notarize(string memory document) 
    public 
  { 

  }
  
  // helper function to get a document's keccak256 hash
  function proofFor(string memory document) 
    pure 
    private 
    returns (bytes32) 
  {
 
  }
  
  // check if a document has been notarized
  function checkDocument(string memory document) 
    public 
    view 
    returns (bool) 
  {

  }

  // returns true if proof is stored
  function hasProof(bytes32 proof) 
    internal 
    view 
    returns(bool) 
  {

  }
}

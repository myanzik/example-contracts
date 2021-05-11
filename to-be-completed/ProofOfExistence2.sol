pragma solidity ^0.5.0;

contract ProofOfExistence2 {

  // state
  bytes32[] private proofs;

  // store a proof of existence in the contract state
  // *transactional function*
  function storeProof(bytes32 proof) 
    public 
  {
  
  }

  // calculate and store the proof for a document
  // *transactional function*
  function notarize(string calldata document) 
    external 
  {

  }

  // helper function to get a document's sha256
  // *read-only function*
  function proofFor(string memory document) 
    pure 
    public 
    returns (bytes32) 
  {
    
  }

  // check if a document has been notarized
  // *read-only function*
  function checkDocument(string memory document) 
    public 
    view 
    returns (bool) 
  {
    
  }

  // returns true if proof is stored
  // *read-only function*
  function hasProof(bytes32 proof) 
    internal 
    view 
    returns (bool) 
  {
   
}

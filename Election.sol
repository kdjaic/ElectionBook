pragma solidity ^0.5.0;


contract Election {

	struct Candidate{
		uint id;
		string ime;
    string vrsta;
		uint brojacGlasova;
	}	
    
  mapping(address => bool) public biraci;
	mapping(uint => Candidate)public candidates;
	uint public candidatesCount;

  event glasDogadjaj(
  	uint indexed _candidateId
  	);

  constructor() public {
  	dodajKnjigu("Mladić", "Roman");
  	dodajKnjigu("Kockar", "Roman");
    dodajKnjigu("Zločin i kazna", "Filozofska fikcija");
    dodajKnjigu("Zapisi iz mrtvog doma", "Filozofska fikcija");
    dodajKnjigu("Idiot", "Filozofska fikcija");
  }

  function dodajKnjigu (string memory _ime, string memory _vrsta)private {
  	candidatesCount ++;
  	candidates[candidatesCount] = Candidate(candidatesCount, _ime, _vrsta, 0);
  	}

  function glas (uint _candidateId)public{
  	require(!biraci[msg.sender]);
  	require(_candidateId > 0 && _candidateId <= candidatesCount);
  	biraci[msg.sender] = true;
  	candidates[_candidateId].brojacGlasova ++;
  	emit glasDogadjaj(_candidateId);
  	}
}


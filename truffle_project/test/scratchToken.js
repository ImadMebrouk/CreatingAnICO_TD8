const ScratchToken = artifacts.require('../contracts/ScratchToken');
const assert = require('assert')


contract('ScratchToken', function ([_, _owner]) {

	beforeEach(async () => {
		contractInstance = await ScratchToken.new();
	});


      it('returns token name', async () => {

     const name = await contractInstance.name()
     const expected = "Berry"

     assert.equal(name, expected, 'Another Name should be expected')
  })


      it('returns token symbol', async () => {

       const name = await contractInstance.symbol()
       const expected = "BRY"

       assert.equal(name, expected, 'Another Symbol should be expected')
    })










});

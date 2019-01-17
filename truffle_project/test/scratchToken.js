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


		it('returns token decimal number', async () => {

		 const value = await contractInstance.decimals()
		 const expected = 5

		 assert.equal(value, expected, 'the expected number is 5')
	})


	it('returns token total supply amount', async () => {

	 const value = await contractInstance.totalSupply()
	 const expected = 200000;

	 assert.equal(value, expected, 'the expected number is 200000')
})


	it('returns balance of owner', async () => {

	 const value = await contractInstance.balanceOf("0x18B283c7B7b811334C05e057104B617720E0EFD6")
	 const expected = 10

	 assert.equal(value, expected, 'the expected type of is uint256')
})








});

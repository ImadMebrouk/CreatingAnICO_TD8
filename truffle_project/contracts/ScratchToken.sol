pragma solidity >=0.4.21 <0.6.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract ScratchToken is ERC20 {
    mapping (address => uint256) private _balances; // array with all adress
    mapping (address => mapping (address => uint256)) private _allowed;
    string  public _name     = "Berry";          // name of the token
    string  public _symbol   = "BRY";            // symbole of the token
    uint8   public _decimals = 5 ;             // the number of decimals the token uses
    uint256 public _totalSupply = 200000;               // Total token supply.
    address public _owner;                    // owner of the token


    constructor() public {
        _owner = msg.sender;
        _balances[_owner] = 10;
    }

    /**
    * @dev Returns the name of the token
    */
    function name() public view returns (string memory ) {
        return _name;
    }


    /**
    * @dev Returns the symbol of the token
    */
    function symbol() public view returns (string memory ) {
        return _symbol;
    }


    /**
    * @dev Returns the number of decimals the token uses
    */
    function decimals() public view returns (uint8 ) {
        return _decimals;
    }



      /**
    * @dev Total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }


        /**
    * @dev Transfer token for a specified address
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function transfer(address to, uint256 value) public returns (bool success) {
        _transfer(msg.sender, to, value);
        return true;
    }


    /**
     * @dev Transfer tokens from one address to another.
     * Note that while this function emits an Approval event, this is not required as per the specification,
     * and other compliant implementations may not emit the event.
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        _transfer(from, to, value);
        emit Approval(from, msg.sender, _allowed[from][msg.sender]);
        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public returns (bool success) {
        require(spender != address(0));

        _allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    /**
     * @dev Returns the amount which _spender is still allowed to withdraw from _owner
     * @param spender The address which will spend the funds.
     * @param owner The amount of tokens to increase the allowance by.
     */
    function allowance(address owner, address spender) public view returns (uint256 remaining) {
        return _allowed[owner][spender];
    }
}

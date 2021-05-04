pragma solidity ^0.8.2;


contract DefiMified {
    
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;

    address teamZeroFive = 0x0066cB17b64C02F449Bc3E3E94941256c35d72e1;
    address teamZeroFive1 = 0xc1Aa634bAE45385350DbE2fA13A8768bD2D70fDe;
    address teamZeroFive2 = 0x61db7035029112Ed38BAf3E0DB8033B126eBbB7b;
    address teamZeroTwo = 0x4e897c054ceC7828f816F5c8bd1d1e794aa97944;
    address teamZeroThree = 0x594BfE29452E743b68ac41eAa833995B4f7588ad;
    address teamFive = 0xFeE461BdE162E7B42C1963Bc14Cd529cbcB7d96F;
    address teamThree = 0x480d53314C6C8C9f5677129D3b7d87C9aad39aC6;
    address buildingIncentive = 0x3b7850E0cc2c7377B76120a818aAadf7972C107F;
    address communityMarketing = 0xa77881FdFd8Bba44f78cb3d2bB648F3e87EB01d3;
    address ecosystem = 0x5f7Bdcfd010Bf527692e7110EDcC30364a51f711;
    address tokenSale = 0x5f7Bdcfd010Bf527692e7110EDcC30364a51f711;

    uint256 deadlineBuildingIncentive = block.timestamp + 182 days;
    uint256 totalValueUnlockedBuildingIncentive = 0;
    uint256 unlockValueForBuildingIncentive = 9000000;

    uint256 deadlineThree = block.timestamp + 182 days;
    uint256 totalValueVestedForThree = 0;
    uint256 vestingValueForThree = 270000;


    uint256 deadlineFive = block.timestamp + 365 days;
    uint256 totalValueVestedForFive = 0;
    uint256 vestingValueForFive = 450000;


    uint256 deadlineZeroTwo = block.timestamp + 91 days;
    uint256 totalValueVestedForZeroTwo = 0;
    uint256 vestingValueForZeroTwo = 18000;


    uint256 deadlineZeroThree = block.timestamp + 91 days;
    uint256 totalValueVestedForZeroThree = 0;
    uint256 vestingValueForZeroThree = 27000;


    uint256 deadlineZeroFive = block.timestamp + 91 days;
    uint256 totalValueVestedForZeroFive = 0;
    uint256 vestingValueForZeroFive = 45000;


    uint public totalSupply = 90000000 * 10 ** 18;
    string public name = "DefiMified";
    string public symbol = "DEMI";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner1, address indexed spender, uint value);

    constructor(){
        balances[tokenSale] = (totalSupply * 20 / 100);
        balances[ecosystem] = (totalSupply * 10 / 100);
        balances[communityMarketing] = (totalSupply * 15 / 100);
    }




    modifier isOnlyZeroFiveType() {
        require((msg.sender == teamZeroFive) || (msg.sender == teamZeroFive1) || (msg.sender == teamZeroFive2));
        _;
    }
    modifier timePassedZeroFive() {
        require(block.timestamp >= deadlineZeroFive);
        _;
    }


    modifier isOnlyZeroThreeType() {
        require(msg.sender == teamZeroThree);
        _;
    }
    modifier timePassedZeroThree() {
        require(block.timestamp >= deadlineZeroThree);
        _;
    }



    modifier isOnlyZeroTwoType() {
        require(msg.sender == teamZeroTwo);
        _;
    }
    modifier timePassedZeroTwo() {
        require(block.timestamp >= deadlineZeroTwo);
        _;
    }


    modifier isOnlyFiveType() {
        require(msg.sender == teamFive);
        _;
    }
    modifier timePassedFive() {
        require(block.timestamp >= deadlineFive);
        _;
    }

    
    modifier isOnlyThreeType() {
        require(msg.sender == teamThree);
        _;
    }
    modifier timePassedThree() {
        require(block.timestamp >= deadlineThree);
        _;
    }   


    modifier isOnlyBuildingIncentive() {
        require(msg.sender == buildingIncentive);
        _;
    }
    modifier timePassedBuildingIncentive() {
        require(block.timestamp >= deadlineBuildingIncentive);
        _;
    }

    modifier isVestingEnded(uint256 value1, uint256 value2){
        require(value1 < value2);
        _;
    }

    function balanceOf(address owner1) public view returns(uint){
        return balances[owner1];
    }
    

    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(msg.sender)>= value, "Sorry you dont have enough tokens");
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender,to,value);
        return true;
    }
    

    function transferFrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, "Sorry you dont have enough tokens");
        require(allowance[from][msg.sender] >= value, "Allowance too low");
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    
    function approve(address spender, uint value) public returns(bool){
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    
    function VestingForZeroFive() public timePassedZeroFive isOnlyZeroFiveType isVestingEnded(totalValueVestedForZeroFive, 450000){
        balances[teamZeroFive] += 45000;
        balances[teamZeroFive1] += 45000;
        balances[teamZeroFive2] += 45000;
        totalValueVestedForZeroFive += 45000;
        deadlineZeroFive += 31 days;
    }

    function VestingForZeroThree() public timePassedZeroThree isOnlyZeroThreeType isVestingEnded(totalValueVestedForZeroThree,270000){
        balances[teamZeroThree] += 27000;
        totalValueVestedForZeroThree += 27000;
        deadlineZeroThree += 31 days;
    }

    function VestingForZeroTwo() public timePassedZeroTwo isOnlyZeroTwoType isVestingEnded(totalValueVestedForZeroTwo, 180000){
        balances[teamZeroTwo] += 18000;
        totalValueVestedForZeroTwo += 18000;
        deadlineZeroTwo += 31 days;
    }

    function VestingForFive() public timePassedFive isOnlyFiveType isVestingEnded(totalValueVestedForFive,4500000){
        balances[teamFive] += 450000;
        totalValueVestedForFive += 450000;
        deadlineFive += 31 days;
    }
    
    function VestingForThree() public timePassedThree isOnlyThreeType isVestingEnded(totalValueVestedForThree,2700000){
        balances[teamThree] += 270000;
        totalValueVestedForThree += 270000;
        deadlineThree += 31 days;
    }

    function UnlockBulidingIncentive () public timePassedBuildingIncentive isOnlyBuildingIncentive isVestingEnded(totalValueUnlockedBuildingIncentive, 9000000){
        balances[buildingIncentive] += 9000000;
        totalValueUnlockedBuildingIncentive += 9000000;
    }
    
}

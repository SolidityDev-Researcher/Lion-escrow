# Lion Escrow

A secure Solidity-based escrow smart contract for ERC-20 tokens.  
This project allows users to deposit tokens, and the owner can release them later, with a 5% fee applied to each deposit.

## Features

- **Deposit tokens:** Users can deposit ERC-20 tokens into the escrow contract.
- **Release tokens:** The contract owner can release tokens to the depositor minus a 5% fee.
- **Fee collection:** Collected fees are transferred to the escrow owner.
- **Secure ownership:** Only the contract owner can release funds.

## Folder Structure


- `Lion_Token.sol` — ERC-20 token contract (used for testing/depositing).  
- `Smart_Contract.sol` — The Lion Escrow contract implementing deposit and release logic.

## Usage

1. **Deploy `Lion_Token.sol`** (ERC-20 token) in Remix or your local testnet.  
2. **Deploy `Smart_Contract.sol`** with the token address.  
3. **Deposit tokens:** Call `Deposit(amount)` to deposit tokens into the escrow.  
4. **Release tokens:** Owner calls `Release(depositorAddress)` to release deposited tokens and collect fees.

## Security Notes

- Only the owner can release deposits.  
- Deposits require approval of token allowance for the contract.  
- Fees are automatically sent to the owner.  

## Testing

- Use Remix or Hardhat to test deposit and release flows.  
- Test with local ERC-20 token deployment.  

## License

This project is licensed under the MIT License.

# Lion Escrow

**Lion Escrow** is a Solidity-based ERC-20 escrow smart contract prototype.  
It allows users to deposit tokens into the contract, and the owner can release them back while collecting a fee.  
This project demonstrates secure token handling, deposit/release logic, and fee collection — perfect for showcasing Solidity skills and ERC-20 interactions.

---

## Features

- **Deposit tokens:** Users can deposit approved ERC-20 tokens into the escrow contract.
- **Release tokens:** Only the contract owner can release funds back to the depositor.
- **Fee collection:** A 5% fee is applied to each deposit and sent to the contract owner.
- **Event logging:** Deposits and releases emit events for transparency.

> ⚠️ **Note:** This is a custodial escrow prototype. Users must trust the owner to release funds correctly.

---

## Folder Structure
Contract/
├─ Lion_Token.sol # ERC-20 token contract for testing/depositing
└─ Smart_Contract.sol # Lion Escrow contract implementing deposit and release logic


---

## Usage

1. **Deploy `Lion_Token.sol`** (ERC-20 token) in Remix or a local testnet.  
2. **Deploy `Smart_Contract.sol`** with the deployed token’s address.  
3. **Deposit tokens:** Call `Deposit(amount)` after approving the contract for your token.  
4. **Release tokens:** The owner calls `Release(depositorAddress)` to return funds minus fees.

---

## Security Notes

- Only the owner can release deposits.  
- Users must approve the contract to spend their ERC-20 tokens before depositing.  
- Fees are automatically sent to the owner during release.  
- This contract is a **prototype** and not suitable for production with real funds.

---

## Testing

- Use **Remix** or **Hardhat** to test deposit and release flows.  
- Deploy the ERC-20 token locally and simulate deposits/releases.

---

## License

This project is licensed under the **MIT License**.



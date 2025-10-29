# 🗒️ NOTES KA KHAZANA

**NOTES KA KHAZANA** is a simple Solidity smart contract that allows users to store, view, and delete short notes or memos directly on the blockchain.  
It’s a perfect beginner-friendly project to understand how on-chain data storage works in Ethereum smart contracts.

---

## 🚀 Features

- ✍️ Add personal notes (stored permanently on-chain)
- 👀 View all your saved notes
- ❌ Delete notes you no longer need
- 🔐 Notes are private to each user (your address = your vault)
- 🧱 Fully decentralized — no server or database required

---
## 🔗 Deployed Smart Contract

**Network:** Ethereum Testnet / (or any network you used)  
**Contract Address:** `https://celo-sepolia.blockscout.com/address/0x0481Ec400493a563b492c74F53C289410F771A5D`


<img width="1902" height="942" alt="image" src="https://github.com/user-attachments/assets/343f38b1-d9db-4cca-922e-2241a6450921" />


## 🧠 Smart Contract Overview

### Contract Name
`NOTES_KA_KHAZANA`

### Solidity Version
`pragma solidity ^0.8.0;`

### Key Functions

| Function | Description |
|-----------|--------------|
| `addNote(string _content)` | Adds a new note for the sender |
| `getMyNotes()` | Returns all notes created by the caller |
| `deleteNote(uint256 _noteId)` | Deletes a specific note by ID |
| `getMyNoteCount()` | Returns total number of notes for the caller |

### Events
- `NoteAdded(address user, uint256 noteId, string content, uint256 timestamp)`
- `NoteDeleted(address user, uint256 noteId)`

---

## 🧩 Code Example

```solidity
function addNote(string calldata _content) external {
    require(bytes(_content).length > 0, "Note cannot be empty");
    uint256 newId = userNotes[msg.sender].length;
    userNotes[msg.sender].push(Note(newId, _content, block.timestamp));
    emit NoteAdded(msg.sender, newId, _content, block.timestamp);
}
🧪 How to Deploy & Test

You can easily test the contract using Remix IDE:

Go to Remix Ethereum IDE

Create a new file — NOTES_KA_KHAZANA.sol

Paste the contract code

Compile using Solidity version 0.8.x

Deploy it using the Remix JavaScript VM

Use the buttons in Remix to:

Add notes with addNote

View all notes with getMyNotes

Delete any note with deleteNote

Check your note count with getMyNoteCount

🧰 Tech Stack

Solidity — Smart contract language

Remix IDE — For development & testing

Ethereum / EVM — Blockchain platform

⚡ Future Improvements

📝 Edit existing notes

🌐 Public or shareable notes

🔒 On-chain encryption or privacy layer

🖥️ Frontend DApp using React + Ethers.js

📄 License

This project is licensed under the MIT License — feel free to use, modify, and build upon it!

💡 Author

NOTES KA KHAZANA by [Your Name]
Built for learning and exploration in Web3 ✨

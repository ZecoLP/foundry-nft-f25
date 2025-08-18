# NFT Collection Project

A comprehensive Solidity project featuring two distinct NFT implementations: BasicNFT and MoodNFT, built with Foundry for smart contract development and testing.

## 🎨 Project Overview

This project demonstrates two different approaches to NFT creation:

1. **BasicNFT** - A simple ERC721 implementation with external metadata storage
2. **MoodNFT** - A dynamic NFT with on-chain SVG generation and mood-changing capabilities

## 🚀 Features

### BasicNFT
- **Simple Minting**: Mint NFTs with external metadata URIs
- **Custom Metadata**: Each token can have unique metadata stored externally (IPFS)
- **Token Name**: "Dogie" with symbol "DOG"

### MoodNFT
- **Dynamic NFTs**: NFTs that can change appearance based on mood
- **On-Chain SVG**: Fully on-chain SVG graphics (no external dependencies)
- **Mood System**: Toggle between HAPPY and SAD states
- **Owner Control**: Only token owners can change their NFT's mood
- **Base64 Encoding**: Metadata and images encoded directly in the contract

## 📦 Tech Stack

- **Solidity** ^0.8.18
- **OpenZeppelin** - Secure ERC721 implementation and utilities
- **Foundry** - Development framework for testing and deployment
- **Base64 Encoding** - For on-chain metadata generation

## 🔧 Installation & Setup

1. **Clone the repository**
```bash
git clone <repository-url>
cd nft-collection-project
```

2. **Install Foundry** (if not already installed)
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

3. **Install dependencies**
```bash
forge install
```

4. **Build the project**
```bash
forge build
```

## 🧪 Testing

Run all tests:
```bash
forge test
```

Run tests with verbosity:
```bash
forge test -vvv
```

Run specific test contract:
```bash
forge test --match-contract BasicNFTTest
forge test --match-contract MoodNftTest
```

## 🚀 Deployment

### Deploy BasicNFT
```bash
forge script script/DeployBasicNFT.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
```

### Deploy MoodNFT
```bash
forge script script/DeployMoodNFT.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
```

### Mint BasicNFT
```bash
forge script script/MintBasicNft.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
```

## 📖 Usage Examples

### BasicNFT Usage
```solidity
// Deploy
BasicNFT nft = new BasicNFT();

// Mint with IPFS metadata
string memory tokenUri = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
nft.mintNft(tokenUri);
```

### MoodNFT Usage
```solidity
// Deploy with SVG URIs
MoodNFT moodNft = new MoodNFT(sadSvgUri, happySvgUri);

// Mint (starts as HAPPY)
moodNft.mintNft();

// Change mood (only owner can do this)
moodNft.flipMood(tokenId);
```

## 🎭 MoodNFT Features Deep Dive

### Mood States
- **HAPPY**: Default state with cheerful SVG graphics
- **SAD**: Alternative state with melancholy SVG graphics

### Dynamic Metadata
The MoodNFT generates metadata dynamically based on the current mood:
```json
{
  "name": "Mood NFT",
  "description": "An NFT that reflects the owners mood.",
  "attributes": [
    {
      "trait_type": "moodiness",
      "value": 100
    }
  ],
  "image": "data:image/svg+xml;base64,..."
}
```

### Access Control
Only the token owner or approved addresses can change the mood of an NFT, ensuring security and preventing unauthorized modifications.

## 🔍 Key Functions

### BasicNFT
- `mintNft(string memory tokenUri)` - Mint new NFT with metadata URI
- `tokenURI(uint256 tokenId)` - Get metadata URI for a token

### MoodNFT
- `mintNft()` - Mint new NFT (starts as HAPPY)
- `flipMood(uint256 tokenId)` - Toggle between HAPPY and SAD
- `tokenURI(uint256 tokenId)` - Get dynamically generated metadata

## 🧪 Test Coverage

The project includes comprehensive tests:
- **Unit Tests**: Test individual contract functions
- **Integration Tests**: Test contract interactions and deployment
- **Edge Cases**: Test error conditions and access controls

### Sample Test Results
- ✅ Name and symbol initialization
- ✅ Minting functionality
- ✅ Mood flipping mechanics
- ✅ Access control enforcement
- ✅ Metadata generation
- ✅ SVG to URI conversion

## 🚨 Security Considerations

- **Access Control**: Only token owners can modify their NFT's mood
- **Input Validation**: Proper validation of token IDs and addresses
- **Safe Minting**: Uses OpenZeppelin's `_safeMint` for secure transfers
- **Error Handling**: Custom errors for gas-efficient reverts

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run the test suite
6. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the SPDX license identifiers in the source files.

## 🛠️ Development Tools

- **Foundry**: Smart contract development framework
- **Forge**: Testing and building
- **Cast**: Ethereum RPC interactions
- **Anvil**: Local Ethereum node

## 🎯 Future Enhancements

- [ ] Add more mood states (excited, angry, neutral)
- [ ] Implement mood history tracking
- [ ] Add rarity system for different SVG variations
- [ ] Create a web interface for mood changes
- [ ] Add marketplace integration

---

*Built with ❤️ using Foundry and OpenZeppelin*

Note: Of course the README file is created by AI, gotta work very hard to be very lazy :)
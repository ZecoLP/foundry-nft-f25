# BasicNFT

A simple ERC721 NFT smart contract built with Solidity and Foundry framework.

## Description

BasicNFT is a basic implementation of the ERC721 non-fungible token standard using OpenZeppelin contracts. The NFT collection is named "Dogie" with the symbol "DOG" and allows users to mint NFTs with custom metadata URIs.

## Features

- ✅ ERC721 standard compliance
- ✅ Custom token URI support
- ✅ Public minting functionality
- ✅ Auto-incrementing token IDs
- ✅ Built with OpenZeppelin for security

## Technologies Used

- **Solidity**: ^0.8.18
- **OpenZeppelin Contracts**: ERC721 implementation
- **Foundry**: Development framework and testing
- **Forge**: Build and testing tools

## Project Structure

```
├── src/
│   └── BasicNFT.sol          # Main NFT contract
├── script/
│   └── DeployBasicNft.s.sol  # Deployment script
└── test/
    └── (Tests coming soon)   # Unit tests - WIP
```

## Contract Details

### BasicNFT.sol

The main contract implementing the ERC721 NFT:

- **Name**: "Dogie"
- **Symbol**: "DOG"
- **Token Standard**: ERC721
- **Features**:
  - Sequential token ID generation (starting from 0)
  - Custom metadata URI for each token
  - Public minting function
  - Standard ERC721 functionality (transfer, approve, etc.)

### Key Functions

- `mintNft(string memory tokenUri)`: Mint a new NFT with custom metadata URI
- `tokenURI(uint256 tokenId)`: Get the metadata URI for a specific token
- Standard ERC721 functions inherited from OpenZeppelin

## Installation and Setup

1. Clone this repository
2. Install dependencies:
   ```bash
   forge install
   ```

3. Build contracts:
   ```bash
   forge build
   ```

## Testing

⚠️ **Work in Progress**: Tests are currently being developed.

Once tests are available, run:
```bash
forge test
```

## Deployment

Deploy to local network:
```bash
forge script script/DeployBasicNft.s.sol --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --broadcast
```

Deploy to testnet (example: Sepolia):
```bash
forge script script/DeployBasicNft.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Usage

After deployment, you can interact with the contract:

### Mint an NFT

```bash
cast send <CONTRACT_ADDRESS> "mintNft(string)" "https://your-metadata-uri.com/token/1" --rpc-url <RPC_URL> --private-key <PRIVATE_KEY>
```

### Check token URI

```bash
cast call <CONTRACT_ADDRESS> "tokenURI(uint256)" 0 --rpc-url <RPC_URL>
```

### Check token owner

```bash
cast call <CONTRACT_ADDRESS> "ownerOf(uint256)" 0 --rpc-url <RPC_URL>
```

## Metadata Format

This contract supports standard NFT metadata format. Your token URI should point to a JSON file with the following structure:

```json
{
  "name": "Token Name",
  "description": "Token Description",
  "image": "https://example.com/image.png",
  "attributes": [
    {
      "trait_type": "Trait Name",
      "value": "Trait Value"
    }
  ]
}
```

## Development Status

🚧 **This project is in early development stage (First Commit)**

### Completed:
- ✅ Basic NFT contract implementation
- ✅ Deployment script
- ✅ Core minting functionality

### TODO:
- ⏳ Comprehensive unit tests
- ⏳ Integration tests
- ⏳ Gas optimization
- ⏳ Additional utility functions
- ⏳ Documentation improvements
- ⏳ Frontend integration examples

## Security Considerations

- Contract uses OpenZeppelin's audited ERC721 implementation
- Public minting allows anyone to mint NFTs - consider adding access controls for production use
- No mint limits or costs implemented - consider adding these for production deployments
- Token URIs are mutable through the mapping - consider making them immutable if needed

## License

MIT License - see LICENSE file for full details.

## Contributing

This project welcomes contributions! Since it's in early development:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Roadmap

- [ ] Add comprehensive test suite
- [ ] Implement minting restrictions (max supply, whitelist, etc.)
- [ ] Add batch minting functionality
- [ ] Create frontend demo application
- [ ] Add more deployment network configurations
- [ ] Implement royalty standards (EIP-2981)

## Contact

If you have any questions, suggestions, or want to contribute, please open an issue in this repository.
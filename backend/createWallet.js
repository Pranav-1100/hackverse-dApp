// Import necessary libraries
const solanaWeb3 = require('@solana/web3.js');
const Okto = require('okto-sdk-react');

// Connect to the Solana devnet
const connection = new solanaWeb3.Connection(solanaWeb3.clusterApiUrl('devnet'), 'confirmed');

// Initialize Okto SDK client
const oktoClient = Okto.createClient({
  apiKey: 'YOUR_API_KEY',
  network: 'devnet', // or 'mainnet-beta'
});

// Function to create and authenticate wallet
async function createWallet() {
  try {
    // Authenticate user (replace with actual methods)
    const user = await oktoClient.authenticate({
      username: 'user@example.com',
      password: 'password123'
    });

    // Create the wallet
    const wallet = await oktoClient.createWallet({
      userId: user.id,
      chain: 'solana'
    });

    console.log(`Wallet Address: ${wallet.address}`);
    console.log(`Private Key: ${wallet.privateKey}`);

    // Optional: Fund the wallet for development
    const airdropSignature = await connection.requestAirdrop(
      wallet.address,
      solanaWeb3.LAMPORTS_PER_SOL // 1 SOL
    );

    await connection.confirmTransaction(airdropSignature);
    console.log('Airdrop completed');
  } catch (error) {
    console.error('Error creating wallet:', error);
  }
}

// Execute the function to create the wallet
createWallet();

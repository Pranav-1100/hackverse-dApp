const { Connection, PublicKey } = require('@solana/web3.js');

const connection = new Connection(process.env.SOLANA_RPC_URL);

const getAccountInfo = async (pubkey) => {
  const publicKey = new PublicKey(pubkey);
  const accountInfo = await connection.getAccountInfo(publicKey);
  return accountInfo;
};

module.exports = { connection, getAccountInfo };

from web3 import Web3

GANACHE_URL = "http://127.0.0.1:8545"
CONTRACT_ADDRESS = "0x601eC762a5A807Fa6b87242662efbC1eF0ea0d80"
PRIVATE_KEY = "0xce5a4e95ec1d930905e7b19223fb26f096a600bc2196f5304e160ec5dbcdaa43"

ABI = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "imageHash",
        "type": "bytes32"
      },
      {
        "internalType": "string",
        "name": "prediction",
        "type": "string"
      }
    ],
    "name": "storeRecord",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "imageHash",
        "type": "bytes32"
      }
    ],
    "name": "getRecord",
    "outputs": [
      {
        "internalType": "string",
        "name": "prediction",
        "type": "string"
      },
      {
        "internalType": "uint256",
        "name": "timestamp",
        "type": "uint256"
      },
      {
        "internalType": "address",
        "name": "uploader",
        "type": "address"
      },
      {
        "internalType": "bool",
        "name": "exists",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "bytes32",
        "name": "imageHash",
        "type": "bytes32"
      }
    ],
    "name": "exists",
    "outputs": [
      {
        "internalType": "bool",
        "name": "exists",
        "type": "bool"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  }
]

w3 = Web3(Web3.HTTPProvider(GANACHE_URL))
contract = w3.eth.contract(address=CONTRACT_ADDRESS, abi=ABI)
account = w3.eth.account.from_key(PRIVATE_KEY)

def store_record(img_hash_hex, prediction):
    """Store a record on the blockchain with hash and prediction"""
    img_hash_bytes = bytes.fromhex(img_hash_hex)
    
    tx = contract.functions.storeRecord(
        img_hash_bytes,
        prediction
    ).build_transaction({
        "from": account.address,
        "nonce": w3.eth.get_transaction_count(account.address),
        "gas": 200000,
        "gasPrice": w3.eth.gas_price,
        "chainId": 1337
    })
    
    signed = w3.eth.account.sign_transaction(tx, private_key=PRIVATE_KEY)
    tx_hash = w3.eth.send_raw_transaction(signed.raw_transaction)
    
    # Wait for transaction receipt
    receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
    
    return tx_hash.hex()

def get_record(img_hash_hex):
    """Retrieve a record from the blockchain"""
    img_hash_bytes = bytes.fromhex(img_hash_hex)
    
    result = contract.functions.getRecord(img_hash_bytes).call()
    
    return {
        "prediction": result[0],
        "timestamp": result[1],
        "uploader": result[2],
        "exists": result[3]
    }

def check_exists(img_hash_hex):
    """Check if a record exists on the blockchain"""
    img_hash_bytes = bytes.fromhex(img_hash_hex)
    return contract.functions.exists(img_hash_bytes).call()
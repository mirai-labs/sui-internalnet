#!/bin/bash

curl -X POST -H "Content-Type: application/json" -d '{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "sui_getTotalTransactionBlocks",
  "params": []
}' http://localhost:8080
# Clarity Coin (CC) Smart Contract

This is a simple Clarity smart contract implementing a **fungible token** (SIP-010) on the Stacks blockchain. Anyone can mint tokens using the `mint` function.

---

## Example Contract Calls

First, run the Clarity tests or console:

```bash
clarinet check
clarinet console

;; Example 1: Using shorthand for local contracts
(contract-call? .trivia-app mint u1000 tx-sender)
::set_tx_sender ST2JHG361ZXG51QTKY2NQCVBPPRRE2KZB1HR05NNC
tx-sender switched to ST2JHG361ZXG51QTKY2NQCVBPPRRE2KZB1HR05NNC
;; Example 2: Using full contract identifier
(contract-call? 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.trivia-app mint u1000 tx-sender)

(contract-call? .trivia-app transfer u500 tx-sender 'ST3FBR2AGK5H9H9QBDH3EEN6DF8EK8JY7RX8QJ5ABCD (some "Payment memo"))

(contract-call-read? .trivia-app get-name)

Switch tx-sender if needed:

::set_tx_sender ST2JHG361ZXG51QTKY2NQCVBPPRRE2KZB1HR05NNC

Public Functions
Mint Tokens

Mint 1000 tokens to the caller (tx-sender):

;; Local contract shorthand
(contract-call? .trivia-app mint u1000 tx-sender)

;; Full contract identifier
(contract-call? 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.trivia-app mint u1000 tx-sender)

Transfer Tokens

Transfer 500 tokens from tx-sender to another principal:

(contract-call? .trivia-app transfer u500 tx-sender 'ST3FBR2AGK5H9H9QBDH3EEN6DF8EK8JY7RX8QJ5ABCD (some "Payment memo"))

Read-Only Functions
Get Token Name
(contract-call? .trivia-app get-name)

Get Token Symbol
(contract-call? .trivia-app get-symbol)

Get Decimals
(contract-call? .trivia-app get-decimals)

Get Balance of a Principal
(contract-call? .trivia-app get-balance 'ST3FBR2AGK5H9H9QBDH3EEN6DF8EK8JY7RX8QJ5ABCD)```



Notes

No maximum supply — tokens can be minted infinitely.

Uses the SIP-010 fungible token standard for compatibility with Stacks apps and wallets.

mint is public — anyone can mint tokens.

transfer requires the sender to be the caller (tx-sender).

Read-only functions allow anyone to query balances, supply, and metadata.
;; Implement SIP-010 Fungible Token Standard
(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)

;; Contract owner (for reference, not restricting minting)
(define-constant contract-owner tx-sender)

(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))

;; No maximum supply
(define-fungible-token trivio-coin)

;; Transfer function
(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) err-not-token-owner)
    (try! (ft-transfer? trivio-coin amount sender recipient))
    (match memo to-print (print to-print) 0x)
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-name)
  (ok "Trivio Coin")
)

(define-read-only (get-symbol)
  (ok "CC")
)

(define-read-only (get-decimals)
  (ok u0)
)

(define-read-only (get-balance (who principal))
  (ok (ft-get-balance trivio-coin who))
)

(define-read-only (get-total-supply)
  (ok (ft-get-supply trivio-coin))
)

(define-read-only (get-token-uri)
  (ok none)
)

;; Mint function  anyone can mint
(define-public (mint (amount uint) (recipient principal))
  (begin
    ;; Anyone can mint, so no owner check
    (ft-mint? trivio-coin amount recipient)
  )
)

# AIP. Hacxyk bug bounty (fallback oracle)

Implementation of the Aave governance proposal payload for the release of the recommended bounty to Hacxyk, for their report on a misconfiguration on the fallback oracle of Aave v3.

References:

- [Forum discussion](https://governance.aave.com/t/bgd-proposal-for-bounty-fallback-oracle-misconfiguration/8421)
- [Snapshot](https://snapshot.org/#/aave.eth/proposal/0xb4886ff25f454773a779be3627863181ec7dbe1fb6b6e631678610dbe3f03a88)

## Proposal specification

The proposal payload does the following:

- Withdrawal of 50'000 USDC to the Ethereum account provided by Hacxyk.

## Setup
Create a `.env` file following the `.env.example`, adding a Ethereum node URL (Alchemy, Infura)


### Dependencies

```
make update
```

### Compilation

```
make build
```

### Testing

```
make test
```


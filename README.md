# BESSHub Protocol

![Battery Energy Storage Systems (BESS)](https://i.ibb.co/99pZ3Xmg/BESS-Moura.png)

🇺🇸 English | [🇧🇷 Português](docs/README.pt.md) | [🇪🇸 Español](docs/README.es.md)

**BESSHub** is an educational reward protocol based on BESS data (Data-to-Earn or D2E). Users submit real operational data (SoC, power, temperature, efficiency, and images) and, upon validation, receive **BESS tokens** and a **ContributorNFT**, which represents their participation in the protocol.

The system was designed following **security best practices, inflation control, and separation of concerns**, utilizing official Sui Move standards.

## Protocol Architecture

The protocol is divided into **4 core modules**, each with a clear responsibility:

> besshub/  
> ├─ bess_token.move  
> ├─ contributor_nft.move  
> ├─ data_submission.move  
> └─ reward_system.move

## License

[License MIT](LICENSE)
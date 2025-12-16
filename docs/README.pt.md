# Protocolo BESSHub

![Sistema de Armazenamento de Energia em Batérias (BESS)](https://i.ibb.co/99pZ3Xmg/BESS-Moura.png)

[🇺🇸 English](../README.md) | 🇧🇷 Português | [🇪🇸 Español](README.es.md)

**BESSHub** é um protocolo educacional de recompensas baseado dados de BESS (Data-to-Earn ou D2E). Usuários submetem dados operacionais reais (SoC, potência, temperatura, eficiência e imagem) e, após validação, recebem **tokens BESS** e um **ContributorNFT**, que representa sua participação no protocolo.

O sistema foi projetado seguindo **boas práticas de segurança, controle de inflação e separação de responsabilidades**, usando os padrões oficiais da Sui Move.

## Arquitetura do Protocolo

O protocolo é dividido em **4 módulos principais**, cada um com uma responsabilidade clara:

> besshub/  
> ├─ bess_token.move  
> ├─ contributor_nft.move  
> ├─ data_submission.move  
> └─ reward_system.move

## Licença

[Licença MIT](LICENSE)
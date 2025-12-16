# Protocolo BESSHub

![Sistema de Almacenamiento de Energía con Baterías (SAEB o BESS)](https://i.ibb.co/99pZ3Xmg/BESS-Moura.png)

[🇺🇸 English](../README.md) | [🇧🇷 Português](README.pt.md) | 🇪🇸 Español

**BESSHub** es un protocolo educativo de recompensas basado en datos de BESS o SAEB (Data-to-Earn o D2E). Los usuarios envían datos operativos reales (SoC, potencia, temperatura, eficiencia e imagen) y, tras su validación, reciben **tokens BESS** y un **ContributorNFT**, que representa su participación en el protocolo.

El sistema fue diseñado siguiendo **buenas prácticas de seguridad, control de inflación y separación de responsabilidades**, utilizando los estándares oficiales de Sui Move.

## Arquitectura del Protocolo

El protocolo está dividido en **4 módulos principales**, cada uno con una responsabilidad clara:

> besshub/  
> ├─ bess_token.move  
> ├─ contributor_nft.move  
> ├─ data_submission.move  
> └─ reward_system.move

## Licença

[Licença MIT](LICENSE)
module besshub::reward_system {
	use sui::coin::{Self, TreasuryCap, Coin};
	use sui::object::{Self, UID};
	use sui::tx_context::{Self, TxContext};
	use sui::transfer;
	use sui::table::{Self, Table};

	use besshub::bess_token::BESS;
	use besshub::contributor_nft::{Self, ContributorNFT};
 	use besshub::data_submission::{Self, DataRegistry};

	// Sistema de Recompensas
	struct RewardSystem has key {
		id: UID,
		treasury_cap: TreasuryCap<BESS>,
		total_distributed: u64,
		contributors: Table<address, bool>
	}

	// Códigos de erro
	const E_INVALID_AMOUNT: u64 = 0;
	const E_ALREADY_HAS_NFT: u64 = 1;
	const E_ALREADY_PROCESSED: u64 = 2;

	// Inicializa o sistema e recebe o TreasuryCap
	public fun init(
		treasury_cap: TreasuryCap<BESS>,
		ctx: &mut TxContext
	) {
		let system = RewardSystem {
			id: object::new(ctx),
			treasury_cap,
			total_distributed: 0,
			contributors: table::new(ctx)
		};

		transfer::share_object(system);
	}

	// Distribui recompensas
	public fun distribute_reward(
		system: &mut RewardSystem,
		registry: &mut DataRegistry,
		amount: u64,
		recipient: address,
		ctx: &mut TxContext
	) {
		assert!(amount > 0, E_INVALID_AMOUNT);
		assert!(
			!table::contains(&system.contributors, recipient),
			E_ALREADY_HAS_NFT
		);
		assert!(!registry.processed, E_ALREADY_PROCESSED);

		let reward_coin: Coin<BESS> = coin::mint(
			&mut system.treasury_cap,
			amount,
			ctx
		);

		system.total_distributed = system.total_distributed + amount;

		let nft = contributor_nft::mint(ctx);

		data_submission::mark_processed(registry);

		// Registra o usuário como contribuinte
    table::add(&mut system.contributors, recipient, true);

		coin::transfer(reward_coin, recipient);
		transfer::transfer(nft, recipient);
	}
}

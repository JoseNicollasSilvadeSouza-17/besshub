module besshub::reward_system {
	use sui::coin::{Self, TreasuryCap, Coin};
	use sui::object::UID;
	use sui::tx_context::TxContext;
	use sui::transfer;
	use besshub::bess_token::BESS;

	// Sistema de Recompensas
	struct RewardSystem has key {
		id: UID,
		treasury_cap: TreasuryCap<BESS>,
		total_distributed: u64
	}

	const E_INVALID_AMOUNT: u64 = 0;

	// Inicializa o sistema e recebe o TreasuryCap
	public fun init(
		treasury_cap: TreasuryCap<BESS>,
		ctx: &mut TxContext
	) {
		let system = RewardSystem {
			id: object::new(ctx),
			treasury_cap,
			total_distributed: 0
		};

		transfer::share_object(system);
	}

	// Distribui recompensas
	public fun distribute_reward(
		system: &mut RewardSystem,
		amount: u64,
		recipient: address,
		ctx: &mut TxContext
	) {
		assert!(amount > 0, E_INVALID_AMOUNT);

		let coin: Coin<BESS> = coin::mint(
			&mut system.treasury_cap,
			amount,
			ctx);

		system.total_distributed = system.total_distributed + amount;

		transfer::public_transfer(coin, recipient);
	}
}

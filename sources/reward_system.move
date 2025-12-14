module besshub::reward_system {
	use sui::coin::{Self, TreasuryCap, Coin};
	use sui::object::UID;
	use sui::tx_context::TxContext;
	use sui::transfer;
	use besshub::bess_token::BESS;

	// Sistema de Recompensas
	struct RewardSystem has key {
		id: UID,
		treasury_cap: TreasuryCap<BESS>
	}

	// Inicializa o sistema e recebe o TreasuryCap
	public fun init(
		treasury_cap: TreasuryCap<BESS>,
		ctx: &mut TxContext
	) {
		let system = RewardSystem {
			id: object::new(ctx),
			treasury_cap
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
		let coin: Coin<BESS> = coin::mint(
			&mut system.treasury_cap, 
			amount, 
			ctx);

		transfer::public_transfer(coin, recipient);
	}
}
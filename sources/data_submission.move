module besshub::data_submission {
	use sui::object::{Self, UID};
	use sui::tx_context::{TxContext, sender};
	use sui::transfer;
	use sui::clock;
	use sui::option::{Self, Option};
	use sui::string::String;

	struct DataRegistry has key, store {
		id: UID,
		contributor: address,
		soc: u8,								// 0-100%
		power_kw: u64,					// 0-5_000_000 (simplificado, sem negativo)
		temperature: u8,				// 0-100 (representa -20 a 80°C mapeado)
		efficiency: u8,					// 50-100%
		timestamp: u64,
		image_url: Option<String>,
		processed: bool
	}

	public fun init(ctx: &mut TxContext) {
		let registry = DataRegistry {
			id: object::new(ctx),
			contributor: @0x0,
			soc: 0,
			power_kw: 0,
			temperature: 0,
			efficiency: 0,
			timestamp: 0,
			image_url: option::none<String>(),
			processed: true
		};

		transfer::share_object(registry);
	}

	public fun submit(
		registry: &mut DataRegistry,
		soc: u8,
		power_kw: u64,
		temperature: u8,
		efficiency: u8,
		image_url: Option<String>,
		ctx: &mut TxContext
	) {
		assert!(soc <= 100, 0);
		assert!(power_kw <= 5_000_000, 1);
		assert!(temperature <= 100, 2);
		assert!(efficiency >= 50 && efficiency <= 100, 3);

		registry.contributor = tx_context::sender(ctx);
		registry.soc = soc;
		registry.power_kw = power_kw;
		registry.temperature = temperature;
		registry.efficiency = efficiency;
		registry.timestamp = clock::now_ms();
		registry.image_url = image_url;
		registry.processed = false;
	}

	public(package) fun mark_processed(registry: &mut DataRegistry) {
		registry.processed = true;
	}
}

/*
/// Module: besshub
module besshub::besshub;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions
module besshub::bess_token {
	use sui::coin;
	use sui::tx_context::{Self, TxContext};

	// Tipo do Token BESS
	struct BESS has drop {}

	// Inicialização única do token
	fun init(witness: BESS, ctx: &mut TxContext) {
		let (treasury_cap, metadata) = coin::create_currency<BESS>(
			witness,
			9,										// decimals
			b"BESSHub Token",			// nome
			b"BESS",							// símbolo
			b"Token de recompensa do protocolo BESSHub",
			ctx
		);
	}
}

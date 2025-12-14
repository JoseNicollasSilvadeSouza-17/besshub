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

	}
}

module besshub::contributor_nft {
  use sui::object::{Self, UID};
  use sui::tx_context::TxContext;
  use sui::display;
	use sui::string::{String, utf8};
	use sui::option::{Self, Option};

  struct ContributorNFT has key, store {
    id: UID,
    tier: u8,
		total_submissions: u64,
		custom_image_url: Option<String>
  }

	// Constantes de Tiers
	const TIER_BRONZE: u8 = 0;
	const TIER_PRATA: u8 = 1;
	const TIER_OURO: u8 = 2;
	const TIER_PLATINUM: u8 = 3;

	fun init(ctx: &mut TxContext) {
		let mut display = display::new<ContributorNFT>(ctx);

		display::add(
			&mut display,
			b"name",
			b"BESSHub Contributor NFT"
		);

		display::add(
			&mut display,
			b"description",
			b"Contributor NFT do protocolo BESSHub"
		);

		display::add(
			&mut display,
			b"image",
			b"{image}"
		);

		display::add(
			&mut display,
			b"tier",
			b"{tier}"
		);

		display::add(
			&mut display,
			b"total_submissions",
			b"{total_submissions}"
		);

		display::freeze(display);
	}

	fun new(ctx: &mut TxContext): ContributorNFT {
		ContributorNFT {
			id: object::new(ctx),
			tier: TIER_BRONZE,
			total_submissions: 0,
			custom_image_url: option::none<String>()
		}
	}

	fun calculate_tier(total_submissions: u64): u8 {
		if (total_submissions >= 100) {
			TIER_PLATINUM
		} else if (total_submissions >= 50) {
			TIER_OURO
		} else if (total_submissions >= 10) {
			TIER_PRATA
		} else {
			TIER_BRONZE
		}
	}

	public fun default_image_for_tier(tier: u8): String {
		if (tier == TIER_PLATINUM) {
			utf8(b"https://walrus.site/besshub/bess-platinum.png")
		} else if (tier == TIER_OURO) {
			utf8(b"https://walrus.site/besshub/bess-ouro.png")
		} else if (tier == TIER_PRATA) {
			utf8(b"https://walrus.site/besshub/bess-prata.png")
		} else {
			utf8(b"https://walrus.site/besshub/bess-bronze.png")
		}
	}

	fun set_custom_image(
    nft: &mut ContributorNFT,
    url: String
  ) {
    nft.custom_image_url = option::some<String>(url);
  }

	public fun resolve_image(nft: &ContributorNFT): String {
		if (option::is_some(&nft.custom_image_url)) {
			let image = option::borrow(&nft.custom_image_url);
			*image
		} else {
			default_image_for_tier(nft.tier)
		}
	}
}

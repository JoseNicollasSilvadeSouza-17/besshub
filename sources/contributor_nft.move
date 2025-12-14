module besshub::contributor_nft {
  use sui::tx_context::TxContext;
  use sui::transfer;
  use sui::object::UID;

  struct ContributorNFT has key, store {
    id: UID,
    contributor: address,
    contributor_score: u64
  }

  public(package) fun mint(
    contributor: address,
    score: u64,
    ctx: &mut TxContext
  ): ContributorNFT {
    ContributorNFT {
      id: object::new(ctx),
      contributor,
      contributor_score: score
    }
  }
}

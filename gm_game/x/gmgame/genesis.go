package gmgame

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	"gm_game/x/gmgame/keeper"
	"gm_game/x/gmgame/types"
)

// InitGenesis initializes the module's state from a provided genesis state.
func InitGenesis(ctx sdk.Context, k keeper.Keeper, genState types.GenesisState) {
	// Set all the nft
	for _, elem := range genState.NftList {
		k.SetNft(ctx, elem)
	}
	// Set all the scores
	for _, elem := range genState.ScoresList {
		k.SetScores(ctx, elem)
	}
	// this line is used by starport scaffolding # genesis/module/init
	k.SetParams(ctx, genState.Params)
}

// ExportGenesis returns the module's exported genesis
func ExportGenesis(ctx sdk.Context, k keeper.Keeper) *types.GenesisState {
	genesis := types.DefaultGenesis()
	genesis.Params = k.GetParams(ctx)

	genesis.NftList = k.GetAllNft(ctx)
	genesis.ScoresList = k.GetAllScores(ctx)
	// this line is used by starport scaffolding # genesis/module/export

	return genesis
}

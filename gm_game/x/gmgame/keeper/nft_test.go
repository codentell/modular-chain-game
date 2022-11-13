package keeper_test

import (
	"strconv"
	"testing"

	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"
	keepertest "gm_game/testutil/keeper"
	"gm_game/testutil/nullify"
	"gm_game/x/gmgame/keeper"
	"gm_game/x/gmgame/types"
)

// Prevent strconv unused error
var _ = strconv.IntSize

func createNNft(keeper *keeper.Keeper, ctx sdk.Context, n int) []types.Nft {
	items := make([]types.Nft, n)
	for i := range items {
		items[i].Index = strconv.Itoa(i)

		keeper.SetNft(ctx, items[i])
	}
	return items
}

func TestNftGet(t *testing.T) {
	keeper, ctx := keepertest.GmgameKeeper(t)
	items := createNNft(keeper, ctx, 10)
	for _, item := range items {
		rst, found := keeper.GetNft(ctx,
			item.Index,
		)
		require.True(t, found)
		require.Equal(t,
			nullify.Fill(&item),
			nullify.Fill(&rst),
		)
	}
}
func TestNftRemove(t *testing.T) {
	keeper, ctx := keepertest.GmgameKeeper(t)
	items := createNNft(keeper, ctx, 10)
	for _, item := range items {
		keeper.RemoveNft(ctx,
			item.Index,
		)
		_, found := keeper.GetNft(ctx,
			item.Index,
		)
		require.False(t, found)
	}
}

func TestNftGetAll(t *testing.T) {
	keeper, ctx := keepertest.GmgameKeeper(t)
	items := createNNft(keeper, ctx, 10)
	require.ElementsMatch(t,
		nullify.Fill(items),
		nullify.Fill(keeper.GetAllNft(ctx)),
	)
}

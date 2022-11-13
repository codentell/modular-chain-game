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

func createNScores(keeper *keeper.Keeper, ctx sdk.Context, n int) []types.Scores {
	items := make([]types.Scores, n)
	for i := range items {
		items[i].Index = strconv.Itoa(i)

		keeper.SetScores(ctx, items[i])
	}
	return items
}

func TestScoresGet(t *testing.T) {
	keeper, ctx := keepertest.GmgameKeeper(t)
	items := createNScores(keeper, ctx, 10)
	for _, item := range items {
		rst, found := keeper.GetScores(ctx,
			item.Index,
		)
		require.True(t, found)
		require.Equal(t,
			nullify.Fill(&item),
			nullify.Fill(&rst),
		)
	}
}
func TestScoresRemove(t *testing.T) {
	keeper, ctx := keepertest.GmgameKeeper(t)
	items := createNScores(keeper, ctx, 10)
	for _, item := range items {
		keeper.RemoveScores(ctx,
			item.Index,
		)
		_, found := keeper.GetScores(ctx,
			item.Index,
		)
		require.False(t, found)
	}
}

func TestScoresGetAll(t *testing.T) {
	keeper, ctx := keepertest.GmgameKeeper(t)
	items := createNScores(keeper, ctx, 10)
	require.ElementsMatch(t,
		nullify.Fill(items),
		nullify.Fill(keeper.GetAllScores(ctx)),
	)
}

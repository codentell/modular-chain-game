package keeper_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	testkeeper "gm_game/testutil/keeper"
	"gm_game/x/gmgame/types"
)

func TestGetParams(t *testing.T) {
	k, ctx := testkeeper.GmgameKeeper(t)
	params := types.DefaultParams()

	k.SetParams(ctx, params)

	require.EqualValues(t, params, k.GetParams(ctx))
}

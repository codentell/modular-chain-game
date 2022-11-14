package keeper_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	testkeeper "modular_gm_game_rollup/testutil/keeper"
	"modular_gm_game_rollup/x/modulargmgamerollup/types"
)

func TestGetParams(t *testing.T) {
	k, ctx := testkeeper.ModulargmgamerollupKeeper(t)
	params := types.DefaultParams()

	k.SetParams(ctx, params)

	require.EqualValues(t, params, k.GetParams(ctx))
}

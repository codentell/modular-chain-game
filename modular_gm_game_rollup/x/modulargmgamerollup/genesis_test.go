package modulargmgamerollup_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	keepertest "modular_gm_game_rollup/testutil/keeper"
	"modular_gm_game_rollup/testutil/nullify"
	"modular_gm_game_rollup/x/modulargmgamerollup"
	"modular_gm_game_rollup/x/modulargmgamerollup/types"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.ModulargmgamerollupKeeper(t)
	modulargmgamerollup.InitGenesis(ctx, *k, genesisState)
	got := modulargmgamerollup.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}

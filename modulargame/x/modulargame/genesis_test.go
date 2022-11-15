package modulargame_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	keepertest "modulargame/testutil/keeper"
	"modulargame/testutil/nullify"
	"modulargame/x/modulargame"
	"modulargame/x/modulargame/types"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.ModulargameKeeper(t)
	modulargame.InitGenesis(ctx, *k, genesisState)
	got := modulargame.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}

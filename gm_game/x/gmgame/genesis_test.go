package gmgame_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	keepertest "gm_game/testutil/keeper"
	"gm_game/testutil/nullify"
	"gm_game/x/gmgame"
	"gm_game/x/gmgame/types"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.GmgameKeeper(t)
	gmgame.InitGenesis(ctx, *k, genesisState)
	got := gmgame.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}

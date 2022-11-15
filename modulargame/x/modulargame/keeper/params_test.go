package keeper_test

import (
	"testing"

	"github.com/stretchr/testify/require"
	testkeeper "modulargame/testutil/keeper"
	"modulargame/x/modulargame/types"
)

func TestGetParams(t *testing.T) {
	k, ctx := testkeeper.ModulargameKeeper(t)
	params := types.DefaultParams()

	k.SetParams(ctx, params)

	require.EqualValues(t, params, k.GetParams(ctx))
}

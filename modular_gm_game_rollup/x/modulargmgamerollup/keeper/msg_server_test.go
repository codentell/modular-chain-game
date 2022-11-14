package keeper_test

import (
	"context"
	"testing"

	sdk "github.com/cosmos/cosmos-sdk/types"
	keepertest "modular_gm_game_rollup/testutil/keeper"
	"modular_gm_game_rollup/x/modulargmgamerollup/keeper"
	"modular_gm_game_rollup/x/modulargmgamerollup/types"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.ModulargmgamerollupKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}

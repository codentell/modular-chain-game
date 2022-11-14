package simulation

import (
	"math/rand"

	"github.com/cosmos/cosmos-sdk/baseapp"
	sdk "github.com/cosmos/cosmos-sdk/types"
	simtypes "github.com/cosmos/cosmos-sdk/types/simulation"
	"modular_gm_game_rollup/x/modulargmgamerollup/keeper"
	"modular_gm_game_rollup/x/modulargmgamerollup/types"
)

func SimulateMsgCreateModularFellow(
	ak types.AccountKeeper,
	bk types.BankKeeper,
	k keeper.Keeper,
) simtypes.Operation {
	return func(r *rand.Rand, app *baseapp.BaseApp, ctx sdk.Context, accs []simtypes.Account, chainID string,
	) (simtypes.OperationMsg, []simtypes.FutureOperation, error) {
		simAccount, _ := simtypes.RandomAcc(r, accs)
		msg := &types.MsgCreateModularFellow{
			Creator: simAccount.Address.String(),
		}

		// TODO: Handling the CreateModularFellow simulation

		return simtypes.NoOpMsg(types.ModuleName, msg.Type(), "CreateModularFellow simulation not implemented"), nil, nil
	}
}

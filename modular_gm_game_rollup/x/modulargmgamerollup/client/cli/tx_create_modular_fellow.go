package cli

import (
	"strconv"

	"github.com/cosmos/cosmos-sdk/client"
	"github.com/cosmos/cosmos-sdk/client/flags"
	"github.com/cosmos/cosmos-sdk/client/tx"
	"github.com/spf13/cobra"
	"modular_gm_game_rollup/x/modulargmgamerollup/types"
)

var _ = strconv.Itoa(0)

func CmdCreateModularFellow() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "create-modular-fellow [score] [x] [y]",
		Short: "Broadcast message createModularFellow",
		Args:  cobra.ExactArgs(3),
		RunE: func(cmd *cobra.Command, args []string) (err error) {
			argScore := args[0]
			argX := args[1]
			argY := args[2]

			clientCtx, err := client.GetClientTxContext(cmd)
			if err != nil {
				return err
			}

			msg := types.NewMsgCreateModularFellow(
				clientCtx.GetFromAddress().String(),
				argScore,
				argX,
				argY,
			)
			if err := msg.ValidateBasic(); err != nil {
				return err
			}
			return tx.GenerateOrBroadcastTxCLI(clientCtx, cmd.Flags(), msg)
		},
	}

	flags.AddTxFlagsToCmd(cmd)

	return cmd
}

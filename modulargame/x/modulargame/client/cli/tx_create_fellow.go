package cli

import (
	"strconv"

	"github.com/cosmos/cosmos-sdk/client"
	"github.com/cosmos/cosmos-sdk/client/flags"
	"github.com/cosmos/cosmos-sdk/client/tx"
	"github.com/spf13/cobra"
	"modulargame/x/modulargame/types"
)

var _ = strconv.Itoa(0)

func CmdCreateFellow() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "create-fellow [score] [x] [y]",
		Short: "Broadcast message createFellow",
		Args:  cobra.ExactArgs(3),
		RunE: func(cmd *cobra.Command, args []string) (err error) {
			argScore := args[0]
			argX := args[1]
			argY := args[2]

			clientCtx, err := client.GetClientTxContext(cmd)
			if err != nil {
				return err
			}

			msg := types.NewMsgCreateFellow(
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

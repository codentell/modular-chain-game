package keeper

import (
	"context"

	"modular_gm_game_rollup/x/modulargmgamerollup/types"

	sdk "github.com/cosmos/cosmos-sdk/types"
)

// func (k msgServer) CreateModularFellow(goCtx context.Context, msg *types.MsgCreateModularFellow) (*types.MsgCreateModularFellowResponse, error) {
// 	ctx := sdk.UnwrapSDKContext(goCtx)

// 	// TODO: Handling the message
// 	_ = ctx

// 	return &types.MsgCreateModularFellowResponse{}, nil
// }

func (k msgServer) CreateModularFellow(goCtx context.Context, msg *types.MsgCreateModularFellow) (*types.MsgCreateModularFellowResponse, error) {
	// Get the context
	ctx := sdk.UnwrapSDKContext(goCtx)

	// Create variable of type Recipe
	var modularFellow = types.Fellow{
		Creator: msg.Creator,
		Score:   msg.Score,
		X:       msg.X,
		Y:       msg.Y,
	}

	// Add a recipe to the store and get back the ID
	id := k.AppendFellow(ctx, modularFellow)

	// Return the ID of the recipe
	return &types.MsgCreateModularFellowResponse{Id: id}, nil
}

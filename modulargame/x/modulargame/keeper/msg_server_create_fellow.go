package keeper

import (
	"context"

	"modulargame/x/modulargame/types"

	sdk "github.com/cosmos/cosmos-sdk/types"
)

func (k msgServer) CreateFellow(goCtx context.Context, msg *types.MsgCreateFellow) (*types.MsgCreateFellowResponse, error) {
	ctx := sdk.UnwrapSDKContext(goCtx)

	// Create variable of type Recipe
	var fellow = types.Fellow{
		Creator: msg.Creator,
		Score:   msg.Score,
		X:       msg.X,
		Y:       msg.Y,
	}

	// Add a recipe to the store and get back the ID
	id := k.AppendFellow(ctx, fellow)

	return &types.MsgCreateFellowResponse{Id: id}, nil
}

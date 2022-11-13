package keeper

import (
	"context"

	sdk "github.com/cosmos/cosmos-sdk/types"
	"gm_game/x/gmgame/types"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (k Keeper) Nft(goCtx context.Context, req *types.QueryNftRequest) (*types.QueryNftResponse, error) {
	if req == nil {
		return nil, status.Error(codes.InvalidArgument, "invalid request")
	}

	ctx := sdk.UnwrapSDKContext(goCtx)

	// TODO: Process the query
	_ = ctx

	return &types.QueryNftResponse{}, nil
}

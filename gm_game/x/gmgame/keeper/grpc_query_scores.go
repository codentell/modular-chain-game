package keeper

import (
	"context"

	"github.com/cosmos/cosmos-sdk/store/prefix"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/cosmos/cosmos-sdk/types/query"
	"gm_game/x/gmgame/types"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func (k Keeper) ScoresAll(c context.Context, req *types.QueryAllScoresRequest) (*types.QueryAllScoresResponse, error) {
	if req == nil {
		return nil, status.Error(codes.InvalidArgument, "invalid request")
	}

	var scoress []types.Scores
	ctx := sdk.UnwrapSDKContext(c)

	store := ctx.KVStore(k.storeKey)
	scoresStore := prefix.NewStore(store, types.KeyPrefix(types.ScoresKeyPrefix))

	pageRes, err := query.Paginate(scoresStore, req.Pagination, func(key []byte, value []byte) error {
		var scores types.Scores
		if err := k.cdc.Unmarshal(value, &scores); err != nil {
			return err
		}

		scoress = append(scoress, scores)
		return nil
	})

	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	return &types.QueryAllScoresResponse{Scores: scoress, Pagination: pageRes}, nil
}

func (k Keeper) Scores(c context.Context, req *types.QueryGetScoresRequest) (*types.QueryGetScoresResponse, error) {
	if req == nil {
		return nil, status.Error(codes.InvalidArgument, "invalid request")
	}
	ctx := sdk.UnwrapSDKContext(c)

	val, found := k.GetScores(
		ctx,
		req.Index,
	)
	if !found {
		return nil, status.Error(codes.NotFound, "not found")
	}

	return &types.QueryGetScoresResponse{Scores: val}, nil
}

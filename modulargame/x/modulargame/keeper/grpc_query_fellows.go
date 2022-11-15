// package keeper

// import (
// 	"context"

// 	sdk "github.com/cosmos/cosmos-sdk/types"
// 	"google.golang.org/grpc/codes"
// 	"google.golang.org/grpc/status"
// 	"modulargame/x/modulargame/types"
// )

// func (k Keeper) Fellows(goCtx context.Context, req *types.QueryFellowsRequest) (*types.QueryFellowsResponse, error) {
// 	if req == nil {
// 		return nil, status.Error(codes.InvalidArgument, "invalid request")
// 	}

// 	ctx := sdk.UnwrapSDKContext(goCtx)

// 	// TODO: Process the query
// 	_ = ctx

// 	return &types.QueryFellowsResponse{}, nil
// }

package keeper

import (
	"context"

	"github.com/cosmos/cosmos-sdk/store/prefix"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/cosmos/cosmos-sdk/types/query"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	"modulargame/x/modulargame/types"
)

func (k Keeper) Fellows(c context.Context, req *types.QueryFellowsRequest) (*types.QueryFellowsResponse, error) {
	// Throw an error if request is nil
	if req == nil {
		return nil, status.Error(codes.InvalidArgument, "invalid request")
	}

	// Define a variable that will store a list of recipes
	var fellows []*types.Fellow

	// Get context with the information about the environment
	ctx := sdk.UnwrapSDKContext(c)

	// Get the key-value module store using the store key (in our case store key is "chain")
	store := ctx.KVStore(k.storeKey)

	// Get the part of the store that keeps recipes (using recipe key, which is "Recipe-value-")
	fellowStore := prefix.NewStore(store, []byte(types.FellowKey))

	// Paginate the recipes store based on PageRequest
	pageRes, err := query.Paginate(fellowStore, req.Pagination, func(key []byte, value []byte) error {
		var fellow types.Fellow
		if err := k.cdc.Unmarshal(value, &fellow); err != nil {
			return err
		}

		fellows = append(fellows, &fellow)

		return nil
	})

	// Throw an error if pagination failed
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}

	// Return a struct containing a list of recipes and pagination info
	return &types.QueryFellowsResponse{Fellow: fellows, Pagination: pageRes}, nil
}

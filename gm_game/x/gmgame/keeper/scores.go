package keeper

import (
	"github.com/cosmos/cosmos-sdk/store/prefix"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"gm_game/x/gmgame/types"
)

// SetScores set a specific scores in the store from its index
func (k Keeper) SetScores(ctx sdk.Context, scores types.Scores) {
	store := prefix.NewStore(ctx.KVStore(k.storeKey), types.KeyPrefix(types.ScoresKeyPrefix))
	b := k.cdc.MustMarshal(&scores)
	store.Set(types.ScoresKey(
		scores.Index,
	), b)
}

// GetScores returns a scores from its index
func (k Keeper) GetScores(
	ctx sdk.Context,
	index string,

) (val types.Scores, found bool) {
	store := prefix.NewStore(ctx.KVStore(k.storeKey), types.KeyPrefix(types.ScoresKeyPrefix))

	b := store.Get(types.ScoresKey(
		index,
	))
	if b == nil {
		return val, false
	}

	k.cdc.MustUnmarshal(b, &val)
	return val, true
}

// RemoveScores removes a scores from the store
func (k Keeper) RemoveScores(
	ctx sdk.Context,
	index string,

) {
	store := prefix.NewStore(ctx.KVStore(k.storeKey), types.KeyPrefix(types.ScoresKeyPrefix))
	store.Delete(types.ScoresKey(
		index,
	))
}

// GetAllScores returns all scores
func (k Keeper) GetAllScores(ctx sdk.Context) (list []types.Scores) {
	store := prefix.NewStore(ctx.KVStore(k.storeKey), types.KeyPrefix(types.ScoresKeyPrefix))
	iterator := sdk.KVStorePrefixIterator(store, []byte{})

	defer iterator.Close()

	for ; iterator.Valid(); iterator.Next() {
		var val types.Scores
		k.cdc.MustUnmarshal(iterator.Value(), &val)
		list = append(list, val)
	}

	return
}

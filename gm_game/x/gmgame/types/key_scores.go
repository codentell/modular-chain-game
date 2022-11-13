package types

import "encoding/binary"

var _ binary.ByteOrder

const (
	// ScoresKeyPrefix is the prefix to retrieve all Scores
	ScoresKeyPrefix = "Scores/value/"
)

// ScoresKey returns the store key to retrieve a Scores from the index fields
func ScoresKey(
	index string,
) []byte {
	var key []byte

	indexBytes := []byte(index)
	key = append(key, indexBytes...)
	key = append(key, []byte("/")...)

	return key
}

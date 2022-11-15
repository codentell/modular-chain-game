package types

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	sdkerrors "github.com/cosmos/cosmos-sdk/types/errors"
)

const TypeMsgCreateFellow = "create_fellow"

var _ sdk.Msg = &MsgCreateFellow{}

func NewMsgCreateFellow(creator string, score string, x string, y string) *MsgCreateFellow {
	return &MsgCreateFellow{
		Creator: creator,
		Score:   score,
		X:       x,
		Y:       y,
	}
}

func (msg *MsgCreateFellow) Route() string {
	return RouterKey
}

func (msg *MsgCreateFellow) Type() string {
	return TypeMsgCreateFellow
}

func (msg *MsgCreateFellow) GetSigners() []sdk.AccAddress {
	creator, err := sdk.AccAddressFromBech32(msg.Creator)
	if err != nil {
		panic(err)
	}
	return []sdk.AccAddress{creator}
}

func (msg *MsgCreateFellow) GetSignBytes() []byte {
	bz := ModuleCdc.MustMarshalJSON(msg)
	return sdk.MustSortJSON(bz)
}

func (msg *MsgCreateFellow) ValidateBasic() error {
	_, err := sdk.AccAddressFromBech32(msg.Creator)
	if err != nil {
		return sdkerrors.Wrapf(sdkerrors.ErrInvalidAddress, "invalid creator address (%s)", err)
	}
	return nil
}

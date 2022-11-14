package types

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	sdkerrors "github.com/cosmos/cosmos-sdk/types/errors"
)

const TypeMsgCreateModularFellow = "create_modular_fellow"

var _ sdk.Msg = &MsgCreateModularFellow{}

func NewMsgCreateModularFellow(creator string, score string, x string, y string) *MsgCreateModularFellow {
	return &MsgCreateModularFellow{
		Creator: creator,
		Score:   score,
		X:       x,
		Y:       y,
	}
}

func (msg *MsgCreateModularFellow) Route() string {
	return RouterKey
}

func (msg *MsgCreateModularFellow) Type() string {
	return TypeMsgCreateModularFellow
}

func (msg *MsgCreateModularFellow) GetSigners() []sdk.AccAddress {
	creator, err := sdk.AccAddressFromBech32(msg.Creator)
	if err != nil {
		panic(err)
	}
	return []sdk.AccAddress{creator}
}

func (msg *MsgCreateModularFellow) GetSignBytes() []byte {
	bz := ModuleCdc.MustMarshalJSON(msg)
	return sdk.MustSortJSON(bz)
}

func (msg *MsgCreateModularFellow) ValidateBasic() error {
	_, err := sdk.AccAddressFromBech32(msg.Creator)
	if err != nil {
		return sdkerrors.Wrapf(sdkerrors.ErrInvalidAddress, "invalid creator address (%s)", err)
	}
	return nil
}

/* eslint-disable */
import _m0 from "protobufjs/minimal";
import { Nft } from "./nft";
import { Params } from "./params";
import { Scores } from "./scores";

export const protobufPackage = "gm_game.gmgame";

/** GenesisState defines the gmgame module's genesis state. */
export interface GenesisState {
  params: Params | undefined;
  nftList: Nft[];
  /** this line is used by starport scaffolding # genesis/proto/state */
  scoresList: Scores[];
}

function createBaseGenesisState(): GenesisState {
  return { params: undefined, nftList: [], scoresList: [] };
}

export const GenesisState = {
  encode(message: GenesisState, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.params !== undefined) {
      Params.encode(message.params, writer.uint32(10).fork()).ldelim();
    }
    for (const v of message.nftList) {
      Nft.encode(v!, writer.uint32(18).fork()).ldelim();
    }
    for (const v of message.scoresList) {
      Scores.encode(v!, writer.uint32(26).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): GenesisState {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseGenesisState();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.params = Params.decode(reader, reader.uint32());
          break;
        case 2:
          message.nftList.push(Nft.decode(reader, reader.uint32()));
          break;
        case 3:
          message.scoresList.push(Scores.decode(reader, reader.uint32()));
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): GenesisState {
    return {
      params: isSet(object.params) ? Params.fromJSON(object.params) : undefined,
      nftList: Array.isArray(object?.nftList) ? object.nftList.map((e: any) => Nft.fromJSON(e)) : [],
      scoresList: Array.isArray(object?.scoresList) ? object.scoresList.map((e: any) => Scores.fromJSON(e)) : [],
    };
  },

  toJSON(message: GenesisState): unknown {
    const obj: any = {};
    message.params !== undefined && (obj.params = message.params ? Params.toJSON(message.params) : undefined);
    if (message.nftList) {
      obj.nftList = message.nftList.map((e) => e ? Nft.toJSON(e) : undefined);
    } else {
      obj.nftList = [];
    }
    if (message.scoresList) {
      obj.scoresList = message.scoresList.map((e) => e ? Scores.toJSON(e) : undefined);
    } else {
      obj.scoresList = [];
    }
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<GenesisState>, I>>(object: I): GenesisState {
    const message = createBaseGenesisState();
    message.params = (object.params !== undefined && object.params !== null)
      ? Params.fromPartial(object.params)
      : undefined;
    message.nftList = object.nftList?.map((e) => Nft.fromPartial(e)) || [];
    message.scoresList = object.scoresList?.map((e) => Scores.fromPartial(e)) || [];
    return message;
  },
};

type Builtin = Date | Function | Uint8Array | string | number | boolean | undefined;

export type DeepPartial<T> = T extends Builtin ? T
  : T extends Array<infer U> ? Array<DeepPartial<U>> : T extends ReadonlyArray<infer U> ? ReadonlyArray<DeepPartial<U>>
  : T extends {} ? { [K in keyof T]?: DeepPartial<T[K]> }
  : Partial<T>;

type KeysOfUnion<T> = T extends T ? keyof T : never;
export type Exact<P, I extends P> = P extends Builtin ? P
  : P & { [K in keyof P]: Exact<P[K], I[K]> } & { [K in Exclude<keyof I, KeysOfUnion<P>>]: never };

function isSet(value: any): boolean {
  return value !== null && value !== undefined;
}

/* eslint-disable */
import Long from "long";
import _m0 from "protobufjs/minimal";

export const protobufPackage = "modular_gm_game_rollup.modulargmgamerollup";

export interface MsgCreateModularFellow {
  creator: string;
  score: string;
  x: string;
  y: string;
}

export interface MsgCreateModularFellowResponse {
  id: number;
}

function createBaseMsgCreateModularFellow(): MsgCreateModularFellow {
  return { creator: "", score: "", x: "", y: "" };
}

export const MsgCreateModularFellow = {
  encode(message: MsgCreateModularFellow, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.creator !== "") {
      writer.uint32(10).string(message.creator);
    }
    if (message.score !== "") {
      writer.uint32(18).string(message.score);
    }
    if (message.x !== "") {
      writer.uint32(26).string(message.x);
    }
    if (message.y !== "") {
      writer.uint32(34).string(message.y);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): MsgCreateModularFellow {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseMsgCreateModularFellow();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.creator = reader.string();
          break;
        case 2:
          message.score = reader.string();
          break;
        case 3:
          message.x = reader.string();
          break;
        case 4:
          message.y = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): MsgCreateModularFellow {
    return {
      creator: isSet(object.creator) ? String(object.creator) : "",
      score: isSet(object.score) ? String(object.score) : "",
      x: isSet(object.x) ? String(object.x) : "",
      y: isSet(object.y) ? String(object.y) : "",
    };
  },

  toJSON(message: MsgCreateModularFellow): unknown {
    const obj: any = {};
    message.creator !== undefined && (obj.creator = message.creator);
    message.score !== undefined && (obj.score = message.score);
    message.x !== undefined && (obj.x = message.x);
    message.y !== undefined && (obj.y = message.y);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<MsgCreateModularFellow>, I>>(object: I): MsgCreateModularFellow {
    const message = createBaseMsgCreateModularFellow();
    message.creator = object.creator ?? "";
    message.score = object.score ?? "";
    message.x = object.x ?? "";
    message.y = object.y ?? "";
    return message;
  },
};

function createBaseMsgCreateModularFellowResponse(): MsgCreateModularFellowResponse {
  return { id: 0 };
}

export const MsgCreateModularFellowResponse = {
  encode(message: MsgCreateModularFellowResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.id !== 0) {
      writer.uint32(8).uint64(message.id);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): MsgCreateModularFellowResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseMsgCreateModularFellowResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.id = longToNumber(reader.uint64() as Long);
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): MsgCreateModularFellowResponse {
    return { id: isSet(object.id) ? Number(object.id) : 0 };
  },

  toJSON(message: MsgCreateModularFellowResponse): unknown {
    const obj: any = {};
    message.id !== undefined && (obj.id = Math.round(message.id));
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<MsgCreateModularFellowResponse>, I>>(
    object: I,
  ): MsgCreateModularFellowResponse {
    const message = createBaseMsgCreateModularFellowResponse();
    message.id = object.id ?? 0;
    return message;
  },
};

/** Msg defines the Msg service. */
export interface Msg {
  /** this line is used by starport scaffolding # proto/tx/rpc */
  CreateModularFellow(request: MsgCreateModularFellow): Promise<MsgCreateModularFellowResponse>;
}

export class MsgClientImpl implements Msg {
  private readonly rpc: Rpc;
  constructor(rpc: Rpc) {
    this.rpc = rpc;
    this.CreateModularFellow = this.CreateModularFellow.bind(this);
  }
  CreateModularFellow(request: MsgCreateModularFellow): Promise<MsgCreateModularFellowResponse> {
    const data = MsgCreateModularFellow.encode(request).finish();
    const promise = this.rpc.request("modular_gm_game_rollup.modulargmgamerollup.Msg", "CreateModularFellow", data);
    return promise.then((data) => MsgCreateModularFellowResponse.decode(new _m0.Reader(data)));
  }
}

interface Rpc {
  request(service: string, method: string, data: Uint8Array): Promise<Uint8Array>;
}

declare var self: any | undefined;
declare var window: any | undefined;
declare var global: any | undefined;
var globalThis: any = (() => {
  if (typeof globalThis !== "undefined") {
    return globalThis;
  }
  if (typeof self !== "undefined") {
    return self;
  }
  if (typeof window !== "undefined") {
    return window;
  }
  if (typeof global !== "undefined") {
    return global;
  }
  throw "Unable to locate global object";
})();

type Builtin = Date | Function | Uint8Array | string | number | boolean | undefined;

export type DeepPartial<T> = T extends Builtin ? T
  : T extends Array<infer U> ? Array<DeepPartial<U>> : T extends ReadonlyArray<infer U> ? ReadonlyArray<DeepPartial<U>>
  : T extends {} ? { [K in keyof T]?: DeepPartial<T[K]> }
  : Partial<T>;

type KeysOfUnion<T> = T extends T ? keyof T : never;
export type Exact<P, I extends P> = P extends Builtin ? P
  : P & { [K in keyof P]: Exact<P[K], I[K]> } & { [K in Exclude<keyof I, KeysOfUnion<P>>]: never };

function longToNumber(long: Long): number {
  if (long.gt(Number.MAX_SAFE_INTEGER)) {
    throw new globalThis.Error("Value is larger than Number.MAX_SAFE_INTEGER");
  }
  return long.toNumber();
}

if (_m0.util.Long !== Long) {
  _m0.util.Long = Long as any;
  _m0.configure();
}

function isSet(value: any): boolean {
  return value !== null && value !== undefined;
}

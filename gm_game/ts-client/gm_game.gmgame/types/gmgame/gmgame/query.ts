/* eslint-disable */
import _m0 from "protobufjs/minimal";
import { PageRequest, PageResponse } from "../../cosmos/base/query/v1beta1/pagination";
import { Nft } from "./nft";
import { Params } from "./params";
import { Scores } from "./scores";

export const protobufPackage = "gm_game.gmgame";

/** QueryParamsRequest is request type for the Query/Params RPC method. */
export interface QueryParamsRequest {
}

/** QueryParamsResponse is response type for the Query/Params RPC method. */
export interface QueryParamsResponse {
  /** params holds all the parameters of this module. */
  params: Params | undefined;
}

export interface QueryGetNftRequest {
  index: string;
}

export interface QueryGetNftResponse {
  nft: Nft | undefined;
}

export interface QueryAllNftRequest {
  pagination: PageRequest | undefined;
}

export interface QueryAllNftResponse {
  nft: Nft[];
  pagination: PageResponse | undefined;
}

export interface QueryGetScoresRequest {
  index: string;
}

export interface QueryGetScoresResponse {
  scores: Scores | undefined;
}

export interface QueryAllScoresRequest {
  pagination: PageRequest | undefined;
}

export interface QueryAllScoresResponse {
  scores: Scores[];
  pagination: PageResponse | undefined;
}

function createBaseQueryParamsRequest(): QueryParamsRequest {
  return {};
}

export const QueryParamsRequest = {
  encode(_: QueryParamsRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryParamsRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryParamsRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(_: any): QueryParamsRequest {
    return {};
  },

  toJSON(_: QueryParamsRequest): unknown {
    const obj: any = {};
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryParamsRequest>, I>>(_: I): QueryParamsRequest {
    const message = createBaseQueryParamsRequest();
    return message;
  },
};

function createBaseQueryParamsResponse(): QueryParamsResponse {
  return { params: undefined };
}

export const QueryParamsResponse = {
  encode(message: QueryParamsResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.params !== undefined) {
      Params.encode(message.params, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryParamsResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryParamsResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.params = Params.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryParamsResponse {
    return { params: isSet(object.params) ? Params.fromJSON(object.params) : undefined };
  },

  toJSON(message: QueryParamsResponse): unknown {
    const obj: any = {};
    message.params !== undefined && (obj.params = message.params ? Params.toJSON(message.params) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryParamsResponse>, I>>(object: I): QueryParamsResponse {
    const message = createBaseQueryParamsResponse();
    message.params = (object.params !== undefined && object.params !== null)
      ? Params.fromPartial(object.params)
      : undefined;
    return message;
  },
};

function createBaseQueryGetNftRequest(): QueryGetNftRequest {
  return { index: "" };
}

export const QueryGetNftRequest = {
  encode(message: QueryGetNftRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.index !== "") {
      writer.uint32(10).string(message.index);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryGetNftRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryGetNftRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.index = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryGetNftRequest {
    return { index: isSet(object.index) ? String(object.index) : "" };
  },

  toJSON(message: QueryGetNftRequest): unknown {
    const obj: any = {};
    message.index !== undefined && (obj.index = message.index);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryGetNftRequest>, I>>(object: I): QueryGetNftRequest {
    const message = createBaseQueryGetNftRequest();
    message.index = object.index ?? "";
    return message;
  },
};

function createBaseQueryGetNftResponse(): QueryGetNftResponse {
  return { nft: undefined };
}

export const QueryGetNftResponse = {
  encode(message: QueryGetNftResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.nft !== undefined) {
      Nft.encode(message.nft, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryGetNftResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryGetNftResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.nft = Nft.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryGetNftResponse {
    return { nft: isSet(object.nft) ? Nft.fromJSON(object.nft) : undefined };
  },

  toJSON(message: QueryGetNftResponse): unknown {
    const obj: any = {};
    message.nft !== undefined && (obj.nft = message.nft ? Nft.toJSON(message.nft) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryGetNftResponse>, I>>(object: I): QueryGetNftResponse {
    const message = createBaseQueryGetNftResponse();
    message.nft = (object.nft !== undefined && object.nft !== null) ? Nft.fromPartial(object.nft) : undefined;
    return message;
  },
};

function createBaseQueryAllNftRequest(): QueryAllNftRequest {
  return { pagination: undefined };
}

export const QueryAllNftRequest = {
  encode(message: QueryAllNftRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.pagination !== undefined) {
      PageRequest.encode(message.pagination, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryAllNftRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryAllNftRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.pagination = PageRequest.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryAllNftRequest {
    return { pagination: isSet(object.pagination) ? PageRequest.fromJSON(object.pagination) : undefined };
  },

  toJSON(message: QueryAllNftRequest): unknown {
    const obj: any = {};
    message.pagination !== undefined
      && (obj.pagination = message.pagination ? PageRequest.toJSON(message.pagination) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryAllNftRequest>, I>>(object: I): QueryAllNftRequest {
    const message = createBaseQueryAllNftRequest();
    message.pagination = (object.pagination !== undefined && object.pagination !== null)
      ? PageRequest.fromPartial(object.pagination)
      : undefined;
    return message;
  },
};

function createBaseQueryAllNftResponse(): QueryAllNftResponse {
  return { nft: [], pagination: undefined };
}

export const QueryAllNftResponse = {
  encode(message: QueryAllNftResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    for (const v of message.nft) {
      Nft.encode(v!, writer.uint32(10).fork()).ldelim();
    }
    if (message.pagination !== undefined) {
      PageResponse.encode(message.pagination, writer.uint32(18).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryAllNftResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryAllNftResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.nft.push(Nft.decode(reader, reader.uint32()));
          break;
        case 2:
          message.pagination = PageResponse.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryAllNftResponse {
    return {
      nft: Array.isArray(object?.nft) ? object.nft.map((e: any) => Nft.fromJSON(e)) : [],
      pagination: isSet(object.pagination) ? PageResponse.fromJSON(object.pagination) : undefined,
    };
  },

  toJSON(message: QueryAllNftResponse): unknown {
    const obj: any = {};
    if (message.nft) {
      obj.nft = message.nft.map((e) => e ? Nft.toJSON(e) : undefined);
    } else {
      obj.nft = [];
    }
    message.pagination !== undefined
      && (obj.pagination = message.pagination ? PageResponse.toJSON(message.pagination) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryAllNftResponse>, I>>(object: I): QueryAllNftResponse {
    const message = createBaseQueryAllNftResponse();
    message.nft = object.nft?.map((e) => Nft.fromPartial(e)) || [];
    message.pagination = (object.pagination !== undefined && object.pagination !== null)
      ? PageResponse.fromPartial(object.pagination)
      : undefined;
    return message;
  },
};

function createBaseQueryGetScoresRequest(): QueryGetScoresRequest {
  return { index: "" };
}

export const QueryGetScoresRequest = {
  encode(message: QueryGetScoresRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.index !== "") {
      writer.uint32(10).string(message.index);
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryGetScoresRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryGetScoresRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.index = reader.string();
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryGetScoresRequest {
    return { index: isSet(object.index) ? String(object.index) : "" };
  },

  toJSON(message: QueryGetScoresRequest): unknown {
    const obj: any = {};
    message.index !== undefined && (obj.index = message.index);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryGetScoresRequest>, I>>(object: I): QueryGetScoresRequest {
    const message = createBaseQueryGetScoresRequest();
    message.index = object.index ?? "";
    return message;
  },
};

function createBaseQueryGetScoresResponse(): QueryGetScoresResponse {
  return { scores: undefined };
}

export const QueryGetScoresResponse = {
  encode(message: QueryGetScoresResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.scores !== undefined) {
      Scores.encode(message.scores, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryGetScoresResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryGetScoresResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.scores = Scores.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryGetScoresResponse {
    return { scores: isSet(object.scores) ? Scores.fromJSON(object.scores) : undefined };
  },

  toJSON(message: QueryGetScoresResponse): unknown {
    const obj: any = {};
    message.scores !== undefined && (obj.scores = message.scores ? Scores.toJSON(message.scores) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryGetScoresResponse>, I>>(object: I): QueryGetScoresResponse {
    const message = createBaseQueryGetScoresResponse();
    message.scores = (object.scores !== undefined && object.scores !== null)
      ? Scores.fromPartial(object.scores)
      : undefined;
    return message;
  },
};

function createBaseQueryAllScoresRequest(): QueryAllScoresRequest {
  return { pagination: undefined };
}

export const QueryAllScoresRequest = {
  encode(message: QueryAllScoresRequest, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    if (message.pagination !== undefined) {
      PageRequest.encode(message.pagination, writer.uint32(10).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryAllScoresRequest {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryAllScoresRequest();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.pagination = PageRequest.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryAllScoresRequest {
    return { pagination: isSet(object.pagination) ? PageRequest.fromJSON(object.pagination) : undefined };
  },

  toJSON(message: QueryAllScoresRequest): unknown {
    const obj: any = {};
    message.pagination !== undefined
      && (obj.pagination = message.pagination ? PageRequest.toJSON(message.pagination) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryAllScoresRequest>, I>>(object: I): QueryAllScoresRequest {
    const message = createBaseQueryAllScoresRequest();
    message.pagination = (object.pagination !== undefined && object.pagination !== null)
      ? PageRequest.fromPartial(object.pagination)
      : undefined;
    return message;
  },
};

function createBaseQueryAllScoresResponse(): QueryAllScoresResponse {
  return { scores: [], pagination: undefined };
}

export const QueryAllScoresResponse = {
  encode(message: QueryAllScoresResponse, writer: _m0.Writer = _m0.Writer.create()): _m0.Writer {
    for (const v of message.scores) {
      Scores.encode(v!, writer.uint32(10).fork()).ldelim();
    }
    if (message.pagination !== undefined) {
      PageResponse.encode(message.pagination, writer.uint32(18).fork()).ldelim();
    }
    return writer;
  },

  decode(input: _m0.Reader | Uint8Array, length?: number): QueryAllScoresResponse {
    const reader = input instanceof _m0.Reader ? input : new _m0.Reader(input);
    let end = length === undefined ? reader.len : reader.pos + length;
    const message = createBaseQueryAllScoresResponse();
    while (reader.pos < end) {
      const tag = reader.uint32();
      switch (tag >>> 3) {
        case 1:
          message.scores.push(Scores.decode(reader, reader.uint32()));
          break;
        case 2:
          message.pagination = PageResponse.decode(reader, reader.uint32());
          break;
        default:
          reader.skipType(tag & 7);
          break;
      }
    }
    return message;
  },

  fromJSON(object: any): QueryAllScoresResponse {
    return {
      scores: Array.isArray(object?.scores) ? object.scores.map((e: any) => Scores.fromJSON(e)) : [],
      pagination: isSet(object.pagination) ? PageResponse.fromJSON(object.pagination) : undefined,
    };
  },

  toJSON(message: QueryAllScoresResponse): unknown {
    const obj: any = {};
    if (message.scores) {
      obj.scores = message.scores.map((e) => e ? Scores.toJSON(e) : undefined);
    } else {
      obj.scores = [];
    }
    message.pagination !== undefined
      && (obj.pagination = message.pagination ? PageResponse.toJSON(message.pagination) : undefined);
    return obj;
  },

  fromPartial<I extends Exact<DeepPartial<QueryAllScoresResponse>, I>>(object: I): QueryAllScoresResponse {
    const message = createBaseQueryAllScoresResponse();
    message.scores = object.scores?.map((e) => Scores.fromPartial(e)) || [];
    message.pagination = (object.pagination !== undefined && object.pagination !== null)
      ? PageResponse.fromPartial(object.pagination)
      : undefined;
    return message;
  },
};

/** Query defines the gRPC querier service. */
export interface Query {
  /** Parameters queries the parameters of the module. */
  Params(request: QueryParamsRequest): Promise<QueryParamsResponse>;
  /** Queries a Nft by index. */
  Nft(request: QueryGetNftRequest): Promise<QueryGetNftResponse>;
  /** Queries a list of Nft items. */
  NftAll(request: QueryAllNftRequest): Promise<QueryAllNftResponse>;
  /** Queries a Scores by index. */
  Scores(request: QueryGetScoresRequest): Promise<QueryGetScoresResponse>;
  /** Queries a list of Scores items. */
  ScoresAll(request: QueryAllScoresRequest): Promise<QueryAllScoresResponse>;
}

export class QueryClientImpl implements Query {
  private readonly rpc: Rpc;
  constructor(rpc: Rpc) {
    this.rpc = rpc;
    this.Params = this.Params.bind(this);
    this.Nft = this.Nft.bind(this);
    this.NftAll = this.NftAll.bind(this);
    this.Scores = this.Scores.bind(this);
    this.ScoresAll = this.ScoresAll.bind(this);
  }
  Params(request: QueryParamsRequest): Promise<QueryParamsResponse> {
    const data = QueryParamsRequest.encode(request).finish();
    const promise = this.rpc.request("gm_game.gmgame.Query", "Params", data);
    return promise.then((data) => QueryParamsResponse.decode(new _m0.Reader(data)));
  }

  Nft(request: QueryGetNftRequest): Promise<QueryGetNftResponse> {
    const data = QueryGetNftRequest.encode(request).finish();
    const promise = this.rpc.request("gm_game.gmgame.Query", "Nft", data);
    return promise.then((data) => QueryGetNftResponse.decode(new _m0.Reader(data)));
  }

  NftAll(request: QueryAllNftRequest): Promise<QueryAllNftResponse> {
    const data = QueryAllNftRequest.encode(request).finish();
    const promise = this.rpc.request("gm_game.gmgame.Query", "NftAll", data);
    return promise.then((data) => QueryAllNftResponse.decode(new _m0.Reader(data)));
  }

  Scores(request: QueryGetScoresRequest): Promise<QueryGetScoresResponse> {
    const data = QueryGetScoresRequest.encode(request).finish();
    const promise = this.rpc.request("gm_game.gmgame.Query", "Scores", data);
    return promise.then((data) => QueryGetScoresResponse.decode(new _m0.Reader(data)));
  }

  ScoresAll(request: QueryAllScoresRequest): Promise<QueryAllScoresResponse> {
    const data = QueryAllScoresRequest.encode(request).finish();
    const promise = this.rpc.request("gm_game.gmgame.Query", "ScoresAll", data);
    return promise.then((data) => QueryAllScoresResponse.decode(new _m0.Reader(data)));
  }
}

interface Rpc {
  request(service: string, method: string, data: Uint8Array): Promise<Uint8Array>;
}

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

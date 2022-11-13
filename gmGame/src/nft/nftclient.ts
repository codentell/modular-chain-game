//import { MsgCreateNFT, MsgUpdateNFT, MsgTransferNFT } from "../../generated/singhp1069/spunky/singhp1069.spunky.spunky/module/types/spunky/tx";
// import { KeplrWallet } from '../wallet/keplrwallet';
import {BroadcastTxResponse, SigningStargateClient, StdFee} from "@cosmjs/stargate";
import { EncodeObject, Registry } from '@cosmjs/proto-signing';
import axios, { AxiosResponse } from 'axios';
import {REST_ENDPOINT} from '../config';


export class NFTClient {
    public rpcUri: string;
    //private keplr: KeplrWallet;
    private client: SigningStargateClient;
    private registry: Registry;
    types = [
      ["/singhp1069.spunky.spunky.MsgCreateNFT", MsgCreateNFT],
      ["/singhp1069.spunky.spunky.MsgUpdateNFT", MsgUpdateNFT],
      ["/singhp1069.spunky.spunky.MsgTransferNFT", MsgTransferNFT],
    ];

    // constructor(keplr: KeplrWallet) {
    //     this.rpcUri = keplr.rpcUri;
    //     //this.keplr = keplr;
    //     this.registry = new Registry(<any>this.types);
    // }

    // public static async build(keplr: KeplrWallet) {
    //     const client: NFTClient = new NFTClient(keplr);
    //     await client.init();
    //     return client;
    // }

    // private async init() {
    //     this.client = await SigningStargateClient.connectWithSigner(this.rpcUri, this.keplr.getOfflineSigner(), {registry: this.registry} );
    // }

    // public async createNFT(name: string, symbol: string, description: string, uri: string, uriHash: string): Promise<BroadcastTxResponse> {
    //   const walletAddress =await this.keplr.getSignerAddress();
    //   const createNFT = MsgCreateNFT.fromPartial({creator: walletAddress, name: name, symbol: symbol, description: description, uri: uri, uriHash: uriHash });
    //   const msgAny: EncodeObject = {
    //     typeUrl: "/singhp1069.spunky.spunky.MsgCreateNFT",
    //     value: createNFT,
    //   };
    //   const fee: StdFee = {
    //     amount: [],
    //     gas: "200000",
    //   };
    //   const memo = "";
     
    //   return this.client.signAndBroadcast(walletAddress, [msgAny], fee, memo);
    // }

    // public async updateNFT(nft: number, name: string, symbol: string, description: string, uri: string, uriHash: string) : Promise<BroadcastTxResponse> {
    //   const walletAddress =await this.keplr.getSignerAddress();
    //   const updateNFT = MsgUpdateNFT.fromPartial({creator: walletAddress, id: nft, name: name, symbol: symbol, description: description, uri: uri, uriHash: uriHash });
    //   const msgAny: EncodeObject = {
    //     typeUrl: "/singhp1069.spunky.spunky.MsgUpdateNFT",
    //     value: updateNFT,
    //   };
    //   const fee: StdFee = {
    //     amount: [],
    //     gas: "200000",
    //   };
    //   const memo = "";
     
    //   return this.client.signAndBroadcast(walletAddress, [msgAny], fee, memo);
    // }

    public async transferNFT(recipient: string, nft: number) : Promise<BroadcastTxResponse> {
        const walletAddress =await this.keplr.getSignerAddress();
        const transferNFT = MsgTransferNFT.fromPartial({creator: walletAddress, recipient: recipient, nft: nft });
        const msgAny: EncodeObject = {
          typeUrl: "/singhp1069.spunky.spunky.MsgTransferNFT",
          value: transferNFT,
        };
        const fee: StdFee = {
          amount: [],
          gas: "200000",
        };
        const memo = "";
       
        return this.client.signAndBroadcast(walletAddress, [msgAny], fee, memo);
      }

    public async getAllNFT() : Promise<NFTs> {
      let result: AxiosResponse = await axios.get(`${REST_ENDPOINT}/gm_game/gmgame/nft`);
      let NFTs: NFTs = result.data;
      return NFTs;
    }

    public async getNFTById(id: string) : Promise<NFTByID> {
      let result: AxiosResponse = await axios.get(`${REST_ENDPOINT}/spunky/NFT/${id}`);
      let NFT: NFTByID = result.data;
      return NFT;
    }
}

export interface NFT {
    id: string;
    name: string;
    symbol: string;
    description: string;
    uri: string;
    uriHash: string;
    creator: string;
    owner: string;
}

export interface Pagination {
    nextKey: string;
    total: string;
}

export interface NFTs {
    NFT: NFT[];
    pagination: Pagination;
}


export interface NFTByID {
    NFT: NFT;
  }
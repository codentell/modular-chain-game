const axios = require("axios");

const REST_ENDPOINT =  'http://localhost:1317';

const getAllNFT = async () =>  {
    let result = await axios.get(`${REST_ENDPOINT}/gm_game/gmgame/nft`);
    let NFTs = result.data;
    return NFTs;
  }



getAllNFT()
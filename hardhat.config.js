require("@nomiclabs/hardhat-waffle")
const projectId = "95fdbb6b356846af99ce14ffde9a6a14"
const fs = require("fs")
const keyData = fs.readFileSync("./p-key.txt", {
  encoding: "utf8",
  flag: "r",
})

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      chainId: 1337, // meta maskのローカル構成時は1337を使う
    },
    mumbai: {
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: [keyData],
    },
    mainnet: {
      url: `https://mainnet.infura.io/v3/${projectId}`,
      accounts: [keyData],
    },
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
}

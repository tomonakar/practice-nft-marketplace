import "../styles/globals.css"
import "./app.css"
import Link from "next/link"

function KryptoBirdMarketplace({ Component, pageProps }) {
  return (
    <div>
      <nav className="border-b p-6" style={{ backgroundColor: "purple" }}>
        <p cpassName="text-4x1 font-bold text-white">NFT マーケットプレイス</p>
        <div className="flex mt-4 justify-center"></div>
        <Link href="/">
          <a className="mr-4">Mainマーケットプレイス</a>
        </Link>
      </nav>
    </div>
  )
}

export default KryptoBirdMarketplace

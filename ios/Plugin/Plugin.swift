import Foundation
import Capacitor
import SwiftECC

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(Ecc)
public class Ecc: CAPPlugin {

    
     @objc func generateKeys(_ call: CAPPluginCall) {
        let domain = Domain.instance(curve: .EC256k1)
        let (pubKey, privKey) = domain.makeKeyPair()
        call.success([
            "publicKey": pubKey.pem,
            "privateKey":privKey.pem
        ])
    }
    

    @objc func encrypt(_ call: CAPPluginCall) {
        let pemPublic163k1 = call.getString("publickey") ?? ""
        let plaintext      = call.getString("plaintext") ?? ""
        var encryptedData  = ""
        
        do {
          let pubKey = try ECPublicKey(pem: pemPublic163k1)
            encryptedData = pubKey.encrypt(msg: plaintext.data(using: .utf8)!, cipher: .AES128).base64EncodedString()
        } catch {
          print("\(error)")
        }
    
        call.success([
            "value": encryptedData
        ])
    }

    @objc func decrypt(_ call: CAPPluginCall) {
        let pemPrivate163k1 = call.getString("privatekey") ?? ""
        var crypttext       = call.getString("crypttext") ?? ""
        var decryptedData:String?   = ""
        
        do {

          let privKey  = try ECPrivateKey(pem: pemPrivate163k1)
            var dataText: Data? =  Data(base64Encoded: crypttext)
            let decrypted: Data? =  try privKey.decrypt(msg: dataText ?? <#default value#>, cipher: .AES128)
            decryptedData = String(data: decrypted ?? <#default value#>, encoding: .utf8)
            
        } catch {
          print("\(error)")
        }
        
        call.success([
            "value": decryptedData
        ])
    }




}

declare module '@capacitor/core' {
  interface PluginRegistry {
    Ecc: EccPlugin;
  }
}

export interface EccPlugin {
  generateKeys(options: {}): Promise<{ publicKey: string, privateKey: string }>;
  encrypt(options: { publickey: string, plaintext: string }): Promise<{ value: string }>;
  decrypt(options: { privatekey: string, crypttext: string }): Promise<{ value: string }>;
}

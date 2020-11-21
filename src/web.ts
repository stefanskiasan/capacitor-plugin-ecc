import { WebPlugin } from '@capacitor/core';
import { EccPlugin } from './definitions';

export class EccWeb extends WebPlugin implements EccPlugin {
  constructor() {
    super({
      name: 'Ecc',
      platforms: ['web'],
    });
  }


  async generateKeys(): Promise<{ publicKey: string, privateKey: string }> {
    return new Promise(() => {

    });
  }

  async encrypt(): Promise<{ value: string }> {
    return new Promise(() => {

    });
  }

  async decrypt(): Promise<{ value: string }> {
    return new Promise(() => {

    });
  }
}

const Ecc = new EccWeb();

export { Ecc };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(Ecc);

declare module "@vimeo/vimeo" {
  export class Vimeo {
    constructor(clientId: string | null, clientSecret: string | null, accessToken?: string);
    request(
      options: {
        method: string;
        path: string;
        query?: any;
        [key: string]: any;
      },
      callback: (error: any, body: any, statusCode: number, headers: any) => void
    ): void;
  }
  
  const vimeoModule: {
    Vimeo: typeof Vimeo;
  };
  
  export default vimeoModule;
}

class Encrypt {

    constructor() {
        this.jsEncrypt = null;
        this.CryptoJS = null;

    }
    /**
     * rsa加密
     */
    static rsaEncrypt(str, publicKey) {
        if (!this.jsEncrypt) {
            const { JSEncrypt } = require('jsencrypt');
            this.jsEncrypt = new JSEncrypt();
        }
        if (typeof str !== 'string') {
            str = JSON.stringify(str);
        }
        if (!publicKey) {
            const rsaPublicKey = `MIICWwIBAAKBgQCJjmcybjyGstQDAUCukI6opPvkaG4JKeMAU6FQkqeDEZp8cb8v
            H+z7KjO+9FxfLrE5iZMrBYJKLBrv6Ye4JiOYL7VF7Q4frzsLJT1RXhrTQMM/x0Ad
            AKAEl/QSKC7R8qbpYATs3Ft1ecJ1bT8Gk+X+rwg+ypQ8S9TksqkF9g8/lwIDAQAB
            AoGABY9c+nvcNHGcAjcVvziWm5h3mgbik7o+s6+tsI0M+k5G2UrbuHLo6EoPZ2OH
            LE292h6GdVG2r3rS5+mfk8Du5VMvvBCtI93zUqzD6yUaBV3oeKid2Lobh1OW79eH
            Se07oICGLXkp896vkVPqR1lPUHmbuW49pbTqJN4OEji/UQkCQQCQjBWXNBgvGaoC
            orTqJOpMPWaYj/QO/SQG4g63kEF9sm3SmHJYSYJEiCWVVLJpUp8c6o1TLD1por9b
            02eSQ4CbAkEA855jnJKPRXOPUhf2U5HwToKze/OU5T3YoXlHuDeZM2EhwlEhL/Oy
            yKiTvB744YxW4XA4YSvj9pn1YuugPlgWtQJAfyUpjLH/H9cUS3MxbdAA5AUSbNob
            FOAoQ4Gu7lqOsPE1VwxPcEdgtcWIQZ2Zvbk2Smoq2+FLN9M3PZ9sOCT2RwJAKrQ5
            AdkvBB2doeZRZ5TNavW+QJwSHZ0ZvDRmPgSA9mCwaj+OcblmPYZPX0qOlfrjv+DM
            ATyQWUnjmdNz43nNgQJAKVG0rhuwGdnYPpTy9X+wT35tBfSnID+I6oQ0vbmkwNrU
            LfLPVwGFNNUXMamdSaUu4dKkjoqv8fDmVj3m++rJjQ==`;
            publicKey = rsaPublicKey;
        }
        this.jsEncrypt.setPublicKey(publicKey);
        return this.jsEncrypt.encrypt(str);
    }

    /**
     * rsa解密
     * @privateKey 由于私钥只保存在后端，此方法只用于前端临时测试
     */
    static rsaDecrypt(str, privateKey) {
        if (!this.jsEncrypt) {
            const { JSEncrypt } = require('jsencrypt');
            this.jsEncrypt = new JSEncrypt();
        }
        this.jsEncrypt.setPrivateKey(privateKey);
        return this.jsEncrypt.decrypt(str);
    }

    /**
     * aes加密
     * @key 最好动态生成，由于是对称算法，加解密需要同样的key
     */
    static aesEncrypt(str, key) {
        if (typeof str !== 'string') {
            str = JSON.stringify(str);
        }
        if (!this.CryptoJS) {
            // 加载核心加密库
            this.CryptoJS = require("crypto-js");
        }
        const parseStr = this.CryptoJS.enc.Utf8.parse(str);
        const parseKey = this.CryptoJS.enc.Utf8.parse(key);
        const aesEncrypt = this.CryptoJS.AES.encrypt(parseStr, parseKey, {
            iv: parseKey,
            mode: this.CryptoJS.mode.CBC,
            padding: this.CryptoJS.pad.Pkcs7
        }).toString();
        return aesEncrypt;
    }

    /**
     * aes解密
     * 本方法主要用于解密后端返回的加密数据，具体实现方法：
     * 前端动态生成key，把key和其他要传递的参数用rsa非对称算法加密传给后端，
     * 后端用私钥解密得到key，然后使用key调用aes对称加密数据，最后把数据传回前端，前端再调用aes解密方法得到数据
     */
    static aesDecrypt(str, key) {
        if (!this.CryptoJS) {
            // 加载核心加密库
            this.CryptoJS = require("crypto-js");
        }
        const parseKey = this.CryptoJS.enc.Utf8.parse(key);
        const aesDecrypt = this.CryptoJS.AES.decrypt(str, parseKey, {
            iv: parseKey,
            mode: this.CryptoJS.mode.CBC,
            padding: this.CryptoJS.pad.Pkcs7
        }).toString(this.CryptoJS.enc.Utf8);
        return JSON.parse(aesDecrypt);
    }

    /**
     * 字符串md5
     */
    static md5(str) {
        if (!this.CryptoJS) {
            // 加载核心加密库
            this.CryptoJS = require("crypto-js");
        }
        return this.CryptoJS.MD5(str).toString();
    }
    /**
     * 产生一个随机的32位长度字符串
     */
    static uuid() {
        let text = '';
        const possible = 'abcdef0123456789';
        for (let i = 0; i < 19; i++) {
            text += possible.charAt(Math.floor(Math.random() * possible.length));
        }
        return text + new Date().getTime();
    }
}

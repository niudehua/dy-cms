package com.fh.controller.wxpay;

public interface WxPayConstants {

    /**
     * 微信分配的公众账号ID
     */
//    String APP_ID = "wx297629c19cf03bed";
    String APP_ID = "wx20a3824f4e323e68";

    /**
     * 平台秘钥
     */
    String APPSECRET = "平台密钥";

    /**
     * 微信支付分配的商户号 合作者id
     */
    String MCH_ID = "1607082615";
    //    public static final String PATERNERKEY = "商家密钥";
    String PATERNERKEY = "5cabd672145743b1bef4cd2849d0e07f";

    /**
     * 支付平台公钥(签名校验使用)
     */
    String KEY_PUBLIC = "-----BEGIN PRIVATE KEY-----\n"+"MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDHW/Tc0s/irxvFcnRIMjSaS9wI2j/F4EAU+gGoSsT0S1JicxUiyNAfFPHmsD7VegswVA14SZaXBCNIvtYr0Sy13yvMKu65vJqv+FDwyZALFhU3wU1kn3X/bzAcS+knzXdDdDZSMAIYqMCv6Vty743HhycNYFEeXR0mYRsQ6V/R8lfDqzHbQxs4iKqknnI5cCfWguLiMb2vq9Is3wwnLKGW1Hu2srgQBzF7LW+TleO7TYnWessslu5OQDhf8mMJyluoCGB4b5BYTaoHFgQYdiAA7gETkLyAouNXzwzgMQKAH6QhIZ66/2kluzr9ZGxsV7YiGKPSFt4bBnWdlbTWnn4jAgMBAAECggEAByIiM9iTObA8VSdQQ9kQCslWGTb9+y2X/WgosQXj4D3lt8IYaoM29zW/php+VRMl3VfUl45ChirOvGafsTet2uAeaBLNMfYursc61jLQJaVnovQWudf+1+H5nbmVoSf38YDyBKTVHl7DbkfyTr2FnDMY0aC1pll8lof4+PTwyclK66j0G806JM31UtPEdziTh11UzVViWOCriFgKRi3L/nV0BeQXxcErp3Uzy8lD4It1/4bWSKbgXvihpdriJ3gG4uqZi5RJPyRGo1/RvV6YnMW8rMFnqB+mKbAk0RsSve+coVKvCnq5DnWwKWdJ1FdZWvfQDMQfBt6LWU5ditaeiQKBgQDuoseQixMPO6hMd3ZYgNmoL0Kv9xHlsCjdfHjAoa62k78eZZg8HrASozrArxWiNSCSJ/qz12zS4VYgyKIB/106MWu8+iEWW86f3njaTr0JA3taFMfUI1B1U9ejDkdz6SQQFO9PA2rS5ev1R6mX83KWygrS/cF1uVdL6w8VpfR3XQKBgQDV3YvGWRpUCReX1zssR+vlS6x5ziymvAsnO4becDI+01P5f9CdJYdv/wvDosZg/EJOJPdS4qEZJkg8p72L58zVKSiKzUD1aLv6zdhR8Pyqw4zpwKjEY/KoYkEn9tLB5d910KpbYVz2MDn4oICCMx3sU+MhAUrXTDmQjOTZypLzfwKBgQCamnVGbQPVG6ZmnALdReU9tBi1XhGHSIDBNfIZguZpPQFWFSXy1ULnYD8hNI2EgHzwk9w1hXzohrrBFJr5RlNE713ImhiznpkYNA8CCH8qBsp0yv/HrXVj/gS3i/m427PUg2ujOiiMKA+d4ma6niuAC7fFiEc9GO24rrogIVtntQKBgGkd35m6KeqsHWCQdZEqOJQXQcsMv32kZ4b9BylF1Cx1Co1TeWIEFDHEFjAuTXtWAfEO0lF2+t+1pUPK3qtpX5BWDotKn2b/94Uqr+x2mnoEa7po64q75YVF5eiStLyBE/iAe3s2u851ncjKet+D6G1EPhr226Y+3PxjhAhYPSpZAoGBAMhR6v4pCALnYNpZ0svQ3keVdAw0VxC847gWCJ5n2ZqhziDrHhEQJ+6WvPN+q3Tv4FKuW6wBoLNXXDLN3x4wLaypduYJvRJWjaShUR/+vjBsQ0j4/HEl8HAKlS2lbRcRkrkBEXLkgsTP/RN3OmD10jSKzOYvaLIgVXX2/SElUHkm\n"+"-----END PRIVATE KEY-----";

    /**
     * 应用私钥，rsa_private pkcs8格式 生成签名时使用
     */
    String KEY_PRIVATE = "-----BEGIN CERTIFICATE-----\n"+"MIID8zCCAtugAwIBAgIUW9w0NaGsCDWQCfe4mBTXt3UvvH0wDQYJKoZIhvcNAQELBQAwXjELMAkGA1UEBhMCQ04xEzARBgNVBAoTClRlbnBheS5jb20xHTAbBgNVBAsTFFRlbnBheS5jb20gQ0EgQ2VudGVyMRswGQYDVQQDExJUZW5wYXkuY29tIFJvb3QgQ0EwHhcNMjEwMzA2MDU0MzI2WhcNMjYwMzA1MDU0MzI2WjCBhDETMBEGA1UEAwwKMTYwNzA4MjYxNTEbMBkGA1UECgwS5b6u5L+h5ZWG5oi357O757ufMTAwLgYDVQQLDCflhoXokpnlj6TmmJ/nm5vosarmiJDnp5HmioDmnInpmZDlhazlj7gxCzAJBgNVBAYMAkNOMREwDwYDVQQHDAhTaGVuWmhlbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMdb9NzSz+KvG8VydEgyNJpL3AjaP8XgQBT6AahKxPRLUmJzFSLI0B8U8eawPtV6CzBUDXhJlpcEI0i+1ivRLLXfK8wq7rm8mq/4UPDJkAsWFTfBTWSfdf9vMBxL6SfNd0N0NlIwAhiowK/pW3LvjceHJw1gUR5dHSZhGxDpX9HyV8OrMdtDGziIqqSecjlwJ9aC4uIxva+r0izfDCcsoZbUe7ayuBAHMXstb5OV47tNidZ6yyyW7k5AOF/yYwnKW6gIYHhvkFhNqgcWBBh2IADuAROQvICi41fPDOAxAoAfpCEhnrr/aSW7Ov1kbGxXtiIYo9IW3hsGdZ2VtNaefiMCAwEAAaOBgTB/MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgTwMGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly9ldmNhLml0cnVzLmNvbS5jbi9wdWJsaWMvaXRydXNjcmw/Q0E9MUJENDIyMEU1MERCQzA0QjA2QUQzOTc1NDk4NDZDMDFDM0U4RUJEMjANBgkqhkiG9w0BAQsFAAOCAQEAaU03Z0xP6DJsQ1mHoIcBOX6UduqEG7cIzpP4FuFbn8OAH7759b++ep10iWueZQNn4VH56TnkN1oCO4LToSo7TO6PUomLzVdTTfZ2D6UurNPgWAVfyQXAzaViJ7/pEFPsGIOHxYMz8vY4dOvSlvMUG2E9uoTg04dKOcNSH6S1aHjqf/X0SeePMqdn3Bw4RPD1ezCtlVKPFNlCQ+Mr0emu7qa1we2C/eqx9l9rpEfLI7sen3hRl8EDO4++bdjEaJttKrCTcqacmJvJYvEI8G+S6RlEGclTNETtNQCmwMM9BYPxEV3FSG/tG/crD2ILmYiCGTyH2peXZo0NhsxvAZDeGA==\n"+"-----END CERTIFICATE-----";


}
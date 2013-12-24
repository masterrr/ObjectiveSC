//
//  ScutilWrapper.h
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#import <Foundation/Foundation.h>

@interface ObjectiveSC : NSObject

// Host
+(NSString*)computerName;
+(NSString*)computerLocalName;

// Proxies
typedef enum { pHTTP, pHTTPS, pFTP, pSOCKS, pGopher, pRTSP, ProxyCount } Proxy;

+(BOOL)isProxyEnabled:  (Proxy)p;
+(long)proxyPort:       (Proxy)p;
+(NSString*)proxyHost:  (Proxy)p;
+(NSString*)proxyUser:  (Proxy)p;

/* Dumps All Proxies Info
=> HTTP enabled? Y
=> Host: example.org, User: master, Port: 7000
=> HTTPS enabled? Y
=> Host: localhost, User: (null), Port: 8888
=> FTP enabled? Y
=> Host: ftp.org, User: exampleuser, Port: 24
=> SOCKS enabled? N
=> Gopher enabled? Y
=> Host: example.org, User: (null), Port: 71
=> RTSP enabled? Y
=> Host: example.org, User: master, Port: 1001 */
+(void)dumpProxies;

@end

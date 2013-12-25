//
//  ObjectiveSC.h
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

/*(
...
{
 enabled = 1;
 host = localhost;
 name = SOCKS;
 port = 5555;
 user = "";
},
{
 enabled = 0;
 name = Gopher;
},
{
 enabled = 0;
 name = RTSP;
}
... */
+(NSArray*)proxies;

@end

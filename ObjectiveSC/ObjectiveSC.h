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
typedef enum { pHTTP, pHTTPS, pFTP, pSOCKS } Proxy;

+(BOOL)isProxyEnabled:  (Proxy)p;
+(long)proxyPort:       (Proxy)p;
+(NSString*)proxyHost:  (Proxy)p;
+(NSString*)proxyUser:  (Proxy)p;

@end

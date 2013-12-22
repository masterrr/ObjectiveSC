//
//  ScutilWrapper.h
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#import <Foundation/Foundation.h>

@interface ObjectiveSC : NSObject

// HOST
+(NSString*)computerName;
+(NSString*)computerLocalName;

// SOCKS
+(BOOL)isSocksProxyEnabled;
+(long)socksProxyPort;
+(NSString*)socksProxyHost;

@end

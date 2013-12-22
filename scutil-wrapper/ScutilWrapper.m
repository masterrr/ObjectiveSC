//
//  ScutilWrapper.m
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#import "ScutilWrapper.h"

@implementation ScutilWrapper

// Not exposed

+(NSDictionary*)proxyConfiguration {
    return (__bridge NSDictionary*)SCDynamicStoreCopyProxies(NULL);
}

// ***

+(NSString*)productName {
    return @"ScutilWrapper";
}

#pragma mark Host

+(NSString*)computerName {
     SCDynamicStoreRef dynRef = SCDynamicStoreCreate(kCFAllocatorSystemDefault,
                                                     (__bridge CFStringRef)[self productName],
                                                     NULL,
                                                     NULL);
    NSString *hostname = (__bridge NSString *)SCDynamicStoreCopyLocalHostName(dynRef);
    return hostname;
}

#pragma mark SOCKS Proxy

+(NSString*)computerLocalName {
    return [[self computerName] stringByAppendingString:@".local"];
}

static NSString *socksProxyEnabledKey = @"SOCKSEnable";
+(BOOL)isSocksProxyEnabled {
    NSNumber *socksEnableObj = [[self proxyConfiguration] objectForKey:socksProxyEnabledKey];
    return socksEnableObj != NULL && [socksEnableObj integerValue] == 1;
}

static NSString *socksProxyPortKey = @"SOCKSPort";
+(long)socksProxyPort {
    NSNumber *port = [[self proxyConfiguration] objectForKey:socksProxyPortKey];
    return [port longValue];
}

static NSString *socksProxyHostKey = @"SOCKSProxy";
+(NSString*)socksProxyHost {
    NSString *host = [[self proxyConfiguration] objectForKey:socksProxyPortKey];
    return host;
}


@end

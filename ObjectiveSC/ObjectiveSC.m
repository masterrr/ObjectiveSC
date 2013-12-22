//
//  ScutilWrapper.m
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#import "ObjectiveSC.H"

@implementation ObjectiveSC

// Not exposed

+(NSDictionary*)proxyConfiguration {
    return (__bridge NSDictionary*)SCDynamicStoreCopyProxies(NULL);
}

+(NSObject*)objectInProxyConfiguration:(NSString*)key {
    return [[self proxyConfiguration] objectForKey:key];
}

+(NSString*)productName {
    return @"ScutilWrapper";
}

// ***

#pragma mark Host

+(NSString*)computerName {
     SCDynamicStoreRef dynRef = SCDynamicStoreCreate(kCFAllocatorSystemDefault,
                                                     (__bridge CFStringRef)[self productName],
                                                     NULL,
                                                     NULL);
    NSString *hostname = (__bridge NSString *)SCDynamicStoreCopyLocalHostName(dynRef);
    return hostname;
}

+(NSString*)computerLocalName {
    return [[self computerName] stringByAppendingString:@".local"];
}

#pragma mark HTTPS Proxy

static NSString *httpsProxyEnabledKey   = @"HTTPSEnable";
static NSString *httpsProxyPortKey      = @"HTTPSPort";
static NSString *httpsProxyHostKey      = @"HTTPSProxy";
static NSString *httpsProxyUserKey      = @"HTTPSUser";

#pragma mark SOCKS Proxy

static NSString *socksProxyEnabledKey   = @"SOCKSEnable";
static NSString *socksProxyPortKey      = @"SOCKSPort";
static NSString *socksProxyHostKey      = @"SOCKSProxy";

+(BOOL)isSocksProxyEnabled {
    NSNumber *socksEnableObj = (NSNumber*)[self objectInProxyConfiguration:socksProxyEnabledKey];
    return socksEnableObj != NULL && [socksEnableObj integerValue] == 1;
}

+(long)socksProxyPort {
    return [(NSNumber*)[self objectInProxyConfiguration:socksProxyPortKey] longValue];
}

+(NSString*)socksProxyHost {
    return (NSString*)[self objectInProxyConfiguration:socksProxyPortKey];
}


@end

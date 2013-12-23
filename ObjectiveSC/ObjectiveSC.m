//
//  ScutilWrapper.m
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#pragma mark Proxies

@protocol PProxyProvider
@required
-(NSString*)enabledKey;
-(NSString*)portKey;
-(NSString*)hostKey;
-(NSString*)userKey;
@end

@interface HTTPProxy : NSObject <PProxyProvider> @end
@implementation HTTPProxy
-(NSString*)enabledKey  { return @"HTTPEnable"; }
-(NSString*)portKey     { return @"HTTPPort"; }
-(NSString*)hostKey     { return @"HTTPProxy"; }
-(NSString*)userKey     { return @"HTTPUser"; }
@end

@interface HTTPSProxy : NSObject <PProxyProvider> @end
@implementation HTTPSProxy
-(NSString*)enabledKey  { return @"HTTPSEnable"; }
-(NSString*)portKey     { return @"HTTPSPort"; }
-(NSString*)hostKey     { return @"HTTPSProxy"; }
-(NSString*)userKey     { return @"HTTPSUser"; }
@end

@interface SOCKSProxy : NSObject <PProxyProvider> @end
@implementation SOCKSProxy
-(NSString*)enabledKey  { return @"SOCKSEnable"; }
-(NSString*)portKey     { return @"SOCKSPort"; }
-(NSString*)hostKey     { return @"SOCKSProxy"; }
-(NSString*)userKey     { return @"SOCKSUser"; }
@end

@interface FTPProxy : NSObject <PProxyProvider> @end
@implementation FTPProxy
-(NSString*)enabledKey  { return @"FTPEnable"; }
-(NSString*)portKey     { return @"FTPPort"; }
-(NSString*)hostKey     { return @"FTPProxy"; }
-(NSString*)userKey     { return @"FTPUser"; }
@end

#pragma mark Main

#import "ObjectiveSC.H"

@implementation ObjectiveSC

+(NSString*)productName {
    return @"ObjectiveSC";
}

#pragma mark HOST

+(NSString*)computerName {
    SCDynamicStoreRef dynRef = SCDynamicStoreCreate(kCFAllocatorSystemDefault, (__bridge CFStringRef)[self productName], NULL, NULL);
    NSString *hostname = (__bridge NSString *)SCDynamicStoreCopyLocalHostName(dynRef);
    return hostname;
}

+(NSString*)computerLocalName {
    return [[self computerName] stringByAppendingString:@".local"];
}

#pragma mark Proxies

+(NSDictionary*)proxyConfiguration {
    return (__bridge NSDictionary*)SCDynamicStoreCopyProxies(NULL);
}

+(NSObject*)objectInProxyConfiguration:(NSString*)key {
    return [[self proxyConfiguration] objectForKey:key];
}

+(BOOL)checkIfProxyEnabled:(NSNumber*)enabledObj {
    return enabledObj != NULL && [enabledObj longValue] == 1;
}

+(NSObject<PProxyProvider>*)getProxyProvider:(Proxy)p {
    switch (p) {
        case pFTP:      return [[FTPProxy   alloc] init];
        case pHTTP:     return [[HTTPProxy  alloc] init];
        case pHTTPS:    return [[HTTPSProxy alloc] init];
        case pSOCKS:    return [[SOCKSProxy alloc] init];
    }
}

+(BOOL)isProxyEnabled:(Proxy)p {
    return [self checkIfProxyEnabled:(NSNumber*)[self objectInProxyConfiguration:[[self getProxyProvider:p] enabledKey]]];
}
+(long)proxyPort:(Proxy)p {
    return [(NSNumber*)[self objectInProxyConfiguration:[[self getProxyProvider:p] portKey]] longValue];
}
+(NSString*)proxyHost:(Proxy)p {
    return (NSString*)[self objectInProxyConfiguration:[[self getProxyProvider:p] hostKey]];
}
+(NSString*)proxyUser:(Proxy)p {
    return (NSString*)[self objectInProxyConfiguration:[[self getProxyProvider:p] userKey]];
}

@end

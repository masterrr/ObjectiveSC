//
//  main.m
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#import <Foundation/Foundation.h>
#import "ObjectiveSC.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSLog(@"Computer name w/ local: %@\n\n", [ObjectiveSC computerLocalName]);
        
        BOOL socksProxyEnabled = [ObjectiveSC isProxyEnabled:pSOCKS];
        NSLog(@"Is Socks Proxy Enabled? %c", socksProxyEnabled ? 'Y' : 'N');
        if (socksProxyEnabled) {
            NSLog(@"Socks host: %@, port: %ld, user: %@\n\n", [ObjectiveSC proxyHost:pSOCKS], [ObjectiveSC proxyPort:pSOCKS], [ObjectiveSC proxyUser:pSOCKS]);
        }
        
        BOOL httpProxyEnabled = [ObjectiveSC isProxyEnabled:pHTTP];
        NSLog(@"Is HTTP Proxy Enabled? %c", httpProxyEnabled ? 'Y' : 'N');
        if (httpProxyEnabled) {
    
            NSLog(@"HTTP host: %@, port: %ld, user: %@\n\n", [ObjectiveSC proxyHost:pHTTP], [ObjectiveSC proxyPort:pHTTP], [ObjectiveSC proxyUser:pHTTP]);
        }
        
        BOOL httpsProxyEnabled = [ObjectiveSC isProxyEnabled:pHTTPS];
        NSLog(@"Is HTTPS Enabled? %c", httpsProxyEnabled ? 'Y' : 'N');
        if (httpsProxyEnabled) {
            NSLog(@"HTTPS host: %@, port: %ld, user: %@\n\n", [ObjectiveSC proxyHost:pHTTPS], [ObjectiveSC proxyPort:pHTTPS], [ObjectiveSC proxyUser:pHTTPS]);
        }
    }
    return 0;
}




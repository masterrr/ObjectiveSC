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
        NSLog(@"Computer name w/ local: %@", [ObjectiveSC computerLocalName]);
        BOOL socksProxyEnabled = [ObjectiveSC isSocksProxyEnabled];
        NSLog(@"Socks Proxy Enabled? %c", socksProxyEnabled ? 'Y' : 'N');
        if (socksProxyEnabled) {
            NSLog(@"Socks host: %@, port: %ld", [ObjectiveSC socksProxyHost], [ObjectiveSC socksProxyPort]);
        }
    }
    return 0;
}




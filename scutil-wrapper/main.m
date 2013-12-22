//
//  main.m
//  scutil-wrapper
//
//  Created by Dmitry Kurilo on 12/22/13.
//

#import <Foundation/Foundation.h>
#import "ScutilWrapper.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSLog(@"Computer name w/ local: %@", [ScutilWrapper computerLocalName]);
        BOOL socksProxyEnabled = [ScutilWrapper isSocksProxyEnabled];
        NSLog(@"Socks Proxy Enabled? %c", socksProxyEnabled ? 'Y' : 'N');
        if (socksProxyEnabled) {
            NSLog(@"Socks host: %@, port: %ld", [ScutilWrapper socksProxyHost], [ScutilWrapper socksProxyPort]);
        }
    }
    return 0;
}




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
        
        [ObjectiveSC dumpProxies];
        
    }
    return 0;
}




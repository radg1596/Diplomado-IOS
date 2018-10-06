//
//  CDDigestsHead.h
//  Workdb
//
//  Created by Ricardo_Abraham_Desiderio_Diplomado on 06/10/18.
//  Copyright © 2018 Ricardo_Abraham_Desiderio_Diplomado. All rights reserved.
//

#ifndef CDDigests_h
#define CDDigests_h
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface CDDigests: NSObject
+ (NSString *) sha1String: (NSString *) input;
@end

#endif /* CDDigests_h */

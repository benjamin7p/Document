//
//  EntryController.h
//  objc-demo
//
//  Created by Benjamin Poulsen PRO on 5/10/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry+CoreDataClass.h"



NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

//@property(strong, nonatomic, readonly) NSArray
@property (strong, nonatomic, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;
- (Entry *)createEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

@end

NS_ASSUME_NONNULL_END

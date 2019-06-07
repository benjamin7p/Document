//
//  Stack.h
//  objc-demo
//
//  Created by Benjamin Poulsen PRO on 5/10/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

#ifndef Stack_h
#define Stack_h


#endif /* Stack_h */

#import <Foundation/Foundation.h>

@import CoreData;

@interface Stack : NSObject

+ (Stack *)sharedInstance;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

@end

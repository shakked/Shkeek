//
//  ZSSChoice.h
//  Shkeek
//
//  Created by Zachary Shakked on 4/9/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ZSSChoice : NSManagedObject

@property (nonatomic, retain) NSString * choice;
@property (nonatomic, retain) NSManagedObject *question;

@end

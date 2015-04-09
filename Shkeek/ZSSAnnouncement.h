//
//  ZSSAnnouncement.h
//  Shkeek
//
//  Created by Zachary Shakked on 4/9/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ZSSGroup;

@interface ZSSAnnouncement : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSNumber * isBanned;
@property (nonatomic, retain) NSNumber * reportedCount;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * views;
@property (nonatomic, retain) NSManagedObject *author;
@property (nonatomic, retain) ZSSGroup *group;

@end

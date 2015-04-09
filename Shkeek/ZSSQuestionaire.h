//
//  ZSSQuestionaire.h
//  Shkeek
//
//  Created by Zachary Shakked on 4/9/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ZSSGroup, ZSSUser;

@interface ZSSQuestionaire : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) ZSSUser *author;
@property (nonatomic, retain) ZSSGroup *group;
@property (nonatomic, retain) NSSet *questions;
@end

@interface ZSSQuestionaire (CoreDataGeneratedAccessors)

- (void)addQuestionsObject:(NSManagedObject *)value;
- (void)removeQuestionsObject:(NSManagedObject *)value;
- (void)addQuestions:(NSSet *)values;
- (void)removeQuestions:(NSSet *)values;

@end

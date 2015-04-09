//
//  ZSSQuestion.h
//  Shkeek
//
//  Created by Zachary Shakked on 4/9/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ZSSChoice, ZSSQuestionaire;

@interface ZSSQuestion : NSManagedObject

@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSSet *choices;
@property (nonatomic, retain) ZSSQuestionaire *questionaire;
@end

@interface ZSSQuestion (CoreDataGeneratedAccessors)

- (void)addChoicesObject:(ZSSChoice *)value;
- (void)removeChoicesObject:(ZSSChoice *)value;
- (void)addChoices:(NSSet *)values;
- (void)removeChoices:(NSSet *)values;

@end

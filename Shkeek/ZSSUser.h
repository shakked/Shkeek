//
//  ZSSUser.h
//  Shkeek
//
//  Created by Zachary Shakked on 4/9/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ZSSAnnouncement, ZSSGroup;

@interface ZSSUser : NSManagedObject

@property (nonatomic, retain) NSString * authType;
@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSNumber * didAgreeToEULA;
@property (nonatomic, retain) NSNumber * didFillOutUserInfoForm;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * isBanned;
@property (nonatomic, retain) NSNumber * isEmailConfirmed;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * objectId;
@property (nonatomic, retain) id profilePicture;
@property (nonatomic, retain) NSNumber * reportedCount;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) ZSSAnnouncement *announcementsCreated;
@property (nonatomic, retain) NSSet *groupsAdministrating;
@property (nonatomic, retain) ZSSGroup *groupsCreated;
@property (nonatomic, retain) ZSSGroup *groupsFollowing;
@property (nonatomic, retain) NSManagedObject *questionairesCreated;
@end

@interface ZSSUser (CoreDataGeneratedAccessors)

- (void)addGroupsAdministratingObject:(ZSSGroup *)value;
- (void)removeGroupsAdministratingObject:(ZSSGroup *)value;
- (void)addGroupsAdministrating:(NSSet *)values;
- (void)removeGroupsAdministrating:(NSSet *)values;

@end

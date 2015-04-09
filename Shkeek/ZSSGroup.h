//
//  ZSSGroup.h
//  Shkeek
//
//  Created by Zachary Shakked on 4/9/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ZSSGroup : NSManagedObject

@property (nonatomic, retain) NSNumber * announcementsLeft;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSDate * dateOfLastAnnouncementReset;
@property (nonatomic, retain) NSNumber * followerCount;
@property (nonatomic, retain) NSString * groupDescription;
@property (nonatomic, retain) NSNumber * isBanned;
@property (nonatomic, retain) NSNumber * isHidden;
@property (nonatomic, retain) NSNumber * isPremium;
@property (nonatomic, retain) NSNumber * isPrivate;
@property (nonatomic, retain) NSNumber * isPublic;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * objectId;
@property (nonatomic, retain) id profilePicture;
@property (nonatomic, retain) NSNumber * reportedCount;
@property (nonatomic, retain) NSDate * updatedAt;
@property (nonatomic, retain) NSSet *admins;
@property (nonatomic, retain) NSSet *announcements;
@property (nonatomic, retain) NSManagedObject *creator;
@property (nonatomic, retain) NSManagedObject *followers;
@property (nonatomic, retain) NSSet *questionaires;
@end

@interface ZSSGroup (CoreDataGeneratedAccessors)

- (void)addAdminsObject:(NSManagedObject *)value;
- (void)removeAdminsObject:(NSManagedObject *)value;
- (void)addAdmins:(NSSet *)values;
- (void)removeAdmins:(NSSet *)values;

- (void)addAnnouncementsObject:(NSManagedObject *)value;
- (void)removeAnnouncementsObject:(NSManagedObject *)value;
- (void)addAnnouncements:(NSSet *)values;
- (void)removeAnnouncements:(NSSet *)values;

- (void)addQuestionairesObject:(NSManagedObject *)value;
- (void)removeQuestionairesObject:(NSManagedObject *)value;
- (void)addQuestionaires:(NSSet *)values;
- (void)removeQuestionaires:(NSSet *)values;

@end

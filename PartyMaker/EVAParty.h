//
//  EVAParty.h
//  PartyMaker
//
//  Created by 2 on 09.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVAParty : NSObject <NSCoding>
@property (nonatomic) NSString* date;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* timeStart;
@property (nonatomic) NSString* timeEnd;
@property (nonatomic) NSString* textDescription;
@property (nonatomic) NSString* image;

-(instancetype) initWithName: (NSString*) name date: (NSString*) date timeStart: (NSString*) timeStart timeEnd: (NSString*) timeEnd description: (NSString*) textDescription image: (NSString*) image;

- (void) touchSave;

@end

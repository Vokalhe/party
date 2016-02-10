//
//  EVAParty.m
//  PartyMaker
//
//  Created by 2 on 09.02.16.
//  Copyright © 2016 1. All rights reserved.
//

#import "EVAParty.h"

@implementation EVAParty
- (void) touchSave{
    NSFileManager *filemnager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *partyFilePath = [documentsPath stringByAppendingPathComponent:@"party.plist"];
    NSString *partiesFilePAthInBundle = [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"parties.plist"];
    NSError *error = nil;
    if (![filemnager fileExistsAtPath:partyFilePath]) {
        [filemnager copyItemAtPath:partiesFilePAthInBundle toPath:partyFilePath error:&error];
    }
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"%@", error);
    
    NSMutableArray *dataFromPlist = [NSMutableArray arrayWithContentsOfFile:partyFilePath];
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [dataFromPlist addObject:data];
    NSArray *dataToWrite = [NSArray arrayWithArray:dataFromPlist];
    [dataToWrite writeToFile:partyFilePath atomically:YES];
}

-(instancetype) initWithName: (NSString*) name date: (NSString*) date timeStart: (NSString*) timeStart timeEnd: (NSString*) timeEnd description: (NSString*) description image: (NSString*) image;{
    self = [super init];
    if (self) {
        
        self.name = name;
        self.date = date;
        self.timeStart = timeStart;
        self.timeEnd = timeEnd;
        self.textDescription = description;
        self.image = image;
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.timeStart = [aDecoder decodeObjectForKey:@"timeStart"];
        self.timeEnd = [aDecoder decodeObjectForKey:@"timeEnd"];
        self.textDescription = [aDecoder decodeObjectForKey:@"description"];
        self.image = [aDecoder decodeObjectForKey:@"image"];
        
    }
    
    return self;
}
- (void) encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.timeStart forKey:@"timeStart"];
    [aCoder encodeObject:self.timeEnd forKey:@"timeEnd"];
    [aCoder encodeObject:self.textDescription forKey:@"description"];
    [aCoder encodeObject:self.image forKey:@"image"];
    
}


@end

//
//  NSFileManager+Firmiana.m
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "NSFileManager+Firmiana.h"
#import "SHUserHelper.h"

@implementation NSFileManager (Firmiana)

+ (NSString *)pathUserSettingImage:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Setting/Images/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

+ (NSString *)pathUserChatImage:(NSString*)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Chat/Images/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

+ (NSString *)pathUserChatBackgroundImage:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Chat/Background/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

+ (NSString *)pathUserAvatar:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Chat/Avatar/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

+ (NSString *)pathContactsAvatar:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/Contacts/Avatar/", [NSFileManager documentsPath]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

+ (NSString *)pathUserChatVoice:(NSString *)voiceName
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Chat/Voices/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:voiceName];
}


+ (NSString *)pathExpressionForGroupID:(NSString *)groupID
{
    NSString *path = [NSString stringWithFormat:@"%@/Expression/%@/", [NSFileManager documentsPath], groupID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return path;
}

+ (NSString *)pathContactsData
{
    NSString *path = [NSString stringWithFormat:@"%@/Contacts/", [NSFileManager documentsPath]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:@"Contacts.dat"];
}

+ (NSString *)pathScreenshotImage:(NSString *)imageName
{
    NSString *path = [NSString stringWithFormat:@"%@/Screenshot/", [NSFileManager documentsPath]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:imageName];
}

+ (NSString *)pathDBCommon
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Setting/DB/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:@"common.sqlite3"];
}

+ (NSString *)pathDBMessage
{
    NSString *path = [NSString stringWithFormat:@"%@/User/%@/Chat/DB/", [NSFileManager documentsPath], [SHUserHelper sharedHelper].userID];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DDLogError(@"File Create Failed: %@", path);
        }
    }
    return [path stringByAppendingString:@"message.sqlite3"];
}

+ (NSString *)cacheForFile:(NSString *)filename
{
    return [[NSFileManager cachesPath] stringByAppendingString:filename];
}

@end

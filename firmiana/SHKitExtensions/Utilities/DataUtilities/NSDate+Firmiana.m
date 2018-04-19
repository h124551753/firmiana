//
//  NSDate+Firmiana.h
//  firmiana
//
//  Created by hui he on 2018/4/18.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "NSDate+Firmiana.h"

@implementation NSDate (Firmiana)

- (NSString *)chatTimeInfo
{
    if ([self isToday]) {       // 今天
        return self.formatHM;
    }
    else if ([self isYesterday]) {      // 昨天
        return [NSString stringWithFormat:@"昨天 %@", self.formatHM];
    }
    else if ([self isThisWeek]){        // 本周
        return [NSString stringWithFormat:@"%@ %@", self.formatWeekday, self.formatHM];
    }
    else {
        return [NSString stringWithFormat:@"%@ %@", self.formatYMD, self.formatHM];
    }
}

- (NSString *)conversaionTimeInfo
{
    if ([self isToday]) {       // 今天
        return self.formatHM;
    }
    else if ([self isYesterday]) {      // 昨天
        return @"昨天";
    }
    else if ([self isThisWeek]){        // 本周
        return self.formatWeekday;
    }
    else {
        return [self formatYMDWithSeparate:@"/"];
    }
}

- (NSString *)chatFileTimeInfo
{
    if ([self isThisWeek]) {
        return @"本周";
    }
    else if ([self isThisMonth]) {
        return @"这个月";
    }
    else {
        return [NSString stringWithFormat:@"%ld年%ld月", (long)self.year, (long)self.month];
    }
}

@end

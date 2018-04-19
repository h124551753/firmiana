//
//  SHAddMenuView.m
//  firmiana
//
//  Created by hui he on 2018/4/19.
//  Copyright © 2018年 hui he. All rights reserved.
//

#import "SHAddMenuView.h"
#import "SHAddMenuCell.h"
#import "SHAppConfig.h"

#define     WIDTH_TABLEVIEW             140.0f
#define     HEIGHT_TABLEVIEW_CELL       45.0f

@interface SHAddMenuView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *data;

@end

@implementation SHAddMenuView

- (id)init
{
    if (self = [super init]) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.tableView];
        
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:panGR];
        
        [self.tableView registerClass:[SHAddMenuCell class] forCellReuseIdentifier:@"SHAddMenuCell"];
        self.data = [SHAppConfig sharedConfig].addMenuItems;
    }
    return self;
}

- (void)showInView:(UIView *)view
{
    [view addSubview:self];
    [self setNeedsDisplay];
    [self setFrame:view.bounds];
    
    CGRect rect = CGRectMake(view.width - WIDTH_TABLEVIEW - 5, NAVBAR_HEIGHT + STATUSBAR_HEIGHT + 10, WIDTH_TABLEVIEW, self.data.count * HEIGHT_TABLEVIEW_CELL);
    [self.tableView setFrame:rect];
}

- (BOOL)isShow
{
    return self.superview != nil;
}

- (void)dismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        [self setAlpha:0.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            [self setAlpha:1.0];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

#pragma mark - # Delegate
//MARK: UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHAddMenuItem *item = [self.data objectAtIndex:indexPath.row];
    SHAddMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHAddMenuCell"];
    [cell setItem:item];
    return cell;
}

//MARK: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHAddMenuItem *item = [self.data objectAtIndex:indexPath.row];
    if (self.itemSelectedAction) {
        self.itemSelectedAction(self, item);
    }
    if (_delegate && [_delegate respondsToSelector:@selector(addMenuView:didSelectedItem:)]) {
        [_delegate addMenuView:self didSelectedItem:item];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self dismiss];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_TABLEVIEW_CELL;
}

#pragma mark - # Private Methods
- (void)drawRect:(CGRect)rect
{
    CGFloat startX = self.width - 27;
    CGFloat startY = STATUSBAR_HEIGHT + NAVBAR_HEIGHT + 3;
    CGFloat endY = STATUSBAR_HEIGHT + NAVBAR_HEIGHT + 10;
    CGFloat width = 6;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, startX, startY);
    CGContextAddLineToPoint(context, startX + width, endY);
    CGContextAddLineToPoint(context, startX - width, endY);
    CGContextClosePath(context);
    [[UIColor colorBlackForAddMenu] setFill];
    [[UIColor colorBlackForAddMenu] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - # Getters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [_tableView setScrollEnabled:NO];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setBackgroundColor:[UIColor colorBlackForAddMenu]];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView.layer setMasksToBounds:YES];
        [_tableView.layer setCornerRadius:3.0f];
    }
    return _tableView;
}

@end

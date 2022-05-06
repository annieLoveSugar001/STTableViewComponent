//ProjectName(工程名): STTableView
/*************************************************
 File name（文件名）:  STTableViewDelegate.h
 Description（描述）:  UITableViewDelegate封装
 
 Others:-
 Function List:-
 
 History（ 修改日志）:
 1.
 Date（修改日期）:
 Author（修改者）:
 Modification（修改内容）:
 *************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^STTableViewDidSelectBlock)(UITableView *tableView,
                                         NSIndexPath *indexPath);

@interface STTableViewDelegate : NSObject<UITableViewDelegate>

- (id)initWithSectionHeaderView:(UIView *_Nullable)headerView
              sectionFooterView:(UIView *_Nullable)footerView
                      rowHeight:(CGFloat)rowHeight
        sectionHeaderViewHeight:(CGFloat)headerHeight
        sectionFooterViewHeight:(CGFloat)footerHeight
                 didSelectBlock:(STTableViewDidSelectBlock)didSelectBlock;
 
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

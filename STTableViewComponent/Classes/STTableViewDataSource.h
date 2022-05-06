//ProjectName(工程名): STTableView
/*************************************************
 File name（文件名）:  STTableViewDataSource.h
 Description（描述）:  UITableViewDataSource 的封装
 
 Others:-
 Function List:-
 
 History（ 修改日志）:
 1
 Date（修改日期）:
 Author（修改者）:
 Modification（修改内容）:
 *************************************************/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 获取UITableViewCell
typedef void (^STTableViewCellConfigureBlock)(id cell, id items, NSIndexPath *indexPath);

@interface STTableViewDataSource : NSObject<UITableViewDataSource>

/// 初始化
/// @param anItems 数据源
/// @param aCellIdentifier 重用标识符
/// @param aConfigureCellBlock cell回调
- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(STTableViewCellConfigureBlock)aConfigureCellBlock;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
 

/// 获取cell
/// @param indexPath indexPath description
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END

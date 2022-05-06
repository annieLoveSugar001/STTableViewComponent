/***********************************************
 * ProjectName（工程名称）：   STTableView、STCollectionView
 * FileName（文件名称）：      STCellConfigure.h
 * Description（文件描述）：   配置cell，model数据和view分离，cell只负责绘制视图
 * Function List（功能列表）：
 * Others（其它）：
 * -------------------------------------------
 * History（修改日志）：
 * 1.
 * Content modification（修改内容）：
 * Date（修改日期）：
 * Author（作者）：
 * 2.
 * ...
 ***********************************************/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol STCellConfigure <NSObject>


/// 配置cell数据，使用方法，cell遵守此协议，并实现此协议
/// @param model model
-(void)configureCellWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END


#import "STTableViewDelegate.h"

@interface STTableViewDelegate()

@property (nonatomic, strong)UIView *headerView;

@property (nonatomic, strong)UIView *footerView;

@property (nonatomic, assign)CGFloat rowHeight;

@property (nonatomic, assign)CGFloat headerHeight;

@property (nonatomic, assign)CGFloat footerHeight;

@property (nonatomic, copy)STTableViewDidSelectBlock didSelectBlock;


@end
@implementation STTableViewDelegate

- (id)initWithSectionHeaderView:(UIView *_Nullable)headerView
              sectionFooterView:(UIView *_Nullable)footerView
                      rowHeight:(CGFloat)rowHeight
        sectionHeaderViewHeight:(CGFloat)headerHeight
        sectionFooterViewHeight:(CGFloat)footerHeight
                 didSelectBlock:(STTableViewDidSelectBlock)didSelectBlock
{
    self = [super init];
    if (self) {
        self.headerView     = headerView;
        self.footerView     = footerView;
        self.rowHeight      = rowHeight;
        self.headerHeight   = headerHeight;
        self.footerHeight   = footerHeight;
        self.didSelectBlock = didSelectBlock;
    }
    return self;
}

#pragma mark - <delegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.rowHeight ? : 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.headerHeight ? : 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.footerHeight ? : 0.01f;
}

- (nullable UIView *)tableView:(UITableView *)tableView
        viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    if (self.headerView) {
        headerView = [self heavyCopyView:self.headerView];
    }
    
    return headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView
        viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] init];
    if (self.footerView) {
        footerView = [self heavyCopyView:self.footerView];
    }
    
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.didSelectBlock(tableView, indexPath);
}


#pragma mark - private
- (UIView *)heavyCopyView:(UIView *)aView
{
    NSData *tempArchiveData = [NSKeyedArchiver archivedDataWithRootObject:aView];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchiveData];
}

@end

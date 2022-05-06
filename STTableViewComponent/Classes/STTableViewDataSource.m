

#import "STTableViewDataSource.h"

@interface STTableViewDataSource()

@property(nonatomic, strong) NSArray* items;
@property(nonatomic, copy) NSString* cellIdentifier;
@property(nonatomic, copy) STTableViewCellConfigureBlock configureCellBlock;

@end
@implementation STTableViewDataSource

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(STTableViewCellConfigureBlock)aConfigureCellBlock {
    self = [super init];
    if (self) {
        self.items              = anItems;
        self.cellIdentifier     = aCellIdentifier;
        self.configureCellBlock = aConfigureCellBlock;
    }
    return  self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isMultidimensionalArray]) {
        NSArray *sectionArr = self.items[indexPath.section];
        return sectionArr.count > indexPath.row ? sectionArr[(NSUInteger)indexPath.row] : nil;
    } else {
        return self.items.count > indexPath.section ? self.items[(NSUInteger) indexPath.section] : nil;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Default is 1
    return self.items.count ? : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self isMultidimensionalArray]) {
        NSArray *sectionArr = self.items[section];
        return sectionArr.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:self.cellIdentifier];
    }
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.configureCellBlock(cell, item, indexPath);
    
    return cell;
}

#pragma mark - private
/// 判断数组是否为多维数组（二维数组以上，此处指二维数组）
- (BOOL)isMultidimensionalArray
{
    if (self.items.count == 0) return NO;
    
    if ([self.items.firstObject isKindOfClass:[NSArray class]]) {
        return YES;
    } else {
        return NO;
    }
}

@end

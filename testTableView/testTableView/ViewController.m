//
//  ViewController.m
//  testTableView
//
//  Created by Yuchen Wang on 2021/2/18.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listArray = @[@"Faceless",@"Lina",@"Pudge",@"Sniper"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"TODETAIL"]) {
        DetailViewController *detailVC = [segue destinationViewController];
        NSString *name = self.listArray[self.tableView.indexPathForSelectedRow.row];
        
        
        detailVC.imageName = [[name lowercaseString] stringByAppendingString:@"_full.png"];
        
        
    }
}

#pragma mark- UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

@end

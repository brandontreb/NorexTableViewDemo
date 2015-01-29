//
//  SearchTableViewController.m
//  TableViewDemo
//
//  Created by Brandon Trebitowski on 1/29/15.
//  Copyright (c) 2015 Pixegon. All rights reserved.
//

#import "SearchTableViewController.h"
#import "CharacteristicSelectionTableViewController.h"

@interface SearchTableViewController ()
@property(nonatomic, strong) NSString *characteristic1;
@property(nonatomic, strong) NSString *characteristic2;
@property(nonatomic, strong) NSString *characteristic3;
@property(nonatomic, strong) NSMutableDictionary *characteristics;
@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Preset startup model
    self.title = @"Characteristics";
    // Dynamic properties
    self.characteristics = [@{} mutableCopy];
    // Background image
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Characteristic 1";
            cell.detailTextLabel.text = self.characteristic1;
            break;
        case 1:
            cell.textLabel.text = @"Characteristic 2";
            cell.detailTextLabel.text = self.characteristic2;
            break;
        case 2:
            cell.textLabel.text = @"Characteristic 3";
            cell.detailTextLabel.text = self.characteristic3;
            break;
        default:
            break;
    }
    
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Define its characteristics.";
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"selectCharacteristics"]) {
        CharacteristicSelectionTableViewController *controller = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        SearchCallBackBlock callbackBlock = ^(NSString *result) {            
            switch (indexPath.row) {
                case 0:
                    self.characteristic1 = result;
                    break;
                case 1:
                    self.characteristic2 = result;
                    break;
                case 2:
                    self.characteristic3 = result;
                    break;
                default:
                    break;
            }
        };
        controller.callbackBlock = callbackBlock;        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

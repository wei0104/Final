//
//  ViewController.m
//  Final
//
//  Created by Wei Luo on 12/15/16.
//  Copyright © 2016 Wei Luo. All rights reserved.
//

#import "ViewController.h"
#import "NewsViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *urlString = @"https://newsapi.org/v1/articles?source=google-news&sortBy=top&apiKey=823b855726d141a1bde5113344ed0d0f";
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:requestURL];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
    
        NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]);
                                self.dataArray = [[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL ] objectForKey:@"articles"];
                                [self.tableView reloadData];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    cell.textLabel.text = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.detailTextLabel.textColor = [UIColor blueColor];
    
       return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // NSInteger section = [indexPath seciont];
    // NSInteger row = [indexPath row];
    
    NSLog(@"title %@",  [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"url"]);
    
    NewsViewController *dv =[self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
    dv.newsTitle = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    dv.newsUrl = [[self.dataArray objectAtIndex:indexPath.row] objectForKey:@"url"];
    
    [self.navigationController pushViewController:dv animated:YES];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

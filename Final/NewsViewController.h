//
//  NewsViewController.h
//  Final
//
//  Created by Wei Luo on 12/15/16.
//  Copyright © 2016 Wei Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController

@property (nonatomic, retain) NSString *newsTitle;
@property (nonatomic, retain) NSString *newsUrl;
@property (nonatomic, retain) IBOutlet UIWebView *webView;



@end

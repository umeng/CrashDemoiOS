//
//  ViewController.m
//  UAPMOCDemo
//
//  Created by zhangjunhua on 2021/6/28.
//

#import "ViewController.h"

#import <UMAPM/UMLaunch.h>

@interface ViewController ()

@end

@implementation ViewController

-(void)handleBTN1{
    char* src = "src";
    char* dst = NULL;
    strcpy(dst, src);
}

-(void)handleBTN2{
    NSArray* tempArray = @[@"1",@"2",@"3"];
    [tempArray objectAtIndex:10];
}

-(void)handleBTN3{
#define NetworkURL         @"https://www.baidu.com/"
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:NetworkURL]];
    request.HTTPMethod = @"GET";
    [request addValue:@"application/html" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionDataTask* dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"str:%@",str);
        }
        else if (error){
            NSLog(@"error:%@",error);
        }
    }];
    [dataTask resume];
}

-(void)handleBTN5{
    NSLog(@"handleBTN5 begin");
    sleep(100);
    NSLog(@"handleBTN5 end");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UMLaunch beginLaunch:@"createBtn"];
    UIButton* btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(80, 200, 150, 50);
    btn1.backgroundColor = [UIColor yellowColor];
    [btn1 setTitle:@"c++崩溃" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(handleBTN1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(80, 300, 150, 50);
    btn2.backgroundColor = [UIColor yellowColor];
    [btn2 setTitle:@"oc崩溃" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(handleBTN2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton* btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame = CGRectMake(80, 370, 150, 50);
    btn3.backgroundColor = [UIColor yellowColor];
    [btn3 setTitle:@"网络触发" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(handleBTN3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    
    UIButton* btn5 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn5.frame = CGRectMake(80, 500, 150, 50);
    btn5.backgroundColor = [UIColor yellowColor];
    [btn5 setTitle:@"卡顿触发" forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(handleBTN5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
    [UMLaunch endLaunch:@"createBtn"];
    [UMLaunch setPredefineLaunchType:UMPredefineLaunchType_ViewDidLoadEnd];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UMLaunch setPredefineLaunchType:UMPredefineLaunchType_ViewDidAppearEnd];
}


@end

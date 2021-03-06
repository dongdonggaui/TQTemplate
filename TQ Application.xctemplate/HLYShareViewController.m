//
//  HLYShareViewController.m
//  Hiwedo
//
//  Created by huangluyang on 14-5-27.
//  Copyright (c) 2014年 whu. All rights reserved.
//

#import "HLYShareViewController.h"
#import "UIView+ModifyFrame.h"

@interface HLYShareViewController ()

@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *text;

@property (nonatomic) UITextView *textView;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIImageView *imageBackgroundView;

@end

@implementation HLYShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text image:(UIImage *)image
{
    if (self = [self init]) {
        _image = image;
        _text = text;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"分享";
    
    _textView = [[UITextView alloc] initWithFrame:CGRectZero];
    _textView.frame = CGRectMake(0, 0, ceilf(self.view.width * 2 / 3), 200);
    _textView.text = self.text;
    _textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_textView];
    
    _imageBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _imageBackgroundView.frame = CGRectMake(_textView.x + _textView.width, 0, self.view.width - _textView.width, _textView.height);
    _imageBackgroundView.contentMode = UIViewContentModeScaleAspectFill;
    _imageBackgroundView.backgroundColor = self.textView.backgroundColor;
    _imageBackgroundView.clipsToBounds = YES;
    [self.view addSubview:_imageBackgroundView];
    
    _imageView = [[UIImageView alloc] initWithFrame:_imageBackgroundView.frame];
    _imageView.frame = CGRectMake(10, 10, _imageBackgroundView.width - 20, 80);
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    _imageView.image = self.image;
    [_imageBackgroundView addSubview:_imageView];
    
    self.navigationItem.rightBarButtonItem = self.hlyRightBarButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)needCustomLeftItem
{
    return YES;
}

- (void)hwdLeftItemDidTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)hwdRightItemDidTapped:(id)sender
{
    DLog(@"发布");
}

@end

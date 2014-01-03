//
//  ViewController.m
//  TextFieldTest2
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 레이블
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 105, 0, 0)];
    label1.text = @"Return";
    label1.textColor = [UIColor blackColor];
    label1.backgroundColor = [UIColor clearColor];
    [label1 sizeToFit];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 155, 0, 0)];
    label2.text = @"편집불가";
    label2.textColor = [UIColor blackColor];
    label2.backgroundColor = [UIColor clearColor];
    [label2 sizeToFit];
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, 0, 0)];
    label3.text = @"Z입력금지";
    label3.textColor = [UIColor blackColor];
    label3.backgroundColor = [UIColor clearColor];
    [label3 sizeToFit];
    [self.view addSubview:label3];
    
    
    // 텍스트필드 객체 생성
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(130, 100, 171, 31)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.delegate = self;
    textField1.tag = 1;
    [self.view addSubview:textField1];
    
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(130, 150, 171, 31)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.delegate = self;
    textField2.tag = 2;
    [self.view addSubview:textField2];
    
    UITextField *textField3 = [[UITextField alloc] initWithFrame:CGRectMake(130, 200, 171, 31)];
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.delegate = self;
    textField3.tag = 3;
    [self.view addSubview:textField3];
    
	// Do any additional setup after loading the view, typically from a nib.
}


// 편집상태 승인여부
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (2 == textField.tag) {
        return NO;
    }
    return YES;
}

// 리턴키로 키보드감추기

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"INPUT : %@", textField.text);
    [textField resignFirstResponder];
    return YES;
}


// Z키 입력불가

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 대소문자 구별없이 비교
    if (3 == textField.tag && NSOrderedSame == [string compare:@"z" options:NSCaseInsensitiveSearch]) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

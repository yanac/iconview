//
//  ViewController.m
//  conv
//
//  Created by yanac on 2014/03/31.
//  Copyright (c) 2014年 yanac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIButton *pushedButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    { // Button設定
        self.button1.layer.cornerRadius = 13;
        self.button1.clipsToBounds = true;
        [self.button1 setBackgroundImage:[UIImage imageNamed:@"Button1@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button2.layer.cornerRadius = 13;
        self.button2.clipsToBounds = true;
        [self.button2 setBackgroundImage:[UIImage imageNamed:@"Button2@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button3.layer.cornerRadius = 13;
        self.button3.clipsToBounds = true;
        [self.button3 setBackgroundImage:[UIImage imageNamed:@"Button3@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button4.layer.cornerRadius = 13;
        self.button4.clipsToBounds = true;
        [self.button4 setBackgroundImage:[UIImage imageNamed:@"Button4@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button5.layer.cornerRadius = 13;
        self.button5.clipsToBounds = true;
        [self.button5 setBackgroundImage:[UIImage imageNamed:@"Button5@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button6.layer.cornerRadius = 13;
        self.button6.clipsToBounds = true;
        [self.button6 setBackgroundImage:[UIImage imageNamed:@"Button6@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button7.layer.cornerRadius = 13;
        self.button7.clipsToBounds = true;
        [self.button7 setBackgroundImage:[UIImage imageNamed:@"Button7@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button8.layer.cornerRadius = 13;
        self.button8.clipsToBounds = true;
        [self.button8 setBackgroundImage:[UIImage imageNamed:@"Button8@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button9.layer.cornerRadius = 13;
        self.button9.clipsToBounds = true;
        [self.button9 setBackgroundImage:[UIImage imageNamed:@"Button9@2x.png"]
                                forState:UIControlStateNormal];
        
        self.button10.layer.cornerRadius = 13;
        self.button10.clipsToBounds = true;
        [self.button10 setBackgroundImage:[UIImage imageNamed:@"Button10@2x.png"]
                                 forState:UIControlStateNormal];
        
        self.button11.layer.cornerRadius = 13;
        self.button11.clipsToBounds = true;
        [self.button11 setBackgroundImage:[UIImage imageNamed:@"Button11@2x.png"]
                                 forState:UIControlStateNormal];
        
        self.button12.layer.cornerRadius = 13;
        self.button12.clipsToBounds = true;
        [self.button12 setBackgroundImage:[UIImage imageNamed:@"Button12@2x.png"]
                                 forState:UIControlStateNormal];
    }
    
    // 背景画像の設定
    self.backImage.image = [UIImage imageNamed:@"BGImage"];
}

#pragma mark - Event

- (IBAction)pushButton:(UIButton *)button {
    
    // ローカル変数に選択されたbuttonを渡す
    _pushedButton = button;
    
    UIActionSheet *selectLoadImageActionSheet = [UIActionSheet.alloc initWithTitle:@"画像の読み込み方法を選択してください"
                                                                          delegate:self
                                                                 cancelButtonTitle:@"キャンセル"
                                                            destructiveButtonTitle:nil
                                                                 otherButtonTitles:@"カメラロール", @"Dropbox", nil];
    
    [selectLoadImageActionSheet showInView:self.view];
}

#pragma mark - Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            // カメラロール
            [self openPicker:UIImagePickerControllerSourceTypePhotoLibrary];
            break;
        case 1:
            // Dropbox
            break;
    }
}

#pragma mark - Delegate(Picker)

// アラートの表示
- (void)showAlert:(NSString *)title text:(NSString *)text {
    UIAlertView *alert = [UIAlertView.alloc initWithTitle:title
                                                  message:text
                                                 delegate:nil
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
    [alert show];
}

// イメージピッカーのオープン
- (void)openPicker:(UIImagePickerControllerSourceType)sourceType {
    
    // カメラとフォトアルバムの利用可能チェック
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        [self showAlert:@"" text:@"利用できません"];
        return;
    }
    
    // イメージピッカー
    UIImagePickerController *picker = [UIImagePickerController.alloc init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    // ビューコントローラのビューを開く
    [self presentViewController:picker animated:YES completion:nil];
}

// イメージピッカーのイメージ取得時に呼ばれる
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    // Imageの指定
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // ボタンの背景画像にimageを設定
    [_pushedButton setBackgroundImage:selectedImage forState:UIControlStateNormal];
    
    // ビューを閉じる
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

// イメージピッカーのキャンセル時に呼ばれる
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)pickerCtl {
    // ビューを閉じる
    [pickerCtl.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end

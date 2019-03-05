//
//  MyRecordHomeVC.m
//  record
//
//  Created by zglnbjys on 2018/12/26.
//  Copyright © 2018年 tianyaoqi. All rights reserved.
//

#import "MyRecordHomeVC.h"
#import <NMCLiveStreaming/NMCLiveStreaming.h>
@interface MyRecordHomeVC ()<LSAudioCaptureDelegate>

@property (nonatomic,strong)NSString *streamUrl;

@property (nonatomic,strong)LSMediaCapture *mediaCapture;

@end

@implementation MyRecordHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.streamUrl = @"rtmp://p8f1c745d.live.126.net/live/15b3f4bba6cb4abbb09662e5cf373054?wsSecret=8b31f14bd376e8dfae3b76057ad6fc39&wsTime=1545795663";
//    [self initLive];
//    [self initUI];
}

- (void)dianbo {
    
}

#pragma mark -

- (void)initUI {
    UIButton *startLiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startLiveBtn setFrame:CGRectMake(20, 120, 120, 40)];
    [startLiveBtn setTitle:@"开始直播" forState:UIControlStateNormal];
    [startLiveBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [startLiveBtn addTarget:self action:@selector(startLiveAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startLiveBtn];
}

- (void)initLive {
    self.mediaCapture = [[LSMediaCapture alloc] initLiveStream:self.streamUrl];
    self.mediaCapture.audioCaptureDelegate = self;
    if (self.mediaCapture == nil) {
        NSLog(@"-- 初始化失败");
    }
}

#pragma mark - LSAudioCaptureDelegate
/**
 音频中断开始
 */
-(void)LSavAudioSessionInterruptionBegan {
    
}
/**
 音频中断结束
 */
-(void)LSavAudioSessionInterruptionEnded {
    
}

#pragma mark - Action
- (void)startLiveAction:(UIButton *)btn {
    
    [self.mediaCapture startLiveStream:^(NSError *error) {
        if (error) {
            NSLog(@"开始直播失败");
        }
        else {

        }
    }];
    [self.mediaCapture startVideoPreview:self.view];
}

- (void)dealloc {
    if (_mediaCapture) {
        [_mediaCapture unInitLiveStream];
        _mediaCapture = nil;
    }
}


@end

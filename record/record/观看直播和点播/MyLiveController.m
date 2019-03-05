//
//  MyLiveController.m
//  record
//
//  Created by zglnbjys on 2018/12/27.
//  Copyright © 2018年 tianyaoqi. All rights reserved.
//

#import "MyLiveController.h"
#import <NELivePlayerFramework/NELivePlayerFramework.h>
#import <NELivePlayerFramework/NELivePlayer.h>

@interface MyLiveController ()

//@property NELivePlayer

@end

@implementation MyLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NELivePlayerController *player = [[NELivePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://vodqeqi4c7g.vod.126.net/vodqeqi4c7g/05212e42-f6e5-4ecd-bd97-338de8ea79c4.MOV"] error:nil];
    
    CGFloat screenWidth  = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].bounds);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-20)];
    player.view.frame = view.bounds;
    player.view.backgroundColor = [UIColor redColor];
//    player.view.frame = CGRectMake(0, 0, screenWidth, screenHeight-20);
    //添加显示层
    [self.view addSubview:player.view];
    [player play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerBeginPlay:) name:NELivePlayerDidPreparedToPlayNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerBeginPlay:) name:NELivePlayerPlaybackFinishedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerBeginPlay:) name:NELivePlayerLoadStateChangedNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerBeginPlay:) name:NELivePlayerHardwareDecoderOpenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerBeginPlay:) name:NELivePlayerMoviePlayerSeekCompletedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerBeginPlay:) name:NELivePlayerHttpCodeResponseNotification object:nil];
}

- (void)playerBeginPlay:(NSNotification *)noti {
    NSLog(@"已经获取到视频第一帧");
    NSLog(@"%@",noti.userInfo);
}


@end

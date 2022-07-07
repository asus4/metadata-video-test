//
//  ViewController.m
//  metadata-video-test
//
//  Created by Koki Ibukuro on 07.07.22.
//

#import "ViewController.h"



extern void Avfi_LoadPlayer(const char* filePath);
extern void Avfi_StartPlaying(void);
extern void Avfi_StopPlaying(void);
extern bool Avfi_IsPlaying(void);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Avfi_LoadPlayer("aaaaaaa");
}


- (IBAction)onButtonTap:(id)sender {
    if(Avfi_IsPlaying()) {
        Avfi_StopPlaying();
    } else {
        Avfi_StartPlaying();
    }
}

@end

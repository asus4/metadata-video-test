//
//  ViewController.m
//  metadata-video-test
//
//  Created by Koki Ibukuro on 07.07.22.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

extern bool Avfi_LoadMetadata(const char* filePath);
extern uint32_t Avfi_GetBufferSize(void);
extern uint32_t Avfi_PeekMetadata(double time, void* data);

@interface ViewController ()
{
    void* _metadataBuffer;
    double _videoDuration;
}
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Load video file from asset
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"mp4"];

    // Get video duration 
    AVURLAsset* asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:filePath]];
    CMTime duration = asset.duration;
    _videoDuration = CMTimeGetSeconds(duration);
    NSLog(@"Video duration: %f", _videoDuration);

    Avfi_LoadMetadata([filePath UTF8String]);

    uint32_t bufferSize = Avfi_GetBufferSize();
    NSLog(@"bufferSize: %i", bufferSize);

    // Create a buffer to store metadata
    _metadataBuffer = malloc(bufferSize);
}

- (void)viewDidDisappear:(BOOL)animated {
    free(_metadataBuffer);
    _metadataBuffer = NULL;
}

- (IBAction)onSliderChange:(UISlider *)sender {
    double time = sender.value * _videoDuration;

    // Get metadata from the buffer
    Avfi_PeekMetadata(time, _metadataBuffer);

    // Convert metadata to double array
    double* data = (double*)_metadataBuffer;
    self.infoLabel.text = [NSString stringWithFormat:@"%f %f", data[0], data[1]];
}

@end

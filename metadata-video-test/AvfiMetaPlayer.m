//
//  AvfiMetaPlayer.m
//  metadata-video-test
//
//  Created by Koki Ibukuro on 07.07.22.
//

#import <Foundation/Foundation.h>

static bool _isPlaying = true;

extern void Avfi_LoadPlayer(const char* filePath) {
    NSLog(@"Avfi_LoadPlayer");
}

extern void Avfi_StartPlaying(void) {
    NSLog(@"Avfi_StartPlaying");
}

extern void Avfi_StopPlaying(void) {
    NSLog(@"Avfi_StopPlaying");
}

extern bool Avfi_IsPlaying(void) {
    _isPlaying = !_isPlaying;
    return _isPlaying;
}

//
//  TestThingy.h
//  NewJammingue
//
//  Created by Felix Herron on 4/22/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "ObjectAL.h"

@interface TestThingy : NSViewController
{
    ALDevice* device;
    ALContext* context;
    ALChannelSource* channel;
    ALBuffer* shootBuffer;
    ALBuffer* explosionBuffer;
    
    // Background Music
    
    OALAudioTrack* metronome1;
    OALAudioTrack* metronome2;
    OALAudioTrack* piano1;
    OALAudioTrack* piano2;
    OALAudioTrack* piano3;
    OALAudioTrack* drums1;
    OALAudioTrack* mandolin1;
    OALAudioTrack* mandolin2;
    OALAudioTrack* mandolin3;
}
void foofunctin();

@end

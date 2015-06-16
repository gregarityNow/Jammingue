//
//  testThingoClass.h
//  NewJammingue
//
//  Created by Felix Herron on 4/28/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "ObjectAL.h"


@interface testThingoClass : NSViewController


{
    // Sound Effects
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
- (IBAction)clickando:(id)sender;

@end

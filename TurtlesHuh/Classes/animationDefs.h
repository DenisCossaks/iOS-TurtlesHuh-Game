#ifndef ANIMATION_DEFS_H
#define ANIMATION_DEFS_H

// this structure holds transform data of one sprite in one animation frame
typedef struct _FrameData{
    float x;
    float y;
    float rotation;
    float scaleX;
    float scaleY;
}FrameData;

// this structure holds information about animation frames for one sprite
typedef struct _SpriteData{
    char *spriteName;       // name of the sprite
    int firstFrame;         // number of first frame of this animation in frameData[]
    int framesCount;        // number of frames in animation
}SpriteData;

// this structure holds data of whole animation
typedef struct _AnimationData{
    int framesCount;        // number of frames in animation
    int spritesCount;       // number of sprites
    SpriteData spriteData[20];// table of SpriteData structures with animation info for each sprite
}AnimationData;

// structures with data defined in .cpp file
extern const FrameData frameData[];
extern const AnimationData turtleOutAnim;
extern const AnimationData turtleInAnim;
extern const AnimationData IdleTurtleAnim;
extern const AnimationData PenguinJumpAnim;
extern const AnimationData CannonShootAnim;
extern const AnimationData ArrowAnim;
extern const AnimationData RocketAnim;

#endif

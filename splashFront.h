
//{{BLOCK(splashFront)

//======================================================================
//
//	splashFront, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 72 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2304 + 2048 = 4864
//
//	Time-stamp: 2019-11-23, 17:07:12
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHFRONT_H
#define GRIT_SPLASHFRONT_H

#define splashFrontTilesLen 2304
extern const unsigned short splashFrontTiles[1152];

#define splashFrontMapLen 2048
extern const unsigned short splashFrontMap[1024];

#define splashFrontPalLen 512
extern const unsigned short splashFrontPal[256];

#endif // GRIT_SPLASHFRONT_H

//}}BLOCK(splashFront)

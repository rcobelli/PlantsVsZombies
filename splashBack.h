
//{{BLOCK(splashBack)

//======================================================================
//
//	splashBack, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 92 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2944 + 2048 = 5504
//
//	Time-stamp: 2019-11-23, 17:11:26
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHBACK_H
#define GRIT_SPLASHBACK_H

#define splashBackTilesLen 2944
extern const unsigned short splashBackTiles[1472];

#define splashBackMapLen 2048
extern const unsigned short splashBackMap[1024];

#define splashBackPalLen 512
extern const unsigned short splashBackPal[256];

#endif // GRIT_SPLASHBACK_H

//}}BLOCK(splashBack)

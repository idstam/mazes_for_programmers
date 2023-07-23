
// Project: mazes-for-programmers 
// Created: 23-07-12

// show all errors

SetErrorMode(2)

// set window properties
SetWindowTitle( "mazes-for-programmers" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 )
SetRandomSeed(1337)

#insert "mz_grid_types.agc"
#insert "mz_grid_cell.agc"
#insert "mz_grid.agc"
#insert "mz_grid_render.agc"
#insert "mz_strategies.agc"

grid as MzGrid
size = 10
grid = MzCreateGrid(size, size)
MzBinaryTreeStrategy(grid)
//MzSidewinderStrategy(grid)

//		grid = MzCreateGrid(size, size)
//		MzSidewinderStrategy(grid)
//		grid = MzCreateGrid(size, size)
//		MzSidewinderStrategy(grid)

do
	if GetPointerPressed() = true
		grid = MzCreateGrid(size, size)
		s = Random(0,1)
		if s = 0
			MzBinaryTreeStrategy(grid)
		elseif s = 1
			MzSidewinderStrategy(grid)
		endif
	endif
    MzRenderGridOutlines(grid)
    Print( ScreenFPS() )
    Sync()
loop

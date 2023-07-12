
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

#insert "grid_types.agc"
#insert "grid_cell.agc"
#insert "grid.agc"
#insert "grid_render.agc"

grid as Grid
grid = CreateGrid(10, 10)

do
    RenderGrid(grid)
    Print( ScreenFPS() )
    Sync()
loop

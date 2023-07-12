// File: grid_render.agc
// Created: 23-07-12


function RenderGrid(grid as Grid)
    cell as Cell
    cs = 50 //Cell size
    lt = 2 //Line Thickness
    os = 30 //offset
    
    //North
    DrawLine(os, os, (grid.Cols * cs) + os, os, 255, 0, 0 ) 
    //West
    DrawLine(os,os, os, (grid.Cols * cs) + os, 255, 0, 0 ) 
    
	for i = 0 to grid.Cells.length 
        cell = grid.Cells[i]
        //South
        DrawLine( (cell.Col * cs) + os, (cell.Row * cs) + cs  + os, (cell.Col * cs) + cs + os, (cell.Row * cs) + cs + os, 255, 0, 0 ) 
        //East
        DrawLine( (cell.Col * cs) + cs + os, (cell.Row * cs)  + os, (cell.Col * cs) + cs + os, (cell.Row * cs) + cs  + os, 255, 0, 0 ) 
    next
endfunction
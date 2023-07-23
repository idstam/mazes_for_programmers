// File: maze_strategies.agc
// Created: 23-07-13

function MzBinaryTreeStrategy(grid ref as MzGrid)
	neighbours as integer[]
    for i = 0 to grid.Cells.length
		neighbours.length = -1
    	if grid.Cells[i].North >= 0
    		neighbours.insert(grid.Cells[i].North)
    	endif
    	if grid.Cells[i].East >= 0
    		neighbours.insert(grid.Cells[i].East)
    	endif
    	if neighbours.length >= 0
    		link = neighbours[Random(0,neighbours.length)]
    		MzLinkCells(grid, i, link, true)
    	endif
    next
endfunction

function MzSidewinderStrategy(grid ref as MzGrid)
	run as integer[]
	for row = 0 to grid.Rows -1
		run.length = -1
		for col = 0 to grid.Cols -1
			i = (row * grid.Cols) + col
			run.insert(i)
			at_eastern_boundary = (col = grid.Cols -1)
			at_northern_boundary = (row = 0)
			should_close_out = at_eastern_boundary or ((at_northern_boundary = false) and (Random(0,1) = 1))
			
			if should_close_out = true
				member = run[Random(0, run.length)]
				if grid.Cells[member].North >= 0
					MzLinkCells(grid, member, grid.Cells[member].North, true)
					run.length = -1
				endif
			else
				MzLinkCells(grid, i, grid.Cells[i].East, true)
			endif
		next
	next
endfunction
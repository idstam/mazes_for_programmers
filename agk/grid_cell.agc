// File: Cell.agc
// Created: 23-07-12



function CreateCell(row as integer, col as integer)
	ret as Cell
	ret.Row = row
	ret.Col = col
	ret.Initialized = true
	
endfunction ret

function LinkCells(cell1 as Cell, cell2 as Cell, bidi as integer)
	if cell2.Initialized = false then exitfunction

	id as CellID
	id.Row = cell2.Row
	id.Col = cell2.Col
	cell1.Links.insert(id)
	if bidi = true
		LinkCells(cell2, cell1, false)
	endif
endfunction

function UnlinkCells(cell1 as Cell, cell2 as Cell, bidi as integer)
	for i = cell1.Links.length to 0 step -1
		if cell1.Links[i].Col = cell2.Col and cell1.Links[i].Row = cell2.Row
			cell1.Links.remove(i)
		endif
	next
	
	if bidi = true then UnlinkCells(cell2, cell1, false)
		
endfunction

function AreCellsLinked(cell1 as Cell, cell2 as Cell)
	if cell2.Initialized = false then exitfunction false

		for i = cell1.Links.length to 0 step -1
		if cell1.Links[i].Col = cell2.Col and cell1.Links[i].Row = cell2.Row
			exitfunction true
		endif
	next
	
endfunction false

function GetCellNeighbours(grid as Grid,cell as Cell)
	neighbours as Cell[]
	if cell.North.Initialized = true then neighbours.insert(GetCellByID(grid, cell.North))
	if cell.South.Initialized = true then neighbours.insert(GetCellByID(grid, cell.South))
	if cell.East.Initialized = true then neighbours.insert(GetCellByID(grid, cell.East))
	if cell.West.Initialized = true then neighbours.insert(GetCellByID(grid, cell.West))
endfunction neighbours

function CreateCellID(cell as Cell)
	cellID as CellID
	cellID.Row = cell.Row 
	cellID.Col = cell.Col 
	cellID.Initialized = true 
endfunction cellID
// File: types.agc
// Created: 23-07-12

global true = 1
global false = 0

type CellID
	Row as integer
	Col as integer
	Initialized as Integer
endtype

type Cell
	Row as Integer
	Col as Integer
	North as CellID
	South as CellID
	East as CellID
	West as CellID
	Links as CellID[]
	Initialized as Integer
endType

type Grid
	Rows as integer 
	Cols as integer
	Cells as Cell[]
endtype
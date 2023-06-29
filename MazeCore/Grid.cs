using System;
using System.Linq;

namespace MazeCore
{
    public class Grid
    {
        private int _rows;
        private int _columns;
        private Cell[][] _grid;
        public Grid(int rows, int columns)
        {
            _rows = rows;
            _columns = columns;
            _grid = PrepareGrid();
            ConfigureCells();
        }
        private Cell[][] PrepareGrid()
        {
            var ret = new Cell[_columns][];

            for (int c = 0; c < _columns; c++)
            {
                ret[c] = new Cell[_rows];
            }
            for (int c = 0; c < _columns; ++c)
            {
                for (int r = 0; r < _rows; ++r)
                {
                    ret[c][r] = new Cell(r, c);
                }
            }
            return ret;
        }

        private void ConfigureCells()
        {
            foreach(var cell in Cells)
            {
                cell.North = GetCell(cell.Row - 1, cell.Column);
                cell.South= GetCell(cell.Row +1, cell.Column);
                cell.East= GetCell(cell.Row, cell.Column+1);
                cell.West = GetCell(cell.Row, cell.Column - 1);
            }
        }
        public Cell? GetCell(int row, int column)
        {
            if (row < 0 || column < 0 || row >= _rows - 1 || column >= _columns - 1)
            {
                return null;
            }
            return _grid[column][row];
        }
        public Cell GetRandom()
        {
            var rnd = new Random();
            var r = rnd.Next(0, _rows);
            var c = rnd.Next(0, _columns);
            var ret = GetCell(r, c);

            if( ret != null)
            {
                return ret;
            }
            else
            {
                throw new NullReferenceException();
            }
        }
        public IEnumerable<Cell> Cells
        {
            get
            {
                for(int c = 0; c < _columns; ++c)
                {
                    for(int r = 0; r < _rows; ++r)
                    {
                        yield return _grid[c][r];
                    }
                }
            }
        }
        public int Size { get => _rows * _columns; } 
    }
}

using System;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;

namespace MazeCore
{
    public class Grid
    {
        public Random Rnd = new Random();
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
            foreach (var cell in Cells)
            {
                cell.North = GetCell(cell.Row - 1, cell.Column);
                cell.South = GetCell(cell.Row + 1, cell.Column);
                cell.East = GetCell(cell.Row, cell.Column + 1);
                cell.West = GetCell(cell.Row, cell.Column - 1);
            }
        }
        public Cell? GetCell(int row, int column)
        {
            if (row < 0 || column < 0 || row >= _rows  || column >= _columns )
            {
                return null;
            }
            return _grid[column][row];
        }
        public Cell GetRandom()
        {

            var r = Rnd.Next(0, _rows);
            var c = Rnd.Next(0, _columns);
            var ret = GetCell(r, c);

            if (ret != null)
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
                for (int c = 0; c < _columns; ++c)
                {
                    for (int r = 0; r < _rows; ++r)
                    {
                        yield return _grid[c][r];
                    }
                }
            }
        }
        public IEnumerable<Cell[]> Rows
        {
            get
            {
                for (int r = 0; r < _rows; ++r)
                {
                    var row = new Cell[_columns];
                    for (int c = 0; c < _columns; ++c)
                    {
                        var cell = GetCell(r, c);
                        if (cell != null)
                        {
                            row[c] = cell;
                        }
                        else
                        {
                            throw new NullReferenceException();
                        }
                    }
                    yield return row;
                }

            }

        }
        public int Size { get => _rows * _columns; }

        public override string ToString()
        {
            var ret = new StringBuilder();
            ret.AppendLine("+" + String.Concat(Enumerable.Repeat("---+", _columns)));
            foreach (var row in Rows)
            {
                var top = "|";
                var bottom = "+";
                foreach (var cell in row)
                {
                    var body = "   ";
                    var eastBoundary = cell.Linked(cell.East) ? " " : "|";
                    top += body + eastBoundary;

                    var southBoundary = cell.Linked(cell.South) ? "   " : "---";
                    var corner = "+";
                    bottom += southBoundary + corner;
                }
                ret.AppendLine(top);
                ret.AppendLine(bottom);
            }

            return ret.ToString();
        }
        public Cell Sample(IEnumerable<Cell> cells)
        {
            var r = Rnd.Next(cells.Count());
            return cells.ElementAt(r);
        }
    }
}

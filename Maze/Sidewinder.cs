using MazeCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maze
{
    public class Sidewinder:IStrategy
    {
        public void On(Grid grid)
        {
            foreach(var row in grid.Rows)
            {
                var run = new List<Cell>();
                foreach(var cell in row)
                {
                    run.Add(cell);
                    var atEasternBoundary = (cell.East is null);
                    var atNorthenBoundary = (cell.North is null);
                    var shouldCloseOut =atEasternBoundary || (!atNorthenBoundary && grid.Rnd.Next(2) == 0);
                    if (shouldCloseOut)
                    {
                        var member = grid.Sample(run);
                        if (member.North != null)
                        {
                            member.Link(member.North);
                        }
                        run.Clear();
                    }
                    else
                    {
                        cell.Link(cell.East);
                    }
                }
            }
        }
    }
}

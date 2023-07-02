namespace Maze
{
    using MazeCore;
    internal class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                var grid = new Grid(15, 15);
                var strategy = new Sidewinder();
                strategy.On(grid);
                Console.WriteLine(grid.ToString());

                Console.WriteLine("Enter r to create a new one or an empty line to break");
                if (Console.ReadLine().ToLowerInvariant() != "r")
                {
                    break;
                }
            }
        }
    }
}
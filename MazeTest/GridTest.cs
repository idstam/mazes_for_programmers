namespace MazeTest
{
    using MazeCore;

    [TestClass]
    public class GridTest
    {
        [TestMethod]
        public void TestGetCell()
        {
            var grid = new MazeCore. Grid(3, 3);
            Assert.IsNotNull(grid);
            Assert.IsNull(grid.GetCell(5, 5));
        }
    }
}
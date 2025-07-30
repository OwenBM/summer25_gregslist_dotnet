using gregslist_dotnet.Interfaces;

namespace gregslist_dotnet.Repositories;

public class HousesRepository : IRepository<House>
{
    private readonly IDbConnection _db;
    public HousesRepository(IDbConnection db)
    {
        _db = db;
    }

    
    public House Create(House data)
    {
        throw new NotImplementedException();
    }

    public void Delete(int id)
    {
        throw new NotImplementedException();
    }

    public House GetById(int id)
    {
        throw new NotImplementedException();
    }

    public void Update(House updateData)
    {
        throw new NotImplementedException();
    }

    public List<House> GetAll()
    {
        string sql = @"SELECT 
        houses.*, 
        accounts.*
        FROM houses
        JOIN accounts ON houses.creator_id = accounts.id
        ORDER BY houses.createdAt ASC;";
        List<House> houses = _db.Query(sql, (House house, Account account) =>
        {
            house.Creator = account;
            return house;
        }).ToList();
        return houses;
    }
}
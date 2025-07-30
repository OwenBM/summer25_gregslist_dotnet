namespace gregslist_dotnet.Controllers;

[ApiController]
[Route("api/[controller]")]

public class HousesController : ControllerBase
{

    private readonly HousesService _housesService;
    private readonly Auth0Provider _auth0Provider;
    public HousesController(HousesService housesService, Auth0Provider auth0Provider)
    {
        _housesService = housesService;
        _auth0Provider = auth0Provider;
    }

    public ActionResult<List<House>> GetHouses()
    {
        try
        {
            List<House> houses = _housesService.GetHouses();
            return Ok(houses);
        }
        catch (Exception exception)
        {
            return BadRequest(exception.Message);
        }
    }
}
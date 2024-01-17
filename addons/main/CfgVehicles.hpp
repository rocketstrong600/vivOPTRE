class CfgVehicles
{
  class Helicopter;
  class Helicopter_Base_F;
  class Helicopter_Base_H;
  class OPTRE_Pelican_F;
  class OPTRE_Pelican_F: Helicopter_Base_H
  {
    class VehicleTransport
    {
    	class Carrier
    	{
    		cargoBayDimensions[] = { {4,-0.5,0.8}, {-4,-14,-2.5} };

    		disableHeightLimit = 1;
    		maxLoadMass = 200000; // KG
    		cargoAlignment[] = { "front", "center" };

    		cargoSpacing[] = { 0, 0.1, 0 };

    		exits[] = { {0,-14,-3.5} };

    		unloadingInterval = 2;
    		loadingDistance = 10;
    		loadingAngle = 60;
    		parachuteClassDefault = "B_Parachute_02_F";
    		parachuteHeightLimitDefault	= 50;

    	};
    };
    class UserActions;
    class UserActions {
      class PelLift_LoadVehicle;
      class PelLift_LoadVehicle {
        displayName = "Load Vehicle Old";
        displayNameDefault = "Load Vehicle Old";
      };
    };
  };
};

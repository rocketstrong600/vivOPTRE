class CfgVehicles
{
  class Helicopter;
  class Helicopter_Base_F;
  class Helicopter_Base_H;
  class OPTRE_Pelican_F {
    class UserActions
    {
      class PelLift_LoadVehicle;
    };
  };
  class OPTRE_Pelican_F: Helicopter_Base_H
  {
    class VehicleTransport
    {
    	class Carrier
    	{
    		cargoBayDimensions[] = { {4,-0.5,0.8}, {-4,-13,-2.5} };

    		disableHeightLimit = 1;
    		maxLoadMass = 200000; // KG
    		cargoAlignment[] = { "center", "front" };

    		cargoSpacing[] = { 0, 0, 0 };

    		exits[] = { {0,-7,-3.5} };

    		unloadingInterval = 2;
    		loadingDistance = 30;
    		loadingAngle = 180;
    		parachuteClassDefault = "B_Parachute_02_F";
    		parachuteHeightLimitDefault	= 50;

    	};
    };
    class UserActions {
      class PelLift_LoadVehicle
      {
        displayName="Load Vehicle Old";
        displayNameDefault="Load Vehicle Old";
        textToolTip="Load Vehicle Old";
      };
    };
  };
};

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
    		cargoAlignment[] = { "center", "front" };

    		cargoSpacing[] = { 0, 0.1, 0 };

    		exits[] = { {0,-8,-3.5} };

    		unloadingInterval = 2;
    		loadingDistance = 30;
    		loadingAngle = 180;
    		parachuteClassDefault = "B_Parachute_02_F";
    		parachuteHeightLimitDefault	= 50;

    	};
    };
    class UserActions;
    class UserActions {
      class PelLift_LoadVehicle;
			class PelLift_LoadVehicle
			{
				userActionID=6;
				displayName="Load Vehicle old";
				displayNameDefault="Load Vehicle old";
				textToolTip="Load Vehicle old";
				position="cargo_door_handle";
				showWindow=0;
				radius=15;
				priority=2;
				onlyForPlayer=0;
				condition="!(player in [gunner this, driver this]) AND (player == driver vehicle player) AND (str (this getVariable [""OPTRE_Pelican_AttachedToVehiclesEffect"",[]]) == ""[]"") AND (vehicle player != player)";
				statement="0 = [this,vehicle player] spawn OPTRE_fnc_PelicanLoadValidate;";
			};
    };
  };
};

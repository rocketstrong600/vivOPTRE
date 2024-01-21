class CfgVehicles
{
	class Logic;
	class Module_F : Logic;


  class GVAR(ModuleLoadVehicle) : Module_F
  {
    displayName = "AI Load Vehicle in Cargo";
    catagory = QGVAR(AI);
    function = QFUNC(moduleLoadVehicle);
	  functionPriority = 1;
    isGlobal = 1;
    isTriggerActivated = 0;
    scope = 1;
    scopeCurator = 2;
    curatorCanAttach = 1;
  };
};

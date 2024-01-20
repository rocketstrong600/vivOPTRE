class CfgVehicles
{
	class Logic;
	class Module_F : Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription
		{
			class AnyBrain;
		};
	};


  class GVAR(ModuleLoadVehicle) : Module_F
  {
    displayName = "Load Vehicle in cargo";
    catagory = QGVAR(AI);
    function = QFUNC(moduleLoadVehicle);
	  functionPriority = 1;
    isGlobal = 1;
    isTriggerActivated = 0;
    scope = 1;
    scopeCurator = 2;
    curatorCanAttach = 1;

    class Attributes : AttributesBase
    {
      class Units : Units
			{
				property = QGVAR(ModuleLoadVehicle_Units);
			};
    };
  };
};

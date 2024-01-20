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


  class alcor_zeus_Module_LoadVehicle : Module_F
  {
    scope=2;
    displayName = "Load Vehicle in cargo";
    catagory = "alcor_zeus_AI_Manager";
    function = "alcor_zeus_fnc_moduleLoadVehicle";
    curatorCanAttach = 1;

    class Attributes : AttributesBase
    {
      class Units : Units
			{
				property = "alcor_zeus_Module_Load_Vehicle_Units";
			};
    };
  };
};

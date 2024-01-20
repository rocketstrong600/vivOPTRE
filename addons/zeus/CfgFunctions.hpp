class CfgFactionClasses
{
	class NO_CATEGORY;
	class ADDON_ai_manager: NO_CATEGORY
	{
		displayName = "Alcor AI Managment";
	};
};

class CfgFunctions
{
	class ADDON
	{
		class ADDON_ai_manager
		{
			file = "\ADDON\functions";
			class moduleLoadVehicle {};
		};
	};
};

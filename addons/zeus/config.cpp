#include "script_component.hpp"

// Simply a package which requires other addons.
class CfgPatches {
    class ADDON {
        name = CSTRING(Component);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Modules_F"
        };
        VERSION_CONFIG;
    };
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class ADDON_ai_manager: NO_CATEGORY
	{
		displayName = "Alcor AI Managment";
	};
};


#include "CfgVehicles.hpp"

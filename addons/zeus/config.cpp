#include "script_component.hpp"

// Simply a package which requires other addons.
class CfgPatches {
    class ADDON {
        name = CSTRING(Component);
        units[] = {QGVAR(ModuleLoadVehicle)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Modules_F"
        };
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"

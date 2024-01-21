#include "script_component.hpp"

// Simply a package which requires other addons.
class CfgPatches {
    class ADDON {
        name = CSTRING(Component);
        units[] = {QGVAR(ModuleLoadVehicle)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "alcor_main",
            "A3_Modules_F"
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgClasses.hpp"
#include "CfgVehicles.hpp"

#include "script_component.hpp"

// Simply a package which requires other addons.
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_common",
            "OPTRE_Vehicles",
            "OPTRE_Vehicles_Air",
            "OPTRE_Vehicles_Tracked",
            "OPTRE_ACE_Compat"
        };
    };
};


#include "CfgVehicles.hpp"

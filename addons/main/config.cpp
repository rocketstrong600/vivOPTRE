#include "script_component.hpp"

// Simply a package which requires other addons.
class CfgPatches {
    class ADDON {
        name = CSTRING(Component);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_common",
            "ace_common",
            "OPTRE_Vehicles",
            "OPTRE_Vehicles_Pelican",
            "OPTRE_Vehicles_Air",
            "OPTRE_Vehicles_Tracked",
            "OPTRE_ACE_Compat",
            "A3_Data_F",
            "A3_UI_F_Bootcamp",
            "A3_UI_F"
        };
        VERSION_CONFIG;
    };
};


#include "CfgVehicles.hpp"
#include "CfgMisc.hpp"

#include "script_component.hpp"
params ["_logic"];

if (not local _logic) exitwith {};

private _vehicle = attachedto _logic;

deletevehicle _logic;
// don't want to litter the world with useless modules

// vehicle must exist
if (isNull _vehicle) exitwith {
    [objNull, "Must be attached to vehicle"] call BIS_fnc_showCuratorFeedbackMessage;
};

// vehicle Must Be alive
if (not alive _vehicle) exitwith {
    [objNull, "vehicle must be alive"] call BIS_fnc_showCuratorFeedbackMessage;
};

[
    _vehicle,
    {
        params ["_successful", "_vehicle", "_mousePosASL"];
        
        if (not _successful) exitwith {};
        
        private _mousePosAGL = ASLtoAGL _mousePosASL;
        
        private _target = (nearestobjects [_mousePosAGL, ["landvehicle", "Air", "Ship"], 15, true]) param [0, objNull];
        
        if (isNull _target) exitwith {
            [objNull, "Target not found or is not vehicle"] call BIS_fnc_showCuratorFeedbackMessage;
        };
        
        if (not alive _target) exitwith {
            [objNull, "Target must be alive"] call BIS_fnc_showCuratorFeedbackMessage;
        };
        
        private _canCargo = _vehicle canVehicleCargo _target;
        // returns array [willFitintoCurrentvehicle, willFitintoEmptyvehicle]
        
        if ((not (_canCargo select 0)) and (not (_canCargo select 1))) exitwith {
            [objNull, "vehicle can not be transported"] call BIS_fnc_showCuratorFeedbackMessage;
        };
        
        private _vehiclecrew = crew _vehicle;
        // array of crew
        private _targetcrew = crew _target;
        
        if ((count _targetcrew == 0) and (count _vehiclecrew == 0)) exitwith {
            [objNull, "No crew to command"] call BIS_fnc_showCuratorFeedbackMessage;
        };

        private _vehicleGroup = group (_vehiclecrew select 0);
        private _targetGroup = group (_targetcrew select 0);
        
        // decide how ai is going to make vehicle get in Transport vehicle
        
        // AI in Target is already able to drive into Transport
        // AI in Target will drive into transport. Transport may need land
        if (count _targetcrew > 0) exitwith {
            // if AI in Transport is flying then land
            
            private _wpa = _targetGroup addWaypoint [_vehicle, -1];
            _wpa waypointAttachVehicle(_vehicle);
            _wpa setwaypointType "VEHICLEINVEHICLEGETIN";
        };
        
        // No AI crew in Target but crew in transport.
        if ((count _targetcrew == 0) and (count _vehiclecrew > 0)) exitwith {
            // if AI in Transport is flying then land
            
            private _landwp = [_vehicleGroup, position _target] spawn BIS_fnc_wpland;
            waitUntil { scriptDone _landwp };
            private _wpb = _vehicleGroup addWaypoint [_target, -1];
            _wpb waypointAttachVehicle(_target);
            _wpb setwaypointType "GETIN";
            private _wpc = _vehicleGroup addWaypoint [_vehicle, -1];
            _wpc waypointAttachVehicle(_vehicle);
            _wpc setwaypointType "VEHICLEINVEHICLEGETIN";
            private _wpd = _vehicleGroup addWaypoint [_vehicle, -1];
            _wpd waypointAttachVehicle(_vehicle);
            _wpd setwaypointType "GETIN";
        };
    },
    "select vehicle to pickup"
] call ace_zeus_fnc_getmoduleDestination;
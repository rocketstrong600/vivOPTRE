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
        
        // decide how ai is going to make vehicle get in Transport vehicle
        
        // AI in Target is already able to drive into Transport
        // AI in Target will drive into transport. Transport may need land
        if (not isNull (_targetcrew select 0)) exitwith {
            // if AI in Transport is flying then land
            if (isEngineOn _vehicle) then {
                [group (_vehiclecrew select 0), _mousePosAGL, _vehicle] spawn BIS_fnc_wpland;
            };
            
            _wpa = (group (_targetcrew select 0)) addWaypoint [_vehicle, -1];
            _wpa = waypointAttachVehicle(_vehicle);
            _wpa setwaypointDescription "Get vehicle in transport";
            _wpa setwaypointType "VEHICLEINVEHICLEGETIN";
        };
        
        // No AI crew in Target but crew in transport.
        if ((count _targetcrew == 0) and (count _vehiclecrew > 0)) exitwith {
            // if AI in Transport is flying then land
            if (isEngineOn _vehicle) then {
                [group (_vehiclecrew select 0), _mousePosAGL, _vehicle] spawn BIS_fnc_wpland;
            };

            _wpa = (group (_vehiclecrew select 0)) addWaypoint [_target, -1];
            _wpa setwaypointDescription "Get out of transport";
            _wpa setwaypointType "GETOUT";
            
            _wpb = (group (_vehiclecrew select 0)) addWaypoint [_target, -1];
            _wpb = waypointAttachVehicle(_target);
            _wpb setwaypointDescription "Get in pickup";
            _wpb setwaypointType "GETIN";
            
            _wpc = (group (_vehiclecrew select 0)) addWaypoint [_vehicle, -1];
            _wpc = waypointAttachVehicle(_vehicle);
            _wpc setwaypointDescription "Get pickup in transport";
            _wpc setwaypointType "VEHICLEINVEHICLEGETIN";
            
            _wpd = (group (_vehiclecrew select 0)) addWaypoint [_vehicle, -1];
            _wpd setwaypointDescription "Get out of pickup";
            _wpd setwaypointType "GETOUT";

            _wpe = (group (_vehiclecrew select 0)) addWaypoint [_vehicle, -1];
            _wpe = waypointAttachVehicle(_vehicle);
            _wpe setwaypointDescription "Get in transport";
            _wpe setwaypointType "GETIN";
        };
    },
    "select vehicle to pickup"
] call ace_zeus_fnc_getmoduleDestination;
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
        
        private _target = (nearestobjects [_mousePosAGL, ["landvehicle", "Air", "Ship"], 15, true]) select 0;
        
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
        
        if (isNull (_targetcrew select 0) and isNull (_vehiclecrew select 0)) exitwith {
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
            
            _wp = (group (_targetcrew select 0)) addWaypoint [_vehicle, -1];
            _wp setwaypointDescription "Get vehicle in transport";
            _wp setwaypointType "vehicleinvehicleGETin";
        };
        
        // No AI crew in Target but crew in transport.
        if ((isNull (_targetcrew select 0)) and (not isNull (_vehiclecrew select 0))) exitwith {
            // if AI in Transport is flying then land
            if (isEngineOn _vehicle) then {
                [group (_vehiclecrew select 0), _mousePosAGL, _vehicle] spawn BIS_fnc_wpland;
            };
            
            _wp = (group (_vehiclecrew select 0)) addWaypoint [_target, -1];
            _wp setwaypointDescription "Get in target";
            _wp setwaypointType "GETin";
            
            _wptwo = (group (_vehiclecrew select 0)) addWaypoint [_vehicle, -1];
            _wptwo setwaypointDescription "Get vehicle in transport";
            _wptwo setwaypointType "vehicleinvehicleGETin";
            
            _wptwo = (group (_vehiclecrew select 0)) addWaypoint [_vehicle, -1];
            _wptwo setwaypointDescription "Get in transport";
            _wptwo setwaypointType "GETin";
        };
    },
    "select vehicle with Cargo"
] call ace_zeus_fnc_getmoduleDestination;
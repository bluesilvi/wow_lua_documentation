
-- Example:
-- ---@type spell_prediction
-- local x = require("common/modules/spell_prediction")
-- x: -> IntelliSense
-- Warning: Access with ":", not "."

---@alias prediction_type number
---@alias prediction_type.ACCURACY 1
---@alias prediction_type.MOST_HITS 2

---@alias geometry_type number
---@alias geometry_type.CIRCLE 1
---@alias geometry_type.RECTANGLE 2
---@alias geometry_type.CONE 3

---@class spell_data
---@field public angle number
---@field public radius number
---@field public spell_id number
---@field public max_range number
---@field public cast_time number
---@field public source_position vec3
---@field public projectile_speed number
---@field public exception_is_heal boolean
---@field public geometry_type geometry_type
---@field public intersection_factor number
---@field public time_to_hit_override number
---@field public prediction_mode prediction_type
---@field public exception_player_included boolean
---@field public hitbox_min number
---@field public hitbox_max number
---@field public hitbox_mult number

---@class hit_data
---@field public obj game_object
---@field public center_position vec3
---@field public intersection_position vec3

---@class prediction_result
---@field public hit_list table<hit_data>
---@field public amount_of_hits number
---@field public cast_position vec3

-- spell_data constructor
---@class spell_prediction
--- Helper function to create new spell data with default values.
---@field public new_spell_data fun(self: spell_prediction, spell_id: number, max_range: number?, radius: number?, cast_time: number?, projectile_speed: number?, prediction_mode: prediction_type?, geometry: geometry_type?, source_position: vec3?): spell_data

-- main function
---@class spell_prediction
--- Helper function to get the center position of a target.
---@field public get_center_position fun(self: spell_prediction, target: game_object, spell_data: spell_data): vec3

-- utility functions
---@class spell_prediction
--- Helper function to get the intersection position for casting.
---@field public get_intersection_position fun(self: spell_prediction, target: game_object, center_position: vec3, circle_radius: number, interception_percentage: number): vec3
--- Gets the circle list of hit data based on the target position and spell data.
---@field public get_circle_list fun(self: spell_prediction, target_position: vec3, spell_data: spell_data, is_heal: boolean?): table<hit_data>
--- Gets the rectangle list of hit data based on the target position and spell data.
---@field public get_rectangle_list fun(self: spell_prediction, target_position: vec3, spell_data: spell_data, is_heal: boolean?): table<hit_data>
--- Gets the cone list of hit data based on the target position and spell data.
---@field public get_cone_list fun(self: spell_prediction, target_position: vec3, spell_data: spell_data, is_heal: boolean?): table<hit_data>
--- Gets the unit geometry list of hit data based on the position and spell data.
---@field public get_unit_geometry_list fun(self: spell_prediction, position: vec3, spell_data: spell_data): table<hit_data>
--- Helper function to get the best position for most hits.
---@field public get_most_hits_position fun(self: spell_prediction, main_position: vec3, spell_data: spell_data): prediction_result
--- Function to get the cast position based on the prediction mode.
---@field public get_cast_position fun(self: spell_prediction, target: game_object, spell_data: spell_data): prediction_result
--- Function to get the cast position based on the prediction mode with position override.
---@field public get_cast_position_ fun(self: spell_prediction, position_override: vec3, spell_data: spell_data): prediction_result

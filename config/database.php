<?php

return 
[
	'type' =>  env('database.type' ,'mysql'),
	'hostname' =>  env('database.hostname' ,'127.0.0.1'),
	'database' =>  env('database.database' ,'thinkadminv5'),
	'username' =>  env('database.username' ,'root'),
	'password' =>  env('database.password' ,'root'),
	'hostport' =>  env('database.hostport' ,'3306'),
	'params' =>array (
),
	'charset' =>  env('database.charset' ,'utf8mb4'),
	'prefix' =>'',
	'debug' =>false,
	'deploy' =>0,
	'rw_separate' =>false,
	'master_num' =>1,
	'slave_no' =>'',
	'fields_strict' =>true,
	'resultset_type' =>'array',
	'auto_timestamp' =>false,
	'datetime_format' =>'Y-m-d H:i:s',
	'sql_explain' =>false,
	'query' =>'\\think\\db\\Query',
];
<?php
	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 21/11/2016
	 * Time: 20:01
	 */
	namespace App\Helpers;
	class SQL_Where
	{
		// Compose clause SQL WHERE as:
		// "WHERE condition-1 AND condition-2 ... AND condition-n"
		static function compose($where)
		{
			$sql_where= '';
			foreach ($where as $condition)
			{
				if ($condition !== '')
				{
					if ($sql_where == '')
					{
						// First condition
						$sql_where = ' WHERE ' . $condition;
					}
					else
					{
						// Following conditions
						$sql_where .= ' AND ' . $condition;
					}
				}
			}
			return $sql_where;
		}
	}
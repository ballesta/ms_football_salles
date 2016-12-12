<?php
	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 21/11/2016
	 * Time: 20:01
	 */
	namespace App\Helpers;

	// Compose SQL statements
	class SQL_Where
	{
		// Compose clause SQL WHERE as:
		// Output: "WHERE condition-1 AND condition-2 ... AND condition-n"
		// From given $where conditions array
		static function compose($where)
		{
			// Resulting Where clause
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
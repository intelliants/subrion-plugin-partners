<?php
//##copyright##

class iaPartner extends abstractModuleAdmin
{
	protected static $_table = 'partners';

	protected $_itemName = 'partners';

	public $coreSearchEnabled = true;
	public $coreSearchOptions = [
		'tableAlias' => 'p',
		'regularSearchFields' => ['title', 'description'],
	];


	public function get($where, $start = null, $limit = null)
	{
		$sql = 'SELECT SQL_CALC_FOUND_ROWS p.* '
			. 'FROM `' . self::getTable(true) . '`  p '
			. 'WHERE ' . ($where ? $where . ' AND' : '') . "  p.`status` = 'active' "
			. 'ORDER BY p.`date_modified` DESC '
			. ($start || $limit ? "LIMIT $start, $limit" : '');

		$rows = $this->iaDb->getAll($sql);
		$this->_processValues($rows);

		return $rows;
	}
}
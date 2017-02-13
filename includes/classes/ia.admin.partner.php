<?php
//##copyright##

class iaPartner extends abstractModuleAdmin
{
	protected static $_table = 'partners';
	protected $_itemName = 'partners';

	protected $_activityLog = ['item' => 'partner'];

	protected $_statuses = [iaCore::STATUS_ACTIVE, iaCore::STATUS_INACTIVE];

	public $dashboardStatistics = ['icon' => 'folder', 'url' => 'partners/'];
}
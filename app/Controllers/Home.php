<?php namespace App\Controllers;

use App\Models\TeamsModel;

class Home extends BaseController
{
	protected $teamsModel;
	
	function __construct()
	{
		$this->teamsModel = new TeamsModel();
	}

	public function index($slug = null, $id = null)
	{
		return view('template', array(
			'view' => 'home'
		));
	}
}
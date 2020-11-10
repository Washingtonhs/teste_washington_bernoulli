<?php namespace App\Controllers;

use App\Models\ConfrontationModel;
use App\Models\ScoreModel;

class Confrontation extends BaseController
{
	protected $confrontationModel;
	protected $scoreModel;
	
	function __construct()
	{
		$this->confrontationModel = new ConfrontationModel();
		$this->scoreModel = new ScoreModel();
	}

	public function create()
	{
		if ($data = $this->request->getPost())
		{
			if ($this->confrontationModel->save($data))
			{
				$this->updatePoints($data);

				$response = array(
					'success' => true,
					'message' => 'Operação realizada com sucesso.'
				);
			}
			else
			{
				$response = array(
					'success' => false,
					'message' => 'Falha ao realizar essa operação.'
				);
			}
		}

		return $this->response->setJSON($response);
	}

	public function updatePoints($data = null)
	{
		extract($data);

		$team_visitor = $this->scoreModel
		->where('team', $visitor)
		->first();

		$team_home = $this->scoreModel
		->where('team', $home)
		->first();

		if ($score_visitor == $score_home)
		{
			$this->scoreModel
			->where('team', $visitor)
			->set(['score' => $team_visitor->score + 1])
			->update();

			$this->scoreModel
			->where('team', $home)
			->set(['score' => $team_home->score + 1])
			->update();
		}
		else if ($score_visitor > $score_home)
		{
			$this->scoreModel
			->where('team', $visitor)
			->set(['score' => $team_visitor->score + 3])
			->update();
		}
		else if ($score_visitor < $score_home)
		{

			$this->scoreModel
			->where('team', $home)
			->set(['score' => $team_home->score + 3])
			->update();
		}
	}
	
	public function get($time = null)
	{
		$times = $this->confrontationModel
		->select('home,visitor,score_home,score_visitor,h.name AS home,v.name AS visitor,h.picture AS picture_home,v.picture AS picture_visitor')
		->join('teams as h', 'h.id = confrontations.home')
		->join('teams as v', 'v.id = confrontations.visitor')
		->orderBy('confrontations.created_at', 'desc')
		->where(array('home' => $time))
		->orWhere(array('visitor' => $time))
		->findAll();

		return $this->response->setJSON(
			array(
				'data' => $times
			)
		);
	}
}
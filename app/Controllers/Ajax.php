<?php namespace App\Controllers;

use App\Models\TeamsModel;
use App\Models\ConfrontationModel;

class Ajax extends BaseController
{
	protected $teamsModel;
	protected $confrontationModel;
	
	function __construct()
	{
		$this->teamsModel = new TeamsModel();
		$this->confrontationModel = new ConfrontationModel();
	}

	public function getDataTable()
	{
		$times = $this->teamsModel
		->select('teams.id,teams.name,teams.picture,score_teams.score')
		->join('score_teams', 'score_teams.team = teams.id')
		->findAll();

		$balanceGoals = $this->confrontationModel->balanceGoals();

		foreach ($times as $time)
		{
			$time->GF = $time->GC = $time->SG = $time->victory = $time->equal = $time->defeat = $time->jogos = 0;

			$match = array_filter($balanceGoals, function($v) use($time){
				return $v->id == $time->id;
			});

			if ($match) {
				$time->GF = current($match)->GF;
				$time->GC = current($match)->GC;
				$time->SG = current($match)->SG;
				$time->victory = current($match)->victory;
				$time->equal = current($match)->equal;
				$time->defeat = current($match)->defeat;
				$time->jogos = current($match)->jogos;
			}
		}

		usort($times, array($this, 'cmp'));

		return $this->response->setJSON($times);
	}

	// Compara se $a é maior que $b
	function cmp($a, $b)
	{
		if ($a->score == $b->score)
		{
			if ($a->jogos != $b->jogos)
				return ($a->jogos > $b->jogos) ? -1 : 1;
			else
				if ($a->victory != $b->victory)
					return ($a->victory > $b->victory) ? -1 : 1;
				else
					if ($a->equal != $b->equal)
						return ($a->equal > $b->equal) ? -1 : 1;
					else
						if ($a->defeat != $b->defeat)
							return ($a->defeat < $b->defeat) ? -1 : 1;
						else
							if ($a->GF != $b->GF)
								return ($a->GF > $b->GF) ? -1 : 1;
							else
								if ($a->GC != $b->GC)
									return ($a->GC < $b->GC) ? -1 : 1;
								else
									if ($a->SG != $b->SG)
										return ($a->SG > $b->SG) ? -1 : 1;
									else
										return ($a->name < $b->name) ? -1 : 1;	
		}
		return ($a->score > $b->score) ? -1 : 1;
	}
}
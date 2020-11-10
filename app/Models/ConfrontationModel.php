<?php namespace App\Models;

use CodeIgniter\Model;

class ConfrontationModel extends Model
{
    protected $table = 'confrontations';
    protected $primaryKey = 'id';

    protected $returnType = 'object';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['visitor','home','score_visitor','score_home'];

    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
    protected $deletedField = 'deleted_at';

    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;

    public function  balanceGoals()
    {
        return $this->db->query(
        "SELECT home AS id,
        name as team,
        sum(GF) AS GF,
        sum(GC) AS GC,
        (GF - GC) AS SG,
        count(name) as jogos,
        sum( if ( GF > GC, 1, 0 )) AS victory,
        sum( if ( GF < GC, 1, 0 )) AS defeat,
        sum( if ( GF = GC, 1, 0 )) AS equal
        FROM (
           SELECT home, score_home AS GF, score_visitor AS GC from confrontations
              UNION
           SELECT visitor, score_visitor AS GF, score_home AS GC from confrontations
        ) AS ru
        INNER JOIN teams AS t ON t.id = home
        GROUP BY home
        ORDER BY name"
        )->getResult();
    }
}
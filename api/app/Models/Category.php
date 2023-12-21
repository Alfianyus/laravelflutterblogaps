<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable =[
        'post_id',
        'cat_name',
    ];

    public function post() : BelongsTo
    {
        return $this->belongsTo(Post::class);
    }
}

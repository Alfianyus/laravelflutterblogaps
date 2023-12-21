<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable =[
        'title',
        'body',
        'image'
    ];

    public function admin() : BelongsTo
    {
        return $this->belongsTo(Admin::class);
    }

    public function categories() 
    {
        return $this->hasMany(Category::class, 'post_id');
    }
}

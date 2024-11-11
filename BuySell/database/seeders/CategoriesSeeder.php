<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategoriesSeeder extends Seeder
{
    public function run(): void
    {


        DB::table('categories')->insert([
            'category_name' => "Gardening"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Vehicles"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Music"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Movies and TV"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Electronics"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Books"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Furniture"
        ]);
        DB::table('categories')->insert([
            'category_name' => "Clothing"
        ]);
    }
}

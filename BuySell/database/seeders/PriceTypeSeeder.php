<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PriceTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('price_types')->insert([
            "id_type" => 1,
            "type_name" => "Fixed"
        ]);

        DB::table('price_types')->insert([
            "id_type" => 2,
            "type_name" => "Negotiable"
        ]);
    }
}

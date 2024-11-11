<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ItemStateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('item_states')->insert([
            "id_item_state" => 1,
            "state_name" => "Damaged or defective"
        ]);
        DB::table('item_states')->insert([
            "id_item_state" => 2,
            "state_name" => "Used"
        ]);
        DB::table('item_states')->insert([
            "id_item_state" => 3,
            "state_name" => "Like new (unused)"
        ]);
        DB::table('item_states')->insert([
            "id_item_state" => 4,
            "state_name" => "New"
        ]);
    }
}

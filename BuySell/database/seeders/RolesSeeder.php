<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class RolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('roles')->insert([
            "id_role" => 1,
            "role_name" => "administrator"
        ]);

        DB::table('roles')->insert([
            "id_role" => 2,
            "role_name" => "user"
        ]);
    }
}

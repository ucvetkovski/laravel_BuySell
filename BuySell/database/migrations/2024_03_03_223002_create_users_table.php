<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id('id_user');
            $table->string('name');
            $table->string('surname');
            $table->string('username')->unique();
            $table->string('password');
            $table->string('phone_number')->unique();
            $table->string('email')->unique();
            $table->string('address');
            $table->unsignedBigInteger('id_city');
            $table->unsignedBigInteger('id_role');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrentOnUpdate();


            $table->index('id_city');
            $table->index('id_role');

            $table->foreign('id_city')->references('id_city')->on('cities');
            $table->foreign('id_role')->references('id_role')->on('roles');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};

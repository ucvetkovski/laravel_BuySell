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
        Schema::create('items', function (Blueprint $table) {
            $table->id('id_item');
            $table->string('item_name');
            $table->double('item_price');
            $table->unsignedBigInteger('id_category');
            $table->unsignedBigInteger('price_type');
            $table->unsignedBigInteger('item_state');
            $table->text('item_description');
            $table->unsignedBigInteger('id_user');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->nullable()->useCurrentOnUpdate();

            $table->index('price_type');
            $table->index('item_state');
            $table->index('id_user');
            $table->index('id_category');

            $table->foreign('price_type')->references('id_type')->on('price_types');
            $table->foreign('item_state')->references('id_item_state')->on('item_states');
            $table->foreign('id_user')->references('id_user')->on('users')->onDelete('cascade');
            $table->foreign('id_category')->references('id_category')->on('categories');


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('items');
    }
};

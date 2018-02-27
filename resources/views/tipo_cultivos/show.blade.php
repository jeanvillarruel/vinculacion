@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Tipos de Cultivo
        </h1>
    </section>
    <div class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row" style="padding-left: 20px">
                    @include('tipo_cultivos.show_fields')
                    <a href="{!! route('tipoCultivos.index') !!}" class="btn btn-default">Volver</a>
                </div>
            </div>
        </div>
    </div>
@endsection

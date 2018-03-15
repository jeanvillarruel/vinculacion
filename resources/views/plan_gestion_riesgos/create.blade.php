@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Plan Gestion Riesgos
        </h1>
    </section>
    <div class="content">
        @include('adminlte-templates::common.errors')
        <div class="box box-primary">

            <div class="box-body">
                <div class="row">
                    {!! Form::open(['route' => 'planGestionRiesgos.store']) !!}

                        @include('plan_gestion_riesgos.fields')

                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
<!-- Nombre Field -->
<div class="form-group col-sm-6">
    {!! Form::label('nombre', 'Nombre:') !!}
    {!! Form::text('nombre', null, ['class' => 'form-control']) !!}
</div>

<!-- Tipoproducto Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('TipoProducto_id', 'Tipoproducto Id:') !!}
    {!! Form::select('TipoProducto_id', $tiposproducto, null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{!! route('productos.index') !!}" class="btn btn-default">Cancel</a>
</div>

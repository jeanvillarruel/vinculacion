<table class="table table-responsive" id="propietarios-table">
    <thead>
        <tr>
            <th>CI</th>
        <th>Nombre</th>
        <th>Género</th>
        <th>Correo</th>
        <th>Fecha de Nacimiento</th>
        <th>Teléfono</th>
        <th>Observaciones</th>
            <th colspan="3">Acciones</th>
        </tr>
    </thead>
    <tbody>
    @foreach($propietarios as $propietario)
        <tr>
            <td>{!! $propietario->ci !!}</td>
            <td>{!! $propietario->nombre !!}</td>
            <td>{!! $propietario->genero->nombre!!}</td>
            <td>{!! $propietario->correo !!}</td>
            <td>{!! $propietario->fechaNacimiento !!}</td>
            <td>{!! $propietario->telefono !!}</td>
            <td>{!! $propietario->observaciones !!}</td>
            <td>
                {!! Form::open(['route' => ['propietarios.destroy', $propietario->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    @if(Auth::user()->tipousuario_id===1)
                    <a href="{!! route('propietarios.show', [$propietario->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                    <a href="{!! route('propietarios.edit', [$propietario->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    <a href="{{ route('propietariosHTMLPDF',['descargar'=>'pdf']) }}" class="btn btn-default btn-xs">Descargar PDF</a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    @else
                    <a href="{!! route('propietarios.show', [$propietario->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                    <a href="{!! route('propietarios.edit', [$propietario->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    @endif 
                    
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>

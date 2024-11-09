const clientes = [];
const productos = [];

// Función para agregar un cliente al array y actualizar la tabla de registro
function agregarCliente() {
    const nombre = document.getElementById("nombreCliente").value;
    const fechaRegistro = document.getElementById("fechaCliente").value;
    const correo = document.getElementById("correoCliente").value;
    const telefono = document.getElementById("telefonoCliente").value;

    if (!nombre || !fechaRegistro || !correo || !telefono) {
        alert("Por favor, complete todos los campos del cliente.");
        return;
    }

    const cliente = { 
        tipo: "Cliente", 
        nombre, 
        fecha: fechaRegistro, 
        correo, 
        telefono 
    };
    clientes.push(cliente);
    actualizarRegistro();
    limpiarFormulario("clientes");
}

// Función para agregar un producto al array y actualizar la tabla de registro
function agregarProducto() {
    const nombreProducto = document.getElementById("nombreProducto").value;
    const fechaIngreso = document.getElementById("fechaProducto").value;
    const descripcion = document.getElementById("descripcionProducto").value;

    if (!nombreProducto || !fechaIngreso || !descripcion) {
        alert("Por favor, complete todos los campos del producto.");
        return;
    }

    const producto = { 
        tipo: "Producto", 
        nombre: nombreProducto, 
        fecha: fechaIngreso, 
        descripcion 
    };
    productos.push(producto);
    actualizarRegistro();
    limpiarFormulario("productos");
}

// Función para actualizar la tabla de registro con todos los detalles de clientes y productos
function actualizarRegistro() {
    const tablaRegistro = document.querySelector("#registro tbody");
    tablaRegistro.innerHTML = "";

    const todosRegistros = [...clientes, ...productos];
    todosRegistros.forEach((item, index) => {
        let fila = `<tr>
                        <td>${item.tipo}</td>
                        <td>${item.nombre}</td>
                        <td>${item.fecha}</td>`;
        
        // Agregar las columnas específicas según el tipo de registro
        if (item.tipo === "Cliente") {
            fila += `<td>Correo: ${item.correo}, Teléfono: ${item.telefono}</td>`;
        } else if (item.tipo === "Producto") {
            fila += `<td>${item.descripcion}</td>`;
        }

        fila += `</tr>`;
        tablaRegistro.innerHTML += fila;
    });
}

// Función para limpiar los campos del formulario después de agregar
function limpiarFormulario(tipo) {
    if (tipo === "clientes") {
        document.getElementById("nombreCliente").value = "";
        document.getElementById("fechaCliente").value = "";
        document.getElementById("correoCliente").value = "";
        document.getElementById("telefonoCliente").value = "";
    } else if (tipo === "productos") {
        document.getElementById("nombreProducto").value = "";
        document.getElementById("fechaProducto").value = "";
        document.getElementById("descripcionProducto").value = "";
    }
}

// Agregar eventos a los botones de guardar cliente y producto
document.querySelector("#clientes form").addEventListener("submit", function(event) {
    event.preventDefault();
    agregarCliente();
});

document.querySelector("#productos form").addEventListener("submit", function(event) {
    event.preventDefault();
    agregarProducto();
});


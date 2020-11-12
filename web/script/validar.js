//Validar que en campos de texto se ingrese solo texto ***********************************************************************************
function vtxt(cat) {

    let isValid = false;

    // El input que queremos validar
    const input = cat;

    input.willValidate = false;

    // El tamaño maximo para nuestro input
    const maximo = 34;

    // El pattern que vamos a comprobar
    const pattern = new RegExp('^[a-zA-ZÀ-ÿ\s]+$', 'i');

    //El div con el mensaje de advertencia:
    const message = document.getElementById('message');

    // Primera validacion, si input esta vacio entonces no es valido
    if (!input.value) {
        isValid = false;
    } else {
        // Segunda validacion, si input es mayor que 35
        if (input.value.length > maximo) {
            isValid = false;
        } else {
            // Tercera validacion, si input contiene caracteres diferentes a los permitidos
            if (!pattern.test(input.value)) {
                // Si queremos agregar letras acentuadas y/o letra ñ debemos usar
                // codigos de Unicode (ejemplo: Ñ: \u00D1  ñ: \u00F1)
                isValid = false;
            } else {
                // Si pasamos todas la validaciones anteriores, entonces el input es valido
                isValid = true;
            }
        }
    }

    //Ahora coloreamos el borde de nuestro input
    if (!isValid) {
        // rojo: no es valido
        input.style.borderColor = 'red';
        message.hidden = false;
    } else {
        // verde: si es valido
        input.style.borderColor = 'green';
        message.hidden = true;
    }
}

//Validar un corre electronico ***********************************************************************************
function vemail(mail) {

    const input = mail;

    input.willValidate = false;

    const maximo = 50;

    const messagec = document.getElementById('messagec');

    var reg = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    var regOficial = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
    if (input.value.length > maximo) {
        input.style.borderColor = 'red';
        messagec.hidden = false;
    } else {
        if (reg.test(input.value) && regOficial.test(input.value)) {
            input.style.borderColor = 'green';
            messagec.hidden = true;
        } else if (reg.test(input.value)) {
            input.style.borderColor = 'green';
            messagec.hidden = true;
        } else {
            input.style.borderColor = 'red';
            messagec.hidden = false;
        }
    }
}

//Validar campo telefonico*************************************************************************************

function vtel(tel) {

    let isValid = false;

    const input = tel;

    input.willValidate = false;

    const maximo = 10;

    const pattern = new RegExp('[0-9]', 'i');

    const messaget = document.getElementById('messaget');

    if (!input.value) {
        isValid = false;
    } else {
        if (input.value.length != maximo) {
            isValid = false;
        } else {
            if (!pattern.test(input.value)) {
                isValid = false;
            } else {
                isValid = true;
            }
        }
    }

    if (!isValid) {
        input.style.borderColor = 'red';
        messaget.hidden = false;
    } else {
        input.style.borderColor = 'green';
        messaget.hidden = true;
    }
}

//Verificar formato de contraseña******************************************************************************************

function vpass(pass) {

    let isValid = false;

    const input = pass;

    input.willValidate = false;

    const maximo = 15;
    const minimo = 8;

    regex = /^(?=.*\d)(?=.*[a-záéíóúüñ]).*[A-ZÁÉÍÓÚÜÑ].*[0-9]/;

    const messagepa = document.getElementById('messagepa');

    if (!input.value) {
        isValid = false;
    } else {
        //Verifica el maximo y el minimo de caracteres para establecer una contraseña
        if (input.value.length > maximo && input.value.length > minimo) {
            isValid = false;
        } else {
            if (!regex.test(input.value)) {
                isValid = false;
            } else {
                isValid = true;
            }
        }
    }

    //coloreamos el borde de nuestro input
    if (!isValid) {
        // rojo: no es valido
        input.style.borderColor = 'red';
        messagepa.hidden = false;
    } else {
        // verde: si es valido
        input.style.borderColor = 'green';
        messagepa.hidden = true;
    }
}

//Verificar que las contraseñas coincidan**********************************************************************************

function vpass2(passv) {

    let isValid = false;

    const input = passv;

    input.willValidate = false;

    //Mandamos a llamar al dato de la contraseña que se ingrso previamente 
    const messagepa = document.getElementById('messageppa');
    var pass = document.getElementById('pass');

    if (!input.value) {
        isValid = false;
    } else {
        //Se comparan las contraseñas
        if (input.value != pass) {
            isValid = false;
        } else {
            isValid = true;
        }
    }

    if (!isValid) {
        // rojo: no es valido
        input.style.borderColor = 'red';
        messageppa.hidden = false;
    } else {
        // verde: si es valido
        input.style.borderColor = 'green';
        messageppa.hidden = true;
    }
}

//##############################Modificar Empleado########################################################################

function newpass() {

    //Mandamos a llamar al dato de la contraseña que se ingrso previamente 
    const messagecn = document.getElementById('messagecan');
    const messageccn = document.getElementById('messageccan');


    if (document.getElementById('si').checked===true) {
        messagecn.hidden = true;
        messageccn.hidden = true;
    } 
    if (document.getElementsById('no').checked===true) {
        messagecn.hidden = false;
        messageccn.hidden = false;
    }
}












using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Biblioteca
{
    public partial class Homepage : Form
    {


        private static Homepage instancia = null; //Inicialización del formulario estático

        //Método para obtener solamente un formulario abierto de tipo "Homepage"
        public static Homepage ventanaUnica()
        {
            //Evaluar 
            if (instancia == null)
            {
                //Crear uno nuevo
                instancia = new Homepage();
                return instancia;
            }
            //Regresar si ya estaba creado
            return instancia;
        }


        //Constructor
        public Homepage()
        {
            InitializeComponent();
        }


        //Eventos
        private void Homepage_FormClosing(object sender, FormClosingEventArgs e)
        {
            instancia = null; // Al cerrar el formulario se reinicia la instancia
            Application.Exit();
        }
    }
}

using Biblioteca.Base_de_Datos;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Biblioteca
{
    public partial class Login : Form
    {
        // Variables
        SqlCommand Comando;
        string query = "";
        int usuarioID = 0;


        public Login()
        {
            InitializeComponent();
        }

        private void btn_Entrar_Click(object sender, EventArgs e)
        {
            // Validar campos vacios
            if (txbContraseña.Text != "" && txbUsuario.Text != "")
            {
                //Comprobar datos
                if (ValidarLogin(txbUsuario.Text, txbContraseña.Text)) //CORRECTO
                {
                    txbContraseña.Text = ""; txbUsuario.Text = "";

                    //Redireccionamiento
                    Homepage formulario = Homepage.ventanaUnica(); //Validar objeto
                    Program.loginEstatico.Hide();
                    formulario.Show();
                }
                else { MessageBox.Show("Nombre de usuario o contraseña incorrectos."); } //INCORRECTO
            }
            else { MessageBox.Show("Se requiere llenar los campos"); }
        }


        // Función que intenta encontrar al usuario y contraseña en los registros
        private bool ValidarLogin(string username, string password)
        {
            // Emplear la conexión de la base de datos
            using (SqlConnection con = BD_Conexión.GetConnection())
            {
                // Definir la consulta
                query = "SELECT COUNT(*) FROM Usuarios WHERE nombre = @Username COLLATE Latin1_General_BIN AND contraseña = @Password COLLATE Latin1_General_BIN";
                Comando = new SqlCommand(query, con);
                Comando.Parameters.AddWithValue("@Username", username);
                Comando.Parameters.AddWithValue("@Password", password);

                // Realiza la consulta y devuelve el nÚmero de coincidencias(fila encontrada)
                int userCount = (int)Comando.ExecuteScalar();
                usuarioID = Convert.ToInt32(userCount);

                return userCount > 0; //Retornar el resultado de la comparación
            }
        }

    
        private void label3_Click_1(object sender, EventArgs e)
        {

        }

        private void txbUsuario_TextChanged(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
           
        }

        private void linkLabel1_Click(object sender, EventArgs e)
        {
            this.Hide(); // Oculta el Login
            Registrarte registro = new Registrarte();
            registro.Show();
        }
    }
}

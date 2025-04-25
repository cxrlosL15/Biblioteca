using Biblioteca.Base_de_Datos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Biblioteca
{
    public partial class Registrarte : Form
    {
        public Registrarte()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void Registrarte_Load(object sender, EventArgs e)
        {
            
        }

        private void Btn_Registrar_Click(object sender, EventArgs e)
        {
            // Obliga al usuario a ingresar un nombre de usuario,Apellido Paterno,Apellido Materno y Contraseña
            string nombre = txt_NombreUsuario.Text.Trim();
            string apellidoP = txt_ApellidoPaterno.Text.Trim();
            string apellidoM = txt_ApellidoMaterno.Text.Trim();
            string contraseña = txt_Contraseña.Text.Trim();
            string correo = txt_Correo.Text.Trim();
            int id_rol = 1;  // Puedes ponerlo fijo si es un rol predeterminado, o seleccionarlo desde un comboBox


            string Conexion = "server=MSI ; Initial Catalog = BibliotecaRinconDelLibro; integrated security=true; TrustServerCertificate=True;";

            using (SqlConnection conexion = new SqlConnection(Conexion))
            {
                try
                {
                    conexion.Open();
                    string query = "INSERT INTO Usuarios (id_rol,nombre, apellidoP, apellidoM, correo, contraseña) VALUES (@id_rol,@nombre, @apellidoP, @apellidoM,@correo, @contraseña)";
                    using (SqlCommand comando = new SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@id_rol", id_rol);
                        comando.Parameters.AddWithValue("@nombre", nombre);
                        comando.Parameters.AddWithValue("@apellidoP", apellidoP);
                        comando.Parameters.AddWithValue("@apellidoM", apellidoM);
                        comando.Parameters.AddWithValue("@correo", correo);
                        comando.Parameters.AddWithValue("@Contraseña", contraseña);

                        int resultado = comando.ExecuteNonQuery();

                        if (resultado > 0)
                        {
                            MessageBox.Show("Usuario registrado correctamente.");
                            // Ir al formulario de Login
                            this.Close(); // Cierra el formulario actual
                            Login login = new Login();
                            login.Show();
                        }
                        else
                        {
                            MessageBox.Show("No se pudo registrar el usuario.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al registrar: " + ex.Message);
                }
            }
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}

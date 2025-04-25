using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca.Base_de_Datos
{
    internal class BD_Conexión
    {
        private static string Conexion = "server=MSI ; Initial Catalog = BibliotecaRinconDelLibro; integrated security=true; TrustServerCertificate=True;";

        public static SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(Conexion);

            //Valida el estado de la conexion
            if (con.State != System.Data.ConnectionState.Open)
            { con.Open(); }

            return con;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Task.Models;

namespace Task.Service
{
    public class CompanyService
    {

        SqlConnection cn;
        public CompanyService()
        {
            cn = new SqlConnection(@"Data Source=DESKTOP-ERKGNQF\MSSQLSERVER01;Initial Catalog=task;Integrated Security=True");
        }
        public List<Employee> GetEmployees()
        {
            
            SqlDataAdapter da = new SqlDataAdapter("GetEmployeeList 0,0", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            List<Employee> li = new List<Employee>();
            foreach (DataRow item in dt.Rows)
            {
                li.Add(new Employee
                {
                    Name = item["Name"].ToString(),
                    Email = item["Email"].ToString(),
                    Phone_No = Convert.ToInt64(item["Phone_No"].ToString()),
                    Address = item["Address"].ToString(),
                    state_id = Convert.ToInt32(item["state_id"].ToString()),
                    Emp_id = Convert.ToInt32(item["Emp_id"].ToString()),
                    city_id = Convert.ToInt32(item["city_id"].ToString())

                });
            }
            return li;
        }
        public Employee GetEmployeesbyid(int id)
        {
            
            SqlDataAdapter da = new SqlDataAdapter($"GetEmployeeList {id},1", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Employee obj = new Employee();

            if (dt.Rows.Count>0)
            {   
                obj.Name = dt.Rows[0]["Name"].ToString();
                obj.Email = dt.Rows[0]["Email"].ToString();
                obj.Phone_No = Convert.ToInt64(dt.Rows[0]["Phone_No"].ToString());
                obj.Emp_id = Convert.ToInt32(dt.Rows[0]["Emp_id"].ToString());
                obj.Address = dt.Rows[0]["Address"].ToString();
                obj.state_id = Convert.ToInt32(dt.Rows[0]["state_id"].ToString());
                obj.city_id = Convert.ToInt32(dt.Rows[0]["city_id"].ToString());
            }
            return obj;
        }

        public void RegisterEmployee(Employee obj)
        {
            

            SqlCommand cmd = new SqlCommand("exec Addemployee @n,@em,@pn,@ad,@st,@ci", cn);
            cmd.Parameters.AddWithValue("@n", obj.Name);
            cmd.Parameters.AddWithValue("@em", obj.Email);
            cmd.Parameters.AddWithValue("@pn", obj.Phone_No);
            cmd.Parameters.AddWithValue("@ad", obj.Address);
            cmd.Parameters.AddWithValue("@st", obj.state_id);
            cmd.Parameters.AddWithValue("@ci", obj.city_id);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

        }
        public void UpdateEmployee(Employee obj)
        {
            
            SqlCommand cmd = new SqlCommand("exec Editemployee @n,@em,@pn,@ad,@st,@ci,@id", cn);
            cmd.Parameters.AddWithValue("@n", obj.Name);
            cmd.Parameters.AddWithValue("@em", obj.Email);
            cmd.Parameters.AddWithValue("@pn", obj.Phone_No);
            cmd.Parameters.AddWithValue("@id", obj.Emp_id);
            cmd.Parameters.AddWithValue("@ad", obj.Address);
            cmd.Parameters.AddWithValue("@st", obj.state_id);
            cmd.Parameters.AddWithValue("@ci", obj.city_id);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

        }
        public void DeleteEmployee(int id)
        {
            
            SqlCommand cmd = new SqlCommand("exec DeleteEmployee @id", cn);
            cmd.Parameters.AddWithValue("@id", id);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

        }
    }
}
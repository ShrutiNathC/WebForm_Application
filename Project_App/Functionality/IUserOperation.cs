using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Project_App.Models;

namespace Project_App.Functionality
{
    internal interface IUserOperation
    {
        int createAccount(Users users);
        int Login(string Name, string Password);
        int EditAccount(Users users);
        int DeleteAccount(int Id);
        List<Users> GetUsers();
    }
}

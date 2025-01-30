using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_App.Functionality;
using Project_App.Models;

namespace Project_App.Service
{
    public class UserOperation : IUserOperation
    {
        UserContext userContext;
        public UserOperation()
        {
            userContext = new UserContext();
        }
        int IUserOperation.createAccount(Users users)
        {
            userContext.Users.Add(users);
            return userContext.SaveChanges();
        }

        int IUserOperation.DeleteAccount(int Id)
        {
            var del = userContext.Users.Find(Id);
            userContext.Users.Remove(del);
            return userContext.SaveChanges();
        }

        int IUserOperation.EditAccount(Users users)
        {
            userContext.Users.Update(users);
            return userContext.SaveChanges();
        }

        List<Users> IUserOperation.GetUsers()
        {
            var all = userContext.Users.ToList();
            foreach (var a in all)
            {
                Console.WriteLine($"ID:{a.Id}, Name:{a.Name}, Email:{a.Email}, Password:{a.Password}");
            }
            return all;
        }

        int IUserOperation.Login(string Name, string Password)
        {
            var res = userContext.Users.Where(x => x.Name == Name && x.Password == Password).FirstOrDefault();
            if (res == null)
            {
                return 0;
            }
            return 1;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using RemontApp.DB;

namespace RemontApp.UI
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void BtnEnter_Click(object sender, RoutedEventArgs e)
        {
            string login = TxtBoxLogin.Text;
            string password = UCPassword.GetPassword();
            string error = "";
            if(login != null && login != "" && login != " ")
            {
                if (password != null && login != "" && login != " ")
                {
                    try
                    {
                        if (RemontPracticeEntities.GetContext().Users.Any(x => x.Login == login && x.Password == password))
                        {
                            if (RemontPracticeEntities.GetContext().Users.Any(x => x.Login == login && x.Password == password && x.RoleId == 1))
                            {
                                MainWindowMenager mainWindowMenager = new MainWindowMenager();
                                mainWindowMenager.Show();
                                this.Close();
                            }
                            if (RemontPracticeEntities.GetContext().Users.Any(x => x.Login == login && x.Password == password && x.RoleId == 2))
                            {
                                MainWindowExecutor mainWindowExecutor = new MainWindowExecutor();
                                mainWindowExecutor.Show();
                                this.Close();
                            }
                        }
                        else
                        {
                            error += "Пользователь не найден";
                        }
                    }
                    catch(Exception ex)
                    {
                        error += ex.Message;
                    }
                    
                }
                else
                {
                    error += "Введите пароль";
                }
                
            }
            else
            {
                error += "Введите логин";
            }
            if (error != "")
            {
                MessageBox.Show(error, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Information);
            }
        }
    }
}

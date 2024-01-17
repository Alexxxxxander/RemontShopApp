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

namespace RemontApp.UI.UserControl
{
    /// <summary>
    /// Логика взаимодействия для UserControlPasswordBox.xaml
    /// </summary>
    public partial class UserControlPasswordBox : System.Windows.Controls.UserControl
    {
        string password;

        public string GetPassword()
        {
            return password;
        }
        public UserControlPasswordBox()
        {
            InitializeComponent();
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
            TxtBox.Visibility = Visibility.Visible;
            PswBox.Visibility = Visibility.Hidden;
            TxtBox.Text = password;
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            TxtBox.Visibility = Visibility.Hidden;
            PswBox.Visibility = Visibility.Visible;
            PswBox.Password = password;
        }

        private void TxtBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            password = TxtBox.Text;
        }

        private void PswBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            password = PswBox.Password;
        }
    }
}

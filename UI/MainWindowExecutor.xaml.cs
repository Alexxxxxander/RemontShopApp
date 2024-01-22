using RemontApp.DB;
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
using System.Windows.Shapes;

namespace RemontApp.UI
{
    /// <summary>
    /// Логика взаимодействия для ExecutorWindow.xaml
    /// </summary>
    public partial class MainWindowExecutor : Window
    {
        public MainWindowExecutor()
        {
            InitializeComponent();
            LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void TxtBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (TxtBoxSearch.Text.Length > 0)
            {
                LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList().Where(x => x.Appliance.Contains(TxtBoxSearch.Text)).ToList();
            }
            else
            {
                LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToList();
            }

        }
    }
}

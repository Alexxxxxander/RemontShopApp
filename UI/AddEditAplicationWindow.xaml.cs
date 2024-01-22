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
    /// Логика взаимодействия для AddAplicationWindow.xaml
    /// </summary>
    public partial class AddAplicationWindow : Window
    {
        private DB.Application _currentApplication = new DB.Application();
        public AddAplicationWindow(DB.Application currentApplication)
        {
            InitializeComponent();
            try
            {
                DataContext = RemontPracticeEntities.GetContext().Applications;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            if (currentApplication != null)
            {
                _currentApplication = currentApplication;
            }
            DataContext = _currentApplication;         
            CmbBoxClient.ItemsSource = RemontPracticeEntities.GetContext().Clients.Select(x => x.Phone).ToList();
            CmbBoxExecutor.ItemsSource = RemontPracticeEntities.GetContext().Employees.ToList().Select(x => x.Surname).ToList();
            CmbBoxProblem.ItemsSource = RemontPracticeEntities.GetContext().ProblemTypes.ToList().Select(x =>x.Name).ToList();
            CmbBoxStatus.ItemsSource = RemontPracticeEntities.GetContext().StatusApplications.Select(x => x.Name).ToList();
            if(_currentApplication.Id > 0)
            {
                CmbBoxClient.SelectedIndex = currentApplication.ClientId - 1;
                if(currentApplication.EmployeeId >0 )
                {
                    CmbBoxExecutor.SelectedIndex = (int)(currentApplication.EmployeeId - 1);
                }
                CmbBoxProblem.SelectedIndex = currentApplication.ProblemTypeId - 1;
                if(currentApplication.StatusId > 0)
                {
                    CmbBoxStatus.SelectedIndex = (int)(currentApplication.StatusId - 1);
                }

            }
            else
            {
                DatePickTxtBox.Text = DateTime.Now.ToString();
                CmbBoxStatus.SelectedIndex = 0;
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (DatePickTxtBox.Text == null || DatePickTxtBox.Text.Length < 1)
            {
                errors.AppendLine("Дата заполнена неверно");
            }
            if (TxtBoxAppliance.Text.Length < 1)
            {
                errors.AppendLine("Укажите устройство");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            else
            {
                
                _currentApplication.ClientId = Convert.ToInt32(RemontPracticeEntities.GetContext().Clients.Where(x => x.Phone.Contains(CmbBoxClient.SelectedValue.ToString())).Select(x => x.Id).FirstOrDefault());
                if (_currentApplication.Id == 0)
                {
                    
                    RemontPracticeEntities.GetContext().Applications.Add(_currentApplication);
                }
                try
                {
                    RemontPracticeEntities.GetContext().SaveChanges();
                    MessageBox.Show("Информация сохранена");
                }
                catch(Exception ex) {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}

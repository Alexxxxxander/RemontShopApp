﻿using System;
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
using RemontApp.DB;

namespace RemontApp.UI
{
    /// <summary>
    /// Логика взаимодействия для MainWindowMenager.xaml
    /// </summary>
    public partial class MainWindowMenager : Window
    {
        public MainWindowMenager()
        {
            InitializeComponent();

            LBoxApplications.ItemsSource = RemontPracticeEntities.GetContext().Applications.ToArray();
        }

        private void LBoxApplications_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void BtnStatistic_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnQRCode_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BtnDeleteApplication_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

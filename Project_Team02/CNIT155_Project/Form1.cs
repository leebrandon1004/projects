using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace CNIT155_Project
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        //Class Scope Declarations
        private const int cSize = 100;
        private string[] mTeam = new string[cSize];
        private string[] mQuestions = new string[cSize];
        private double[] mAnswers = new double[cSize];
        private string[] mResult = new string[cSize];
        private string[] mName = new string[cSize];
        private int mIndex = 0;
        private int mCNIT = 0;
        private int mCyber = 0;
        private int mSAAD = 0;
        private int mNET = 0;
        Random rnum = new Random();
        private string mFileName = Path.Combine(Application.StartupPath, "Teams.txt");
        private double Answer;

        //Helper Method
        //DisplayMessageOK
        private void DisplayMessageOK(string message)
        {
            MessageBox.Show(message, Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        //ValidateInput()
        private bool ValidateInput()
        {
            if (cboTeam.SelectedIndex == -1)
            {
                DisplayMessageOK("Please select a team");
                return false;
            }

            if (txtName.Text == "") 
            {
                DisplayMessageOK("Please enter your name.");
                txtName.Focus();
                return false;
            }

            if (radUsersinput.Checked == false && radRandom.Checked == false)
            {
                DisplayMessageOK("One of the chocies must be selected.");
                return false;
            }

            if (cboLevels.SelectedIndex == -1)
            {
                DisplayMessageOK("One of the levels must be selected");
                return false;
            }

            if (radUsersinput.Checked == true)
            {
                double N1;
                double N2;
                double N3;

                if (double.TryParse(txtN1.Text, out N1)== false)
                {
                    DisplayMessageOK("The number has to be a real number.");
                    txtN1.Focus();
                    return false;
                }
                if (double.TryParse(txtN2.Text, out N2) == false)
                {
                    DisplayMessageOK("The number has to be a real number.");
                    txtN2.Focus();
                    return false;
                }
                if (double.TryParse(txtN3.Text, out N3) == false)
                {
                    DisplayMessageOK("The number has to be a real number.");
                    txtN2.Focus();
                    return false;
                }

                if (txtN1.Text == "" && txtN2.Text == "" && txtN3.Text == "")
                {
                    DisplayMessageOK("Please enter your numbers.");
                    txtN1.Focus();
                    return false;
                }

            }

            return true;
        }
        //ClearInput
        private void ClearInput()
        {
            cboTeam.SelectedIndex = -1;
            txtN1.Clear();
            txtN2.Clear();
            txtN3.Clear();
            txtName.Clear();
            cboLevels.SelectedIndex = -1;
            radUsersinput.Checked = false;
            radRandom.Checked = false;
            lstShow.Items.Clear();
            txtAnswer.Clear();
        }

        private void btnAnswer_Click(object sender, EventArgs e)
        {
            if (ValidateInput() == false)
                return;
           

            if (cboTeam.Text == "CNIT")
            {
                mTeam[mIndex] = "CNIT";
            }
            else if (cboTeam.Text == "Cybersecurity")
            {
                mTeam[mIndex] = "Cybersecurity";
            }
            else if (cboTeam.Text == "SAAD")
            {
                mTeam[mIndex] = "SAAD";
            }
            else
            {
                mTeam[mIndex] = "NET";
            }

            mName[mIndex] = txtName.Text;

            lstShow.Items.Clear();

            if (radRandom.Checked==true)
            {
                if (cboLevels.Text == "Addition & Subtraction") 
                {
                    int number1;
                    int number2;
                    int number3;
                    number1 = rnum.Next(1,100);
                    number2 = rnum.Next(1, 100);
                    number3 = rnum.Next(1, 100);

                    lstShow.Items.Add(number1 + " + " + number2 + " - " + number3+" = ?");
                    mQuestions[mIndex] = number1 + " + " + number2 + " - " + number3;

                    Answer = number1 + number2 - number3;
                    mAnswers[mIndex] = Answer;
                }
                else
                {
                    int number1;
                    int number2;
                    int number3;
                    number1 = rnum.Next(1, 30);
                    number2 = rnum.Next(1, 30);
                    number3 = rnum.Next(1, 30);

                    lstShow.Items.Add(number1 + " x " + number2 + " / " + number3 + " = ?");
                    mQuestions[mIndex] = number1 + " x " + number2 + " / " + number3;

                    Answer = number1 * number2 / number3;
                    mAnswers[mIndex] = Answer;
                }
            }
            else
            {
                double N1 = double.Parse(txtN1.Text);
                double N2 = double.Parse(txtN2.Text);
                double N3 = double.Parse(txtN3.Text);

                if (cboLevels.Text == "Addition & Subtraction")
                {
                    lstShow.Items.Add(N1 + " + " + N2 + " - " + N3 + " = ?");
                    mQuestions[mIndex] = N1 + " + " + N2 + " - " + N3;

                    Answer = N1 + N2 - N3;
                    mAnswers[mIndex] = Answer;
                }
                else
                {
                    lstShow.Items.Add(N1 + " x " + N2 + " / " + N3 + " = ?");
                    mQuestions[mIndex] = N1 + " + " + N2 + " - " + N3;

                    Answer = N1 * N2 / N3;
                    mAnswers[mIndex] = Answer;
                }
            }
            
        }

        private void btnEnter_Click(object sender, EventArgs e)
        {
            if (txtAnswer.Text=="")
            {
                DisplayMessageOK("Please enter your answer.");
                txtAnswer.Focus();
                return;
            }

            if (cboLevels.Text=="Addition & Subtraction")
            {
                if (Answer.ToString()==txtAnswer.Text)
                {
                    DisplayMessageOK("You are correct! Your team earned 10 points.");
                    mResult[mIndex] = "Right";

                    if (cboTeam.Text == "CNIT")
                    {
                        mCNIT += 10;
                    }
                    else if (cboTeam.Text == "Cybersecurity")
                    {
                        mCyber += 10;
                    }
                    else if (cboTeam.Text == "SAAD")
                    {
                        mSAAD += 10;
                    }
                    else 
                    {
                        mNET += 10;
                    }
                }
                else
                {
                    DisplayMessageOK("You are wrong! Your team lost 5 points.");
                    mResult[mIndex] = "Wrong";

                    if (cboTeam.Text == "CNIT")
                    {
                        mCNIT -= 5;
                    }
                    else if (cboTeam.Text == "Cybersecurity")
                    {
                        mCyber -= 5;
                    }
                    else if (cboTeam.Text == "SAAD")
                    {
                        mSAAD -= 5;
                    }
                    else
                    {
                        mNET -= 5;
                    }
                }
            }
            else
            {
                if (Answer.ToString("N0") == txtAnswer.Text)
                {
                    DisplayMessageOK("You are correct! Your team earned 10 points.");
                    mResult[mIndex] = "Right";

                    if (cboTeam.Text == "CNIT")
                    {
                        mCNIT += 10;
                    }
                    else if (cboTeam.Text == "Cybersecurity")
                    {
                        mCyber += 10;
                    }
                    else if (cboTeam.Text == "SAAD")
                    {
                        mSAAD += 10;
                    }
                    else
                    {
                        mNET += 10;
                    }
                }
                else
                {
                    DisplayMessageOK("You are wrong! Your team lost 5 points.");
                    mResult[mIndex] = "Wrong";

                    if (cboTeam.Text == "CNIT")
                    {
                        mCNIT -= 5;
                    }
                    else if (cboTeam.Text == "Cybersecurity")
                    {
                        mCyber -= 5;
                    }
                    else if (cboTeam.Text == "SAAD")
                    {
                        mSAAD -= 5;
                    }
                    else
                    {
                        mNET -= 5;
                    }
                }
            }

            ClearInput();
            mIndex++;

        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            ClearInput();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (mIndex==0)
            {
                DisplayMessageOK("There are no games played yet.");
                return;
            }

            lstShow.Items.Clear();

            lstShow.Items.Add("Question".PadRight(15) + "Answer".PadRight(10) + "Team".PadRight(15) + "Solved by".PadRight(15) + "Result");
            lstShow.Items.Add("==========================================================");

            int ctr;
            for (ctr = 0; ctr < mIndex; ctr++)
            {
                lstShow.Items.Add(mQuestions[ctr].PadRight(15) + mAnswers[ctr].ToString().PadRight(10)+
                    mTeam[ctr].PadRight(15)+mName[ctr].PadRight(15)+mResult[ctr]);
            }

        }

        private void btnStats_Click(object sender, EventArgs e)
        {
            if (mIndex == 0)
            {
                DisplayMessageOK("There are no games played yet.");
                return;
            }

            lstShow.Items.Clear();

            lstShow.Items.Add("Team".PadRight(15) + "Score");
            lstShow.Items.Add("=================================================================");
            lstShow.Items.Add("CNIT".PadRight(15) + mCNIT);
            lstShow.Items.Add("Cybersecurity".PadRight(15) + mCyber);
            lstShow.Items.Add("SAAD".PadRight(15) + mSAAD);
            lstShow.Items.Add("NET".PadRight(15) + mNET);
        }

        private void btnSort_Click(object sender, EventArgs e)
        {

            lstShow.Items.Clear();

            lstShow.Items.Add("Team".PadRight(15) + "Score");
            lstShow.Items.Add("=================================================================");

            int[] TeamAnswer = new int[4] { mCNIT, mCyber, mSAAD, mNET };
            Array.Reverse(TeamAnswer);

            int ctr;
            for (ctr = 0; ctr < mIndex; ctr++)
            {
                lstShow.Items.Add(mTeam[ctr].PadRight(15) + TeamAnswer[ctr]);
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            if (mIndex == 0)
            {
                DisplayMessageOK("Array is empty.");
                return;
            }

            int ctr;
            string name = txtSearch.Text;
            bool found = false;

            lstShow.Items.Clear();

            for (ctr = 0; ctr < mIndex; ctr++)
            {
                if (name.ToUpper() == mName[ctr].ToUpper())
                {
                    found = true;
                    DisplayMessageOK("The name was found");
                    lstShow.Items.Add(name+"'s" + " stat");
                    lstShow.Items.Add("Question".PadRight(15) + "Answer".PadRight(10) + "Team".PadRight(15) + "Result");
                    lstShow.Items.Add("==========================================================");
                }
                if (found==true)
                    lstShow.Items.Add(mQuestions[ctr].PadRight(15) + mAnswers[ctr].ToString().PadRight(15) + mTeam[ctr].PadRight(15) + mResult[ctr]);
            }

            if (found == false)
            {
                DisplayMessageOK("Search for Name failed.");
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            StreamReader SR = null;

            string line;
            string[] parts;

            if (File.Exists(mFileName) == false)
            {
                DisplayMessageOK("No such file");
                return;
            }

            SR = new StreamReader(mFileName);

            while (SR.Peek() != -1)
            {
                line = SR.ReadLine();
                parts = line.Split('\t');
                mTeam[mIndex] = parts[0];
                mIndex++;
            }
            SR.Close();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {

            if (MessageBox.Show("Are you sure?", Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
            {
                e.Cancel = true;
                return;
            }

            StreamWriter writer = new StreamWriter(mFileName);

            int ctr = 0;

            for (ctr = 0; ctr < mIndex; ctr++)
            {
                writer.WriteLine("CNIT" + "\t" + mCNIT);
                writer.WriteLine("Cybersecurity" + "\t" + mCyber);
                writer.WriteLine("SAAD" + "\t" + mSAAD);
                writer.WriteLine("NET" + "\t" + mNET);
            }

            writer.Close();
        }

    }
}

namespace CNIT155_Project
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblUsername = new System.Windows.Forms.Label();
            this.lstShow = new System.Windows.Forms.ListBox();
            this.btnStats = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.groupBox_range = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.radRandom = new System.Windows.Forms.RadioButton();
            this.radUsersinput = new System.Windows.Forms.RadioButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtN1 = new System.Windows.Forms.TextBox();
            this.txtN2 = new System.Windows.Forms.TextBox();
            this.txtN3 = new System.Windows.Forms.TextBox();
            this.cboLevels = new System.Windows.Forms.ComboBox();
            this.lblLevel = new System.Windows.Forms.Label();
            this.btnQuestion = new System.Windows.Forms.Button();
            this.btnSort = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtAnswer = new System.Windows.Forms.TextBox();
            this.lblAnswer = new System.Windows.Forms.Label();
            this.btnEnter = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.cboTeam = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.txtName = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.groupBox_range.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblUsername
            // 
            this.lblUsername.AutoSize = true;
            this.lblUsername.Font = new System.Drawing.Font("Consolas", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsername.Location = new System.Drawing.Point(252, 128);
            this.lblUsername.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(95, 36);
            this.lblUsername.TabIndex = 0;
            this.lblUsername.Text = "Team:";
            // 
            // lstShow
            // 
            this.lstShow.Font = new System.Drawing.Font("Consolas", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lstShow.FormattingEnabled = true;
            this.lstShow.ItemHeight = 36;
            this.lstShow.Location = new System.Drawing.Point(44, 428);
            this.lstShow.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.lstShow.Name = "lstShow";
            this.lstShow.Size = new System.Drawing.Size(1181, 256);
            this.lstShow.TabIndex = 5;
            // 
            // btnStats
            // 
            this.btnStats.Location = new System.Drawing.Point(1247, 652);
            this.btnStats.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnStats.Name = "btnStats";
            this.btnStats.Size = new System.Drawing.Size(252, 58);
            this.btnStats.TabIndex = 7;
            this.btnStats.Text = "Stats";
            this.btnStats.UseVisualStyleBackColor = true;
            this.btnStats.Click += new System.EventHandler(this.btnStats_Click);
            // 
            // btnClear
            // 
            this.btnClear.Location = new System.Drawing.Point(1939, 710);
            this.btnClear.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(226, 66);
            this.btnClear.TabIndex = 8;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = true;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(1935, 788);
            this.btnExit.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(230, 66);
            this.btnExit.TabIndex = 9;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // groupBox_range
            // 
            this.groupBox_range.Controls.Add(this.label3);
            this.groupBox_range.Controls.Add(this.label2);
            this.groupBox_range.Controls.Add(this.radRandom);
            this.groupBox_range.Controls.Add(this.radUsersinput);
            this.groupBox_range.Controls.Add(this.groupBox1);
            this.groupBox_range.Location = new System.Drawing.Point(1309, 100);
            this.groupBox_range.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.groupBox_range.Name = "groupBox_range";
            this.groupBox_range.Padding = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.groupBox_range.Size = new System.Drawing.Size(856, 451);
            this.groupBox_range.TabIndex = 10;
            this.groupBox_range.TabStop = false;
            this.groupBox_range.Text = "Choices";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(76, 134);
            this.label3.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(493, 32);
            this.label3.TabIndex = 16;
            this.label3.Text = "Range for Multiplication & Division 1-30";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(74, 101);
            this.label2.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(490, 32);
            this.label2.TabIndex = 15;
            this.label2.Text = "Range for Addition & Subtraction 1-100";
            // 
            // radRandom
            // 
            this.radRandom.AutoSize = true;
            this.radRandom.Location = new System.Drawing.Point(42, 54);
            this.radRandom.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.radRandom.Name = "radRandom";
            this.radRandom.Size = new System.Drawing.Size(329, 36);
            this.radRandom.TabIndex = 1;
            this.radRandom.TabStop = true;
            this.radRandom.Text = "With random numbers";
            this.radRandom.UseVisualStyleBackColor = true;
            // 
            // radUsersinput
            // 
            this.radUsersinput.AutoSize = true;
            this.radUsersinput.Location = new System.Drawing.Point(42, 186);
            this.radUsersinput.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.radUsersinput.Name = "radUsersinput";
            this.radUsersinput.Size = new System.Drawing.Size(270, 36);
            this.radUsersinput.TabIndex = 0;
            this.radUsersinput.TabStop = true;
            this.radUsersinput.Text = "With my numbers";
            this.radUsersinput.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtN1);
            this.groupBox1.Controls.Add(this.txtN2);
            this.groupBox1.Controls.Add(this.txtN3);
            this.groupBox1.Location = new System.Drawing.Point(42, 236);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.groupBox1.Size = new System.Drawing.Size(766, 172);
            this.groupBox1.TabIndex = 14;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Choose Numbers";
            // 
            // txtN1
            // 
            this.txtN1.Location = new System.Drawing.Point(40, 68);
            this.txtN1.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.txtN1.Name = "txtN1";
            this.txtN1.Size = new System.Drawing.Size(194, 38);
            this.txtN1.TabIndex = 15;
            // 
            // txtN2
            // 
            this.txtN2.Location = new System.Drawing.Point(250, 68);
            this.txtN2.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.txtN2.Name = "txtN2";
            this.txtN2.Size = new System.Drawing.Size(204, 38);
            this.txtN2.TabIndex = 14;
            // 
            // txtN3
            // 
            this.txtN3.Location = new System.Drawing.Point(470, 68);
            this.txtN3.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.txtN3.Name = "txtN3";
            this.txtN3.Size = new System.Drawing.Size(202, 38);
            this.txtN3.TabIndex = 13;
            // 
            // cboLevels
            // 
            this.cboLevels.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboLevels.FormattingEnabled = true;
            this.cboLevels.Items.AddRange(new object[] {
            "Addition & Subtraction",
            "Multiplication & Division"});
            this.cboLevels.Location = new System.Drawing.Point(396, 252);
            this.cboLevels.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.cboLevels.Name = "cboLevels";
            this.cboLevels.Size = new System.Drawing.Size(462, 39);
            this.cboLevels.TabIndex = 11;
            // 
            // lblLevel
            // 
            this.lblLevel.AutoSize = true;
            this.lblLevel.Font = new System.Drawing.Font("Consolas", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLevel.Location = new System.Drawing.Point(250, 256);
            this.lblLevel.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.lblLevel.Name = "lblLevel";
            this.lblLevel.Size = new System.Drawing.Size(127, 36);
            this.lblLevel.TabIndex = 12;
            this.lblLevel.Text = "Levels:";
            // 
            // btnQuestion
            // 
            this.btnQuestion.Location = new System.Drawing.Point(598, 333);
            this.btnQuestion.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnQuestion.Name = "btnQuestion";
            this.btnQuestion.Size = new System.Drawing.Size(264, 70);
            this.btnQuestion.TabIndex = 15;
            this.btnQuestion.Text = "Display question";
            this.btnQuestion.UseVisualStyleBackColor = true;
            this.btnQuestion.Click += new System.EventHandler(this.btnAnswer_Click);
            // 
            // btnSort
            // 
            this.btnSort.Location = new System.Drawing.Point(1247, 716);
            this.btnSort.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnSort.Name = "btnSort";
            this.btnSort.Size = new System.Drawing.Size(252, 62);
            this.btnSort.TabIndex = 16;
            this.btnSort.Text = "Sort Rank";
            this.btnSort.UseVisualStyleBackColor = true;
            this.btnSort.Click += new System.EventHandler(this.btnSort_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(72, 167);
            this.btnSearch.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(262, 79);
            this.btnSearch.TabIndex = 17;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // txtSearch
            // 
            this.txtSearch.Location = new System.Drawing.Point(134, 83);
            this.txtSearch.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(210, 38);
            this.txtSearch.TabIndex = 18;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.btnSearch);
            this.groupBox2.Controls.Add(this.txtSearch);
            this.groupBox2.Location = new System.Drawing.Point(1511, 580);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.groupBox2.Size = new System.Drawing.Size(400, 283);
            this.groupBox2.TabIndex = 19;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Search Name";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(36, 89);
            this.label1.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(98, 32);
            this.label1.TabIndex = 0;
            this.label1.Text = "Name:";
            // 
            // txtAnswer
            // 
            this.txtAnswer.Location = new System.Drawing.Point(180, 744);
            this.txtAnswer.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.txtAnswer.Name = "txtAnswer";
            this.txtAnswer.Size = new System.Drawing.Size(314, 38);
            this.txtAnswer.TabIndex = 20;
            // 
            // lblAnswer
            // 
            this.lblAnswer.AutoSize = true;
            this.lblAnswer.Location = new System.Drawing.Point(52, 744);
            this.lblAnswer.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.lblAnswer.Name = "lblAnswer";
            this.lblAnswer.Size = new System.Drawing.Size(117, 32);
            this.lblAnswer.TabIndex = 21;
            this.lblAnswer.Text = "Answer:";
            // 
            // btnEnter
            // 
            this.btnEnter.Location = new System.Drawing.Point(546, 738);
            this.btnEnter.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.btnEnter.Name = "btnEnter";
            this.btnEnter.Size = new System.Drawing.Size(230, 54);
            this.btnEnter.TabIndex = 22;
            this.btnEnter.Text = "Enter";
            this.btnEnter.UseVisualStyleBackColor = true;
            this.btnEnter.Click += new System.EventHandler(this.btnEnter_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(52, 806);
            this.label4.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(1016, 32);
            this.label4.TabIndex = 23;
            this.label4.Text = "*If the answer is not an integer, please enter your answer of just the integer pa" +
    "rt.";
            // 
            // cboTeam
            // 
            this.cboTeam.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboTeam.FormattingEnabled = true;
            this.cboTeam.Items.AddRange(new object[] {
            "CNIT",
            "Cybersecurity",
            "SAAD",
            "NET"});
            this.cboTeam.Location = new System.Drawing.Point(398, 122);
            this.cboTeam.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.cboTeam.Name = "cboTeam";
            this.cboTeam.Size = new System.Drawing.Size(460, 39);
            this.cboTeam.TabIndex = 0;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(50, 37);
            this.label5.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(692, 41);
            this.label5.TabIndex = 25;
            this.label5.Text = "CIT DEPARTMENT MATH BATTLE";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(52, 839);
            this.label6.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(233, 32);
            this.label6.TabIndex = 26;
            this.label6.Text = "Do not round up!!";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1247, 580);
            this.button1.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(252, 60);
            this.button1.TabIndex = 27;
            this.button1.Text = "Past Questions";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // txtName
            // 
            this.txtName.Location = new System.Drawing.Point(396, 182);
            this.txtName.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(462, 38);
            this.txtName.TabIndex = 28;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Consolas", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(252, 186);
            this.label7.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(95, 36);
            this.label7.TabIndex = 29;
            this.label7.Text = "Name:";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(16F, 31F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(2198, 940);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cboTeam);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnEnter);
            this.Controls.Add(this.lblAnswer);
            this.Controls.Add(this.txtAnswer);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.btnSort);
            this.Controls.Add(this.btnQuestion);
            this.Controls.Add(this.lblLevel);
            this.Controls.Add(this.cboLevels);
            this.Controls.Add(this.groupBox_range);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnStats);
            this.Controls.Add(this.lstShow);
            this.Controls.Add(this.lblUsername);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(6, 6, 6, 6);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Math Game";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.groupBox_range.ResumeLayout(false);
            this.groupBox_range.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblUsername;
        private System.Windows.Forms.ListBox lstShow;
        private System.Windows.Forms.Button btnStats;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.GroupBox groupBox_range;
        private System.Windows.Forms.RadioButton radRandom;
        private System.Windows.Forms.RadioButton radUsersinput;
        private System.Windows.Forms.ComboBox cboLevels;
        private System.Windows.Forms.Label lblLevel;
        private System.Windows.Forms.TextBox txtN3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtN1;
        private System.Windows.Forms.TextBox txtN2;
        private System.Windows.Forms.Button btnQuestion;
        private System.Windows.Forms.Button btnSort;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtAnswer;
        private System.Windows.Forms.Label lblAnswer;
        private System.Windows.Forms.Button btnEnter;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cboTeam;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.Label label7;
    }
}


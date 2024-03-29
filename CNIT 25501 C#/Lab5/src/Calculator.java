/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class Calculator extends javax.swing.JFrame {

    /**
     * Creates new form Calculator
     */
    public Calculator() {
        initComponents();
        allClear();
        updateDisplay();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        display = new javax.swing.JTextField();
        jPanel1 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jButton7 = new javax.swing.JButton();
        jButton16 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton11 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton12 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton9 = new javax.swing.JButton();
        jButton10 = new javax.swing.JButton();
        jButton13 = new javax.swing.JButton();
        jButton14 = new javax.swing.JButton();
        jButton15 = new javax.swing.JButton();
        jButton17 = new javax.swing.JButton();
        jButton18 = new javax.swing.JButton();
        jButton19 = new javax.swing.JButton();
        jButton20 = new javax.swing.JButton();
        jMenuBar1 = new javax.swing.JMenuBar();
        jMenu1 = new javax.swing.JMenu();
        quit = new javax.swing.JMenuItem();
        jMenu2 = new javax.swing.JMenu();
        about = new javax.swing.JMenuItem();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(500, 500));

        display.setEditable(false);
        display.setFont(new java.awt.Font("Tahoma", 0, 30)); // NOI18N
        display.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        display.setMargin(new java.awt.Insets(70, 70, 70, 70));
        getContentPane().add(display, java.awt.BorderLayout.PAGE_START);

        jPanel1.setLayout(new java.awt.GridLayout(5, 4));

        jButton1.setText("1");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton1);

        jButton6.setText("2");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton6);

        jButton7.setText("3");
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton7);

        jButton16.setText("+");
        jButton16.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton16ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton16);

        jButton2.setText("4");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton2);

        jButton11.setText("5");
        jButton11.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton11ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton11);

        jButton8.setText("6");
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton8);

        jButton3.setText("-");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton3);

        jButton4.setText("7");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton4);

        jButton12.setText("8");
        jButton12.setToolTipText("");
        jButton12.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton12ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton12);

        jButton5.setText("9");
        jButton5.setToolTipText("");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton5);

        jButton9.setText("x");
        jButton9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton9ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton9);

        jButton10.setText(".");
        jButton10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton10ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton10);

        jButton13.setText("0");
        jButton13.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton13ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton13);

        jButton14.setText("±");
        jButton14.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton14ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton14);

        jButton15.setText("÷");
        jButton15.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton15ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton15);

        jButton17.setText("√");
        jButton17.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton17ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton17);

        jButton18.setText("C");
        jButton18.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton18ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton18);

        jButton19.setText("AC");
        jButton19.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton19ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton19);

        jButton20.setText("=");
        jButton20.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton20ActionPerformed(evt);
                calculatorButtonPressed(evt);
            }
        });
        jPanel1.add(jButton20);

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        jMenu1.setText("File");

        quit.setText("Quit");
        quit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                quitActionPerformed(evt);
            }
        });
        jMenu1.add(quit);

        jMenuBar1.add(jMenu1);

        jMenu2.setText("Help");

        about.setText("About");
        about.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aboutActionPerformed(evt);
            }
        });
        jMenu2.add(about);

        jMenuBar1.add(jMenu2);

        setJMenuBar(jMenuBar1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void aboutActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aboutActionPerformed
        // TODO add your handling code here:
        javax.swing.JOptionPane.showMessageDialog(null,"Brandon (Jin Su) Lee | 2019 | Made by ME");
    }//GEN-LAST:event_aboutActionPerformed

    private void quitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_quitActionPerformed
        // TODO add your handling code here:
        System.exit(0);
    }//GEN-LAST:event_quitActionPerformed

    private void calculatorButtonPressed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_calculatorButtonPressed
        // TODO add your handling code here:
        onButtonPressed((javax.swing.JButton)evt.getSource());
    }//GEN-LAST:event_calculatorButtonPressed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton7ActionPerformed

    private void jButton16ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton16ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton16ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton11ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton11ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton11ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton8ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton12ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton12ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton12ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton9ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton9ActionPerformed

    private void jButton10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton10ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton10ActionPerformed

    private void jButton13ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton13ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton13ActionPerformed

    private void jButton14ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton14ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton14ActionPerformed

    private void jButton15ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton15ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton15ActionPerformed

    private void jButton17ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton17ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton17ActionPerformed

    private void jButton18ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton18ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton18ActionPerformed

    private void jButton19ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton19ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton19ActionPerformed

    private void jButton20ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton20ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton20ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Calculator.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Calculator().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JMenuItem about;
    private javax.swing.JTextField display;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton10;
    private javax.swing.JButton jButton11;
    private javax.swing.JButton jButton12;
    private javax.swing.JButton jButton13;
    private javax.swing.JButton jButton14;
    private javax.swing.JButton jButton15;
    private javax.swing.JButton jButton16;
    private javax.swing.JButton jButton17;
    private javax.swing.JButton jButton18;
    private javax.swing.JButton jButton19;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton20;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private javax.swing.JButton jButton9;
    private javax.swing.JMenu jMenu1;
    private javax.swing.JMenu jMenu2;
    private javax.swing.JMenuBar jMenuBar1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JMenuItem quit;
    // End of variables declaration//GEN-END:variables

private double result ;
private char operation ;
private boolean error ;
private int displayLen ;
private String disp ;

public static final int MAX_DISPLAY_LEN = 10;
public static final double MAX_VALUE_EXCLUSIVE = 10000000000.0;

private void allClear()
{
result = 0.0;
operation = '+';
error = false;
displayLen = 0;
disp = " ";
}
// Avoids " scientific notation " format for large numbers ;
// and guaranteed to give us too many digits . We then just
// truncate away the ones we don 't need .
private String toDisplayString(double d)
{
String asStr = String.format("%."+(MAX_DISPLAY_LEN)+"f",d) ;
int maxLen=MAX_DISPLAY_LEN;
if(asStr.charAt(0)=='-') {
    maxLen += 1;
}
asStr = asStr.substring(0,maxLen) ;

return asStr;
}

private void updateDisplay()
{
    if (error)
    {
    display.setText("Err");
    }
    else if(displayLen > 0)
    {
    display.setText(disp);
    }
    else
    {
    display.setText(toDisplayString(result));
    }
}

private void exec(double immediateValue)
{
    System.out.println(result) ;
    System.out.println(operation) ;
    System.out.println(immediateValue) ;
    switch(operation)
    {
        case '=':
            result = immediateValue;
            break;
        case '+':
            result += immediateValue;
            break;
        case '-':
            result -= immediateValue;
            break;
        case 'x':
            result *= immediateValue;
            break;
        case '÷':
            if (immediateValue == 0)
            {
                error = true;
            }
            else
            {
                result /= immediateValue;
            }
            break ;
    }
    System.out.println(":=>"+result);
    double check = Math.abs(result);
    if (check>= MAX_VALUE_EXCLUSIVE)
    {
        error = true;
    }
    displayLen = 0;
    disp = " ";
}

private void handlePress (char code)
{
    if (code == 'A')
    {
        allClear ();
        return;
    }
if(error)
{
    return;
}
if(code == 'C')
{
    disp = " ";
    displayLen = 0;
}
else if(code >= '0' && code <= '9' || code == '.') {
    if(code == '.' && disp.indexOf ('.') != -1)
    {
        // Just ignore the button press ; can 't have more than one '.'
        // This is sometimes called " eating " user input .
    }
    else if(displayLen<MAX_DISPLAY_LEN+(code == '.' ? 1:0))
    {
        // special case - if disp is "0" , just overwrite it.
        if (" 0 ".equals(disp) && code != '.')
        {
            disp = " " + code ;
        }
        else
        {
            disp += code;
            displayLen += 1;
        }
    }
}
else if (code == 'r' || code == '±')
{
    double value = displayLen == 0 ? result : Double.valueOf (disp) ;
    final double intermediate;
    if(code == 'r')
{
if( value < 0)
{
error = true;
return;
}
intermediate = Math.sqrt (value);
}
else
{
intermediate = - value;
}
disp = toDisplayString(intermediate);
displayLen = disp.length();
}
else
{
double value = displayLen == 0 ? result : Double.valueOf(disp);
exec(value);
operation = code;
}
}
private void onButtonPressed (javax . swing . JButton which)
{
// Step 1 - Turn `which ` into a letter
String buttonText = which . getText () ;
final char letter ;
if("< html >& radic;</html>".equals(buttonText) || "√".equals(buttonText))
{
letter = 'r';
}
else
{
letter = buttonText.charAt(0);
}
// Step 2 - Apply the effect of that button ( see the " Background "
// section in the handout ).
handlePress(letter);
// Step 3 - change what 's shown in the `display ` JTextField .
updateDisplay();
}
}


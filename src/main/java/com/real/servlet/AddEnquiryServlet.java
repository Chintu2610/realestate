package com.real.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.real.serviceimpl.AddEnquiryServiceimpl;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/AddEnquiryServlet")
public class AddEnquiryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = "Add enquiry Failed!";

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String Budget = request.getParameter("Budget");
        String message = request.getParameter("message");
        String id = request.getParameter("id");

        AddEnquiryServiceimpl add = new AddEnquiryServiceimpl();
        status = add.addenquiry(name, email, phone,Budget, message, id);

        // Check if e mail exists before sending an email notification
        if (isEmailExists(email)) {
            // Email notification in a separate thread
            sendEmailNotification(name, email, phone,Budget, message, id);
        } else {
            // Handle the case where the email does not exist
            System.out.println("Email does not exist: " + email);
        }

        // Forward the request
        request.getRequestDispatcher("index.jsp?message=" + status).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void sendEmailNotification(String name, String email, String phone,String Budget , String message,String propertyId) {
        String from = "sharathnayak1026@gmail.com";
        String password = "yqxs igxx rjgr nugo";
        String to = "sharathnayak1026@gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(from));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            mimeMessage.setSubject("New Inquiry for Property ID: " + propertyId);
            mimeMessage.setText("Name: " + name + "\nEmail: " + email + "\nPhone: " + phone +"\nBudget"+Budget+ "\nMessage: " + message);
            Transport.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private boolean isEmailExists(String email) {
        // Replace this with your actual implementation to check if the email exists
        // For example, you can use a database query or any other logic to check existence.
        // Returning true for demonstration purposes.

        // Assuming you have a method in your service/DAO to check email existence
        AddEnquiryServiceimpl addEnquiryService = new AddEnquiryServiceimpl();
        return addEnquiryService.isEmailExists(email);
    }
}

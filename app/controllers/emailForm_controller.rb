class EmailFormController < ApplicationController
    def email_form
    end
    
    def email_send
        email = params[:email]
        title = params[:title]
        content = params[:content]
        gmail = Gmail.connect("your_gmail_id", "your_gmail_password")
        gmail.deliver do
            to.email
            subject title
            text_part do
                body content
            end
        end
        gmail.logout
    end
end
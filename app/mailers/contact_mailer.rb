class ContactMailer < ApplicationMailer
  def contact_mail(mutter)
    @mutter = mutter
    mail to: @mutter.user.email,
    subject: "投稿完了メール"
  end
end

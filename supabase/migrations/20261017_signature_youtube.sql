-- Signature des e-mails : nouvelle adresse de la chaîne YouTube (@vitako.mg).
create or replace function public.mail_signature()
returns text language sql immutable as $sig$
  select '<div style="margin-top:28px;padding-top:16px;border-top:1px solid #D9E2D7"><table cellpadding="0" cellspacing="0" border="0" role="presentation" style="border-collapse:collapse;font-family:''Figtree'', Arial, Helvetica, sans-serif;color:#13241B;">
  <tr>
    <td style="vertical-align:middle;padding:0 18px 0 0;border-right:2px solid #0B7A55;"><a href="https://vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/vitako-logo-email.png" width="162" height="32" alt="Vitako" style="display:block;border:0;width:162px;height:32px;"></a></td>
    <td style="vertical-align:middle;padding:2px 0 2px 18px;">
      <div style="font-family:''Figtree'', Arial, Helvetica, sans-serif;font-size:13px;line-height:18px;">
        <a href="mailto:contact@vitako.mg" style="color:#0B7A55;text-decoration:none;">contact@vitako.mg</a><span style="color:#D9E2D7;">&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="https://vitako.mg" target="_blank" style="color:#0B7A55;text-decoration:none;font-weight:bold;">vitako.mg</a>
      </div>
      <table cellpadding="0" cellspacing="0" border="0" role="presentation" style="border-collapse:collapse;margin-top:10px;"><tr><td style="padding:0 6px 0 0;"><a href="https://www.facebook.com/vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/facebook.png" width="24" height="24" alt="Facebook" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 6px 0 0;"><a href="https://www.instagram.com/vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/instagram.png" width="24" height="24" alt="Instagram" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 6px 0 0;"><a href="https://www.tiktok.com/@vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/tiktok.png" width="24" height="24" alt="TikTok" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 6px 0 0;"><a href="https://www.linkedin.com/company/vitako-mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/linkedin.png" width="24" height="24" alt="LinkedIn" style="display:block;border:0;width:24px;height:24px;"></a></td><td style="padding:0 0px 0 0;"><a href="https://www.youtube.com/@vitako.mg" target="_blank" style="text-decoration:none;"><img src="https://vitako.vercel.app/assets/img/email/youtube.png" width="24" height="24" alt="YouTube" style="display:block;border:0;width:24px;height:24px;"></a></td></tr></table>
    </td>
  </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" role="presentation" style="border-collapse:collapse;">
  <tr>
    <td style="padding-top:12px;font-family:''Figtree'', Arial, Helvetica, sans-serif;font-size:12px;line-height:17px;">
      <span style="color:#0B7A55;font-weight:bold;">Apprends un métier, travaille à distance.</span><span style="color:#56665C;">&nbsp;&nbsp;111 formations · 13 domaines · attestation</span>
    </td>
  </tr>
</table></div>'::text;
$sig$;
revoke execute on function public.mail_signature() from public, anon, authenticated;

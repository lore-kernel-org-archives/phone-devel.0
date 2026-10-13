Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7545549382
	for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 21:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928007; cv=pass; b=AZE95KTLRMN3TSNK2mfy5c8Hp5gXrV03DZ/mJFHBewxlVao+XVcc838Q/IpXph3iuXrK5rfDqL0E6xlnUiyV2qbei5VFO/l/HgISePSfCJJB0g+wmLK4Djj4VCAL8IJsyf6nDeM5QmP281fsl+iCLCQjiWR4OjQ5DTxCLRbjd58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928007; c=relaxed/simple;
	bh=wTbiDtQ3Q4NbSHIp3HtWK47X70vEoCGFPPZl59iLx1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9YGof83WmjtMBr5Kqtw8yMszI/MCsNfSgsxXzDjcGvVQIShAJnPTcYT+1/AKO2KKu+pPrdIHOhQ1zCTQuivtBLVm6AoXjOWszoMkuvQnoAy7BGzk4ss3i7D87+osuggOkO/iHGCCOjCCeH9AuNgS53fDcKPY0jQO8iNvvwn3fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Frct16Zl; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Frct16Zl"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20ce3c118aso476664566b.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 14:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791928003; cv=none;
        d=google.com; s=arc-20260327;
        b=nyTPD7eRxKyfQp96uAhQLFQcxcUjuw9rGWfRpb39Rn3IWKK1Bepr3/vWBU2Sh0cScn
         qik71u7W0qdgFZjF7pr/eLmjD75Ww8l1r9xZGhIBXRRkOvjrvqwsQiDAof/nfFvu6WJF
         Cuosb314kHVgN5dtQ6dMpuV6vz53YBg25r/rMSkqjwTF0QMUIykcnUUSGUTOfXFhhKvh
         Gizk3257eaSh1h7eJ1RlDIW6EwZij/+pKJ7K85z0BR5P10b8S5uet+WE4TbptWT1W+VC
         waE0jzpdkW3esKb0xk84quKbjx4jQsLar+zpAAzFK4GfaHffPz0S01EOUCgmDmBv1vWu
         dygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqZD4Ft9JyhRwT2DBarljuLbS5RYQ2WwnZPQWaQ6rj4=;
        fh=h1TP6QXBZSyfgW5vKEL4EanR5G0XwnzFFHIxOKg68PM=;
        b=GRhdwkaCrHT52RcjR+hNnhUhLnR0+gFM1FEw8yur2hOzcWPn2p5IO3+J7dgFzLvziF
         FRmlwkbhb+mshjfeE6jJpzhq9/vozZa9IoKmMO807y/zSSz2Tvyxi2KXv1mR5ARNRz5D
         ZMs+ZKTZ1G7zgU25v52ZeBq2chEegmO105PTEl/SCBA1RJyU3uASPn4IJoj84PMb6Q7t
         vIiFcZseelubZHXro7WojNW2mfUfzQgiTFN8zrnK6aD+9+jXShKR7sg/jFRrFMNr6jDq
         T2R6G8CKbb1fXpOF6o+fyCxxEQ8pohTkN3aL/6P8AchSuMozu9VSpCiB+VNYFvHErbNP
         UByg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791928003; x=1792532803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqZD4Ft9JyhRwT2DBarljuLbS5RYQ2WwnZPQWaQ6rj4=;
        b=Frct16Zlu3E4yvR3R4xRFb5bKlPZdJC94E6AAu4ruLx9L3BjlkWZcgdKXf2wrCcgQD
         mRbpxRv9Nt861zAnBPn/kV9etyomQG9NfmvWbNLtH2FfN3ijxypc/z9/Js0z5S7bNnN6
         tBN/ztVHbKFsMm3IGPxLqCA1jM/d5j2pWlcx+watj30JwZCIWTMOIyKEQ1LUnGk0ichg
         iSKO4G6TLVlrBS7liZ1VPh+gDniNKUCrL0A1RmItSNtPVwjsgih2IlPrfNymdoY+Avh/
         2iP6Z86IOhAD3lyeHyUsToQuqsn05+97naeJBD7Q8JlVC5hkn8ZUZJh1Z3o3G+SVGF2f
         YnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928003; x=1792532803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqZD4Ft9JyhRwT2DBarljuLbS5RYQ2WwnZPQWaQ6rj4=;
        b=OAsgFjl87hqrLJrk9E/tL7zlbGER+a0GDDmXWLy+ii2Of3TQ0hrLztX/3vloUOYvPx
         Fcol8MNagcLT58HLckzEgqFdJrB0cjWyniO3MsiPUD88tf8zPEgvRXOiH+uf11HxakOU
         AYlOLKg6u1hPwe6F8NHO/8Bx+X8x5IDKv6RiNHb71QFTAI+2gIEiOReG2GH4xDuUVa3f
         idz1YqV4kybTt+kWZrWQ4HN0mOZpxyiYmGfHXrBF2qJbrGlW9yFiVDlF15qA800nJXJl
         j+DJMPN31a4KMXc5YTJGd5jLa+gwU+7AUARuL7neFzqmHhFGqpa+/eujJ1zJ9Srnh/Ue
         iRGQ==
X-Forwarded-Encrypted: i=1; AKwUvBywAc54EYTNVKxnYSSGFR9szidnQCc2fOccKaAXEMCZU0rwgZY+i6X37XsEr1CoY/K9j/hOkWbA9Ud8Ow==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLZP1U+D9STROu+OQQz2Q8FFvOB/7VMXQNHo+Oq3vdBmoi77I7
	euCPWHn32QX9uczPIzpw19a3Am7tm8kSq8JGk0ml+qz7WN78ay48ozWqC9CTqW6INvJaus3c2d8
	tyNrRgOhTR2cB4oWZPLG/1BKcD618HW8=
X-Gm-Gg: AYBFou3ZvGCTM4Ui2RmyVZIBsFB1wRQ1CBODdDO3CYR0uYd1PnCo2q5TdMtQrLsPJ7Y
	ned8ujCZTMoao6icLHtsIMcpHKO2nOI9ppBIbm3X0cvRSa5ZiYvwnfW0J4BcpErOGcI2MTly8an
	ejNl8vBgs+zii3GbWYHYZ8omYIau29kbyYKM4PwTEaNJy7hCWoewbKUBzemmuNIuj/LaE+ulGvY
	RHWQbUfXdBP2kKZJavvMcltkDejCBwZqbWC4NtjXacukZRSiiMAC3NcJKLMD+n2oAJ5BIz7on4V
	ouijHZTjfhNdsuTep8ob9aEQSkl8bQZQWViRgW2GLcDDg2qD/8dTBA==
X-Received: by 2002:a17:907:3d51:b0:c2d:be57:f742 with SMTP id
 a640c23a62f3a-c31a71252famr1282278766b.32.1791928002700; Tue, 13 Oct 2026
 14:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com> <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
In-Reply-To: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
From: Jasper K <jja2000@gmail.com>
Date: Tue, 13 Oct 2026 23:46:32 +0200
X-Gm-Features: AclHuK-NqYEpvDtDXhi9IVbRYKes3SwwvzbOhM7NId12OJB7ksYzqp34C_yrVg0
Message-ID: <CAErD6092tBte1je=9t0_NUwrU8uqHen_ffYMYXFBqMCJkTZRHg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
To: Doug Anderson <dianders@chromium.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Op di 13 okt 2026 om 22:35 schreef Doug Anderson <dianders@chromium.org>:
>
> Hi,
>
> On Mon, Oct 12, 2026 at 11:11=E2=80=AFAM Luca Weiss <luca.weiss@fairphone=
.com> wrote:
> >
> > From: Jasper Korten <jja2000@gmail.com>
> >
> > Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
> > Galaxy Book2 Go.
> >
> > $ edid-decode /sys/class/drm/card0-eDP-1/edid
> >
> > 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
> > 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
> > 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> > 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> > 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> > 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
> >
> > Signed-off-by: Jasper Korten <jja2000@gmail.com>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 2b455369ed70..73cdc2d37ab7 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B11=
6XAN06.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B14=
0HAK02.7"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B14=
0HAN06.4"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B14=
0HAN04.0"),
>
> I'd assume you don't have a datasheet here and that the timings are a
> bit of a guess. It's nice if you put that in the commit message, but I
> won't block it. Ideally you could reply here and let me know if you
> referred to a datasheet or just made a guess about the timings so if
> the question ever comes up later we can find the conversation based on
> the Link: tag...

The guess was based on the other entry of a panel with the exact same
name, but another ID (0x403d).
The link for when that got added can be found here:
https://patchwork.freedesktop.org/patch/msgid/20231107204611.3082200-4-hsin=
yi@chromium.org

There's some panel documentation around on panellook, but I'm not sure
if that matches the HW rev that's in these laptops,
nor if they actually contain the data I'd need for this panel entry.

This setup ended up working out, so that's why I left it like that.

Kindest Regards,

Jasper Korten

>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Pushed to drm-misc-next:
>
> [1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
>       commit: 9125232bc2a5020710db1eadd21973757f740648

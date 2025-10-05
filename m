Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1961DE8B5
	for <phone-devel@vger.kernel.org>; Sun,  5 Oct 2025 19:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759692974; cv=none; b=Vzo/dsVgnYn6rh8wiWNlfTDDRlg9ct/2Z9ql998b+eC1VwNzmDwNayWOtE22HsX00ckiZ+ISRiEDG+BtqbFpCYwGU0+5jd824eWCqQgiPY/Y83HQh9sHrxR8966SNS4sWtaqzXY0ILQW7NxvuRQ29Wb96mmD4dxJNNj7Ka8MnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759692974; c=relaxed/simple;
	bh=HpCPwTV6Ymso2jLvEaOmKrvUbLjDDf+rF1XltKBbEo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOfQ3Ju7kIZt1l5H/k6xJmVMQnqcEZGmn/khcVImT6ARRgnvEmq9E/tonsVBlw6OaGh37/87eaUretfE9hzvul6/3f+09nhyF496YwL8LibuuD7JZexFp5vJ7b1H5UtuzEwAW9XYEdnF1QxqY5Ij9707oZnEUiGMalwqPXh4qCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnuYQTmn; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnuYQTmn"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57b35e176dbso5407964e87.1
        for <phone-devel@vger.kernel.org>; Sun, 05 Oct 2025 12:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759692970; x=1760297770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B8ByiJnX+QP06S+C98Ev13SN/Q5Wa0f7/4hHRsHwc/k=;
        b=FnuYQTmn26+cBaC0AwP1dStC58+OZP1x5qrT/Ikq2HfFvgfel66g3Co+QjS72KOQbT
         BWdRp3XPT/vPU6s2SQUjhTUe7CCgiMAn/zMEFHEKe7/Uv26Nu2QJ6kAzrKBnKR86T4bx
         n9VpBw4ns6NN9+IHH1bH39cxhhEGVy9sgrFG58yUG6l6DkAsiK/8ztdJYoc4oZGnSweh
         8DB8ApsS4grL4flVePSv1g081o+CEs2C0MHyl78b50rYaH4Wco/zi5Acrtq+6ieR0Cxv
         NjHgoNwPHxOBlARJpkTP4SB/fahH3VEj6PIHLOD0zhhFt+prFEvuzHfk6jzNExRW6bYh
         Yzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759692970; x=1760297770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8ByiJnX+QP06S+C98Ev13SN/Q5Wa0f7/4hHRsHwc/k=;
        b=DBYCcM8Tnl29T8/hrseLr3w9ZQszCY5mRRt6VwOQsshbTAQwK91ux4chTtdyn0MRBP
         7HDXA0RWad7Ppuy+IuYy02lD3rC8f+9Tv0x8WUl9uKVi5WHyXR+Lmw+xyG3GsjaJ2s5G
         IrtVviooyl/YLKnplbzta4HRl58rQMTp7AJuQRQrZeYvYaKW+IL9VniKhT/W75NN9JW9
         WiAxty4OJdifNXvdVhkwrkM1xWbLg1S1dgYkZs0wKeawzMy1zsUKR7u/M3ijYc5xsklw
         ff2NPvNOVXu6Mfodhfolkvj5l9xqgwGWRZdA9k4fFnHuoLMvyFcjPpZQMdQtKyK/sXaQ
         353Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0oVGW/aOmYMndZPmGM/asmkhwrdTISjnOlts2zmP/0Xn1TDsd9SE3Dh3R8nlF5FXaDgc8Avg9KgLFoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Jyq1xTU4AHJLJkGREhaJP79XOAAphFrSRWe7JnJ63Rk/w82w
	MlcapCjTq7I4HKwdf5ZrCPoiwUyD/U6gmQOVF7NbAjVrQBGFY6l98/p40UrtAj4K2maUm5qNyH3
	9uIPfd5BW4MEG56r5v+1YoEGJwOjfZXM=
X-Gm-Gg: ASbGncv3FoWE6rQ82wQQIQ5+efWn7J20NlH73b4ek4siQHWYpz/aWwsy0D5XxIQu6RR
	ummdMYMWLMyWANMP0PDQWA73L3vj3s3cHA3LPdiQkQi3lSlETQr1iakPwkXz6nGZ74m/Gh0XjKK
	cn13laL4Sdl0RMEgDL1GrHF2EehISZ5GlofhqniwtGKV2IdeEvbgOw0mDegRAn6YGpsRXIxJvD6
	1FFayIt928nfCXpaXoPEMNfkWffsOF82G6io7sowlFNyozm+uyVQS54ZeBLRI6zMp9NfULV/KSv
	y0q8slUM2cGFcBHN5S1jhQkbO6Sg4udoDXj9PqLNAhdpATbiYnjLdFW8DL4sKNHRUhvF8sVR9q+
	6qHAigcQ=
X-Google-Smtp-Source: AGHT+IGeuKU8klCmxB4Wd39ZsY1VEQw2A/8b61XgTuTEMmx63wy7XwkjXnKRo8krqB/HqCUkM+y01HIC7xEEEyhzQ+g=
X-Received: by 2002:a05:6512:230b:b0:585:1ca7:1b7b with SMTP id
 2adb3069b0e04-58cbb255fcbmr3402254e87.31.1759692969485; Sun, 05 Oct 2025
 12:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org> <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
In-Reply-To: <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
From: Chris Brown <crispybrown@gmail.com>
Date: Sun, 5 Oct 2025 15:35:56 -0400
X-Gm-Features: AS18NWD0klMI-Y0ok5kdj815WG__q8Dt0zdKpCJrqe8wE9-WN-Ydtjc6OrnZJzM
Message-ID: <CABN5=wEpekmKxFCr7nBcYGSt6ZH-g+bx7Y5Nmoo=tMrorz2XBg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] arm64: dts: qcom: sdm845-lg-common: Add camera flash
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Paul Sajna <sajattack@postmarketos.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Amir Dahan <system64fumo@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

850mA looks correct for the flash, whereas the flashlight/torch should
be 100mA based on
https://github.com/EmanuelCN/android_kernel_lge_sdm845/blob/U/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-camera/sdm845-judy-camera.dtsi
i.e. led-max-microamp = <100000>;

On Wed, 1 Oct 2025 at 05:04, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/29/25 7:05 AM, Paul Sajna wrote:
> > So it can be used as a flashlight
> >
> > Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > index a8c8706f2057d36d5ef4130f11d9ad417f93d575..f309e6ebc075a691c7a522238b4a93ba9e63f3c0 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > @@ -509,6 +509,19 @@ &pm8998_resin {
> >       status = "okay";
> >  };
> >
> > +&pmi8998_flash {
> > +     status = "okay";
> > +
> > +     led-0 {
> > +             function = LED_FUNCTION_FLASH;
> > +             color = <LED_COLOR_ID_WHITE>;
> > +             led-sources = <1>;
> > +             led-max-microamp = <850000>;
> > +             flash-max-microamp = <850000>;
>
> Allowing the same current for flash (brief on/off for night photos)
> and LED (flashlight which you normally toggle through quick settings)
> sounds no less than suspicious
>
> Konrad
>
> > +             flash-max-timeout-us = <500000>;
> > +     };
> > +};
> > +
> >  &pmi8998_lpg {
> >       status = "okay";
> >
> >

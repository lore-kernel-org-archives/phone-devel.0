Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A23256C6D
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464102; cv=none; b=CptZ+CU/4jD7GJ01PAlBOdobSgVvhTw4lPmsU0Dg6sME4vDyTGiYHPM7OH4b029t7Sd5sQCLO1g7ReAe6Z9FoZGfq3XEKkSVmbk6qZyCGMQkNQQ+8xeTEG1GXFtUHUyxP+Q07l9lgRi/3mIZU5ZPrr4x1RBwGaSn8x4hB8Byr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464102; c=relaxed/simple;
	bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdxdZuZFrPwfl0F40mlSaHUANc4ThD18Wh+F+knJ0P5DmAQgMHy+BCKPkPBRz6QNdPPhoMz3ulwr8b9OZQah7ioAnL6pL3ZEi3BKJxMhqe1eZPMQGcbGsWK2BzD3TBfaZIvt794NX05Ds4A+DAtuuHXpIop9GxIgrW/cXyNkn60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YK5j8pQr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YK5j8pQr"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5958931c9c7so205195e87.2
        for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 06:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765464099; x=1766068899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
        b=YK5j8pQrSp19WFlSsShgo5pF1l74Owhrzfy81Qmeoz7jkXoSK+nHX+q1uy1WNzXcfA
         bJYdp9DavVMCNDkxA0802rfW7bVS3orM2QsIQs4mXOH9WmPpGMzS6jylyjPW+ncHq0Ih
         IngGy3QhsyYH55xHt1cEaijdQuWoPUOIzPz+8b8IHKeJcWS0wxkMW/mqmIWLJ2OQ4xN+
         xXEZJ035bT8ciuX1cOXurRCyk3zEUDCwHaxzhHBveslyhv9aNYAouNilUJ5xv1VoQ602
         E/RNghQdGnLXpkXg9LUGpyLac1wStq+KqfKqv50Kfn8cpsZX8Cy39gmAFIRggo9utTNr
         0lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464099; x=1766068899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XL08wq/Gpmij7q/EVlU3oMvW4oE7BPSYS0rC8uxEoyk=;
        b=blKje47XbEoX/Bzrh1080X0W5p6wwknKd7BGln5HMIfMDUFMko9BhrhtZHYlnLI2Dg
         Ywy0ctepYc5p5jb1QyG5/QvTj37o7RVFBubp2PdySKIIb2tulnrILXQ6K3RgFSJvFCJJ
         tFV7f4dKYLSpHiSSnFY1hKUnGE/xGqZrJy3M0SDw8+FO4NkqYGAmAKdL+oxVvcaP8SK4
         HZzsr2H0COFpovmm6DzX6GQEGyQr01+g0HqycK0f730YaQIN8eGMegjU/NyL7xgiJsYP
         3JKT6iM188XoEKQre2jJ727PrpIAHonOf/thXp+a3gFxKBIqxHVITMS2GPuLolJdpLqX
         XCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHgyXq7vM9QwtWeTI9z/1nr80fQO7AeBKyZVtCDMu89REkUTi/eoP+USHfEbhaCLOlhJdopMqjJKReFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcftZXYoBg67keZdrSfqtDeAj326BQRRHuW0KnZl4iWjk6Gg3M
	hhsvTI/yM/L3+Z7QnMMBMoEsHHY7l7RXaK9IXDz0Q7EKkAiHLm+Jcg8O2gapZh+uI0nRTY8HHSi
	kqWplCyk/Hez5NDeyqONXby1BB1uzYKU=
X-Gm-Gg: AY/fxX6d/ojcHi/qUMKg53EL/s11guuzrWK283rFfeVTg6suoq9tsnLF5dilzTPeytt
	ji7dN6T6MRMPO1puifbrRPrxbccAAic8rwv0ZQVduQElzRdlZmg6Xhrz3gxy5VJ/eW1VeXjUxEd
	qK9Gv8ythQA4BqSjycytFxsjtRPYRWQNpMb95cQ5HeaNLZXKurMWUGFS4wNXZIHzKHUEGR+Ld+w
	b1QT16ojkf955bZieC4vUqhY0/z1mwrabjBQv+9HKrvk/nY7YfJV1ATWvcB0huwJl0dN3GFw033
	zAEV
X-Google-Smtp-Source: AGHT+IFiIR+iIsV4mJ6qVbYZvp4StuXMH2zma5BiBkgrZg+TTdcuperTYP94aUirT3N2xa/3hEPBPBBlokr7QfLebLc=
X-Received: by 2002:a05:6512:61a1:b0:598:f85b:b12f with SMTP id
 2adb3069b0e04-598f85bb2f2mr223765e87.38.1765464098416; Thu, 11 Dec 2025
 06:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu> <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
In-Reply-To: <d81e017e-e317-402d-a4bf-7ddfa033299e@oss.qualcomm.com>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 11 Dec 2025 17:41:26 +0300
X-Gm-Features: AQt7F2pajj9Y1bhJt30iOkjeSJDSjern_i-FqbzQqEVWSt5mgRNTFkDTUxa7MnY
Message-ID: <CABTCjFBQOq1pmdou_17ZOV3MgTxD_2byAY4RitqPVN5FYdRuJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca@lucaweiss.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D0=B4=D0=B5=D0=BA. 2025=E2=80=AF=D0=B3. =D0=B2 19:33, Konr=
ad Dybcio <konrad.dybcio@oss.qualcomm.com>:
>
> On 12/7/25 11:35 AM, Luca Weiss wrote:
> > Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
> > reference for the SLPI PAS.
> >
> > The Linux driver unconditionally tries getting "cx" and "px" supplies,
> > so it actually is used.
> >
> > Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 =
use CX as power domain")
> > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > ---
> > There's literally one board using this upstream, judging from that I'm
> > not sure this is a misuse of cx-supply or what exactly. An alternative
> > to this patch is of course removing the usage in
> > sdm845-samsung-starqltechn, but as it stands right now the patch under
> > "Fixes" introduces a dtbs_check warning.
>
> FWIW that's likely a hack (because IIUC it needs to power up some
> regulator for the sensor devices to work) but that's "fine"
>

I confirm this probably powers up devices, because firmware boots fine
without cx-supply.

--=20

Best regards,
Dzmitry

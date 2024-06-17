Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10DE18C327
	for <phone-devel@vger.kernel.org>; Mon, 17 Jun 2024 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609317; cv=none; b=aLTz6Aj8ukBGUtWRtTambiKEGRdA6tp51KrLV3XyQ2gMirSisCXdiJFCSH8Ul9LB2XaVM7iTVEfxBFZj+ExmlM9/WphSoqDOkX6omf4eX2lg9aTRR5EYTpst13do6Dk3OP8h2Jvc8CEda+C9JltkDkdIRZlOKFs5MtUnOWt61Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609317; c=relaxed/simple;
	bh=LbcaeO7g+XXyhIaUIw2LMzHvMLsMS1SLl4XS875bxSQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=tIVdgxQegLq3GkXLszNwOnX7L25VPBnkJNffsAeR2/v0Bv273LX06ZJyJt/CO+MIN/kbf/r+rfkanS7tH7HX7J//B4f4ESVwD2BEEYCJ0KRCPoTGJhJXBX69LCg/lh6iATmWR23jdEB6CS4w//pIlGGC1iCHKI3Xxj/6rq1oKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Cn6yD3BX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Cn6yD3BX"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso525499566b.2
        for <phone-devel@vger.kernel.org>; Mon, 17 Jun 2024 00:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718609314; x=1719214114; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHyISATt+WJttxke6EIQCpnTGfj4Yi4w9h5lYCsDGOA=;
        b=Cn6yD3BXNbUHuD6e8UeUFwPued5uoqrTSdRLwLV5djzNp37k3xsuocbuXKhvnDbA5s
         tQdheveSiI/PGMn1LiNJKKbdUniLY3wbu89tMrMmzqcG2DQWmPrVeLv26GvY4yWS3IhA
         yByf7bwqOWlCIKujKZOwEUaCcv67kCoX5HBEvVJkbSUM2fRR3ut/pv4UPJBMEctNvyPn
         RjgZYKjosxuAKp+FdnFlmkItY8F3VTDePg3GP604BBDpHAEW6WV0Zbr/3/2DE6VtLi1f
         GS6jP0IehEUZUKpy27BaDfQtrYhqOG2oXwKAYruKLFGqo0ou75MWmWmfUWBJoj/UIfDy
         8LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609314; x=1719214114;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHyISATt+WJttxke6EIQCpnTGfj4Yi4w9h5lYCsDGOA=;
        b=RGojeivPFl1PjOX0vQH9EOvmwVmga585mX7m5yD8d88K90a9kjCq1WxzBr1hIKI2bG
         39wLFRd2qbJuHK/veztNAQEkUhs8L9osBWFVdA1TSXP9MieshMZeXRygQy0PlcFxV+vz
         JHZ/N46JjwDYfIziCGRiyQdiv/wsVbuUbW8WpqSCd5eCbykTTMbg6cyJVc8j3H12nDYD
         tWIjSMv6HDZvq6euNGhYyLPPk5g8LiBGre5GQW3ggdYKyq3389N1enw+yeIjK2dAlbO4
         qArfP94sDPeiY/HKNwyBfK8hf7S18Qemx7QmUrEXvhN+p12/HFf4sxgVZ3rGFXkYlXjL
         muAA==
X-Forwarded-Encrypted: i=1; AJvYcCVRAMbhQ6pwEJTfG7OLAYmDI4VKl1kPRz68oDriwGA79Gjlb6ORR5G3Un9vZVjMaYJcuOoPypgtIuBnLmnlky7i5Vot+r7egBu22s8=
X-Gm-Message-State: AOJu0YypWZTHdDFOGmQEBlyss1dHtmlNdpWVgHe+YTOtlS03zeLwInUL
	KiEk9O+vHYBBCpSV8qZ6rpM5i/mMLs7utyZM6y+bDD6g/dmPvaS1zSENbIQrk5U=
X-Google-Smtp-Source: AGHT+IE/Y4LqXgdNZ0zcQVhr3sQUeAw8IWyATC1u6ONvFcRL9KXrD7KEcyjfA0ImOde2Km0XLQNqxA==
X-Received: by 2002:a17:907:c081:b0:a6f:77bb:1713 with SMTP id a640c23a62f3a-a6f77bb1889mr294286966b.9.1718609313862;
        Mon, 17 Jun 2024 00:28:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da328csm494948466b.12.2024.06.17.00.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Jun 2024 09:28:32 +0200
Message-Id: <D2245MXG8CS1.11EGKFJQLYPTI@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Stanimir Varbanov" <stanimir.k.varbanov@gmail.com>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: qcom,sc7280-venus: Allow one
 IOMMU entry
X-Mailer: aerc 0.17.0
References: <20240412-sc7280-venus-bindings-v2-1-48ca8c2ec532@fairphone.com>
 <D1Q6CMZM78VI.ABYGRRV5E61B@fairphone.com>
In-Reply-To: <D1Q6CMZM78VI.ABYGRRV5E61B@fairphone.com>

On Mon Jun 3, 2024 at 8:39 AM CEST, Luca Weiss wrote:
> On Fri Apr 12, 2024 at 4:19 PM CEST, Luca Weiss wrote:
> > Some SC7280-based boards crash when providing the "secure_non_pixel"
> > context bank, so allow only one iommu in the bindings also.
>
> Hi all,
>
> This patch is still pending and not having it causes dt validation
> warnings for some qcom-sc7280 boards.

Hi Rob,

Could you please pick up this patch? Mauro seems to ignore this patch
either on purpose or by accident and I'd like for this dtbs_check
failure to finally be fixed.

Regards
Luca

>
> Regards
> Luca
>
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Reference:
> > https://lore.kernel.org/linux-arm-msm/20231201-sc7280-venus-pas-v3-2-bc=
132dc5fc30@fairphone.com/
> > ---
> > Changes in v2:
> > - Pick up tags
> > - Otherwise just a resend, v1 was sent in January
> > - Link to v1: https://lore.kernel.org/r/20240129-sc7280-venus-bindings-=
v1-1-20a9ba194c60@fairphone.com
> > ---
> >  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.=
yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > index 8f9b6433aeb8..10c334e6b3dc 100644
> > --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> > @@ -43,6 +43,7 @@ properties:
> >        - const: vcodec_bus
> > =20
> >    iommus:
> > +    minItems: 1
> >      maxItems: 2
> > =20
> >    interconnects:
> >
> > ---
> > base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
> > change-id: 20240129-sc7280-venus-bindings-6e62a99620de
> >
> > Best regards,


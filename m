Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE46306D48
	for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650684; cv=none; b=bxuDC/audvlnl1HdRpR9PtLcXem+w6I8eqof/7MwGzfZvFaFP4ECFEbvayyk9Hr4LN3v3FKOfsi+lp+egpCEou7gqPu77oCaNRDbQRLd9Ahy1EeblafBCtZARTS0j7N5DXUn7Vp60FCWREbOjmr2LcnloEIj7pKWVJB+jEyoSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650684; c=relaxed/simple;
	bh=ZS8D7YevM68kueG73PP38JtCM4/TbPTO+FFQtYA36Xk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YPaatva8rcghyfuIVqjZwI174FSs25z7iD0gwv9lQDdf4RUCipjHAALoOgKTAEVg1gUD1lOQbKTNEzQi4sDe1fUGuHuGEOfA0AhBNs341M1sDmgskH2005gjyJLCME7YV23EOfFZoNL3V+OgnHQHvdBBtJVGcSk90iyW51JI0Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BgGXWr1L; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BgGXWr1L"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b6d6984a5baso935936066b.3
        for <phone-devel@vger.kernel.org>; Tue, 28 Oct 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761650681; x=1762255481; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X0JyiHF22wejOgofms7G80j8gK+WhQgjSa7+ha7gyo=;
        b=BgGXWr1LwuQwdmscGN2R6zsTMYKLiPURTF+5Y4Q8H7w3aRU4OEgoqnpYEGXfYh5gZq
         G3lC6sY0p/BcxJYZZug2Ddmu9t+WdYb+iU1/ib/oesOx9hgET9sEfUN4byOL9oglw8GU
         KKcvmTr/JisJLD56M0RcYg7vq9zp5E2YzqhxCq2rqueuVk2O5UqYY+f4ZdWE3KPBW3QK
         MJQm/SK3L97THbOmhMhNFO7icuodMEIM4bNt2cOH2Y81kBQZAznbmpKzlvPIABvtqb15
         OeQptLrD5PuyllwRoHMzO1qwUO0qyFg8FCDSfnzcmhnYPq5XxCnBsFKJ/OdTGM7UvjAA
         XR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650681; x=1762255481;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1X0JyiHF22wejOgofms7G80j8gK+WhQgjSa7+ha7gyo=;
        b=PfM1zYnJSdoJh/uGs8qhfxx03KRPtWnsytd3xvQwWQFXSKJavxMhvhppaw8Xbb5LRX
         Onr09NJxjWhFks9NmwmQ85CpN4yZ53mWqQMXrWRvP1AyM7yyDRzRrHdK8SNeJWsB4Xvr
         9e1i2hOfB9x2Tez5T/1iUvWar/5zBnR7EaRzDQUXnVliXCPpb0AnGZgs2dLRKls3Ek/P
         lqbenWRym3nHxY/koKmf8+I4v27kVU47WsJIsfWKxWh3k016N6pRCGXTGQK1q2r4pk0E
         SknWBLsePsR9b4Jn4a6qbqszMNOWXJk+tMpDSIHiv/7IRcavXEEvtbebDYt3r6PaVgnX
         H+oA==
X-Forwarded-Encrypted: i=1; AJvYcCU4ujQ9ExBAggvBmuNjEzdJ2S9GYxzPaHlpT5j8siEusAbYBKS/aUQX2aMP7NOXkrmYi/axrvSceZaRsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysGkoBCZ9b5hYlJn8oF41a/V7GEWyiBb1db1UpS+6fxysL3McK
	GQerBlysCbo8op6ONS6Fvj3HX4RwQO6OjoYDFuKM1mNcSliRZ89Q340TjCc1eWpYYFE=
X-Gm-Gg: ASbGncu6JgdEY6ZzIahZ1bkKsSkag5+fKPsvL/3wD8NkTdHXr5nHRst5OUD+a1uZo8b
	VbbhM84zstDzLy7zAkIhG3UahlUG8l9+eEbSXGIyseqydVe9VGn2+NvHaYmkYFL7O4kR3pag2eP
	guOSYM9WpX5Y4UHJ6kjyeFYm1JpaXrRj3YkSiUuaQ3qCvmSZ+e+PD8lzHubD/v7hcycrNhOw2Ga
	5b3AqSJqC1N47lWlv8/T6cQz7dpWSMvG01+/DdsnHHv0u7QCAIUqWhBPXWNnDCtDP9JBEoWjOM0
	AMkvtAZa80e87+aiAqKq00MeglOI5DuO346zIba0qMKky9SxsCJ3mDvenIBMipQzkVVIRDJT9kE
	ukUkM0j4SHMzqeYeP+xMStVoS48WEXM6kePiO8bCVA7rzltnK2YTwhkJa9MqfIfCDyLvuyxGd6U
	LEcq+JPyQneUsOZ5AXLxjr5oYpVo3W+r52vQo05HXwbdmVkV/X7qmqCEbvL+ZFjoENs2Hozf9vK
	EGTPCIxU4VUZMbt
X-Google-Smtp-Source: AGHT+IFncZEIG2aB8fskoYH1N8Pf/o+3C4t3kr4xMiHMDpXB3GXPV+hTSqwVR4PFYW4I2LOJqiq/XA==
X-Received: by 2002:a17:907:7205:b0:b45:b1f2:fac0 with SMTP id a640c23a62f3a-b6dba4a8d87mr344374766b.29.1761650680970;
        Tue, 28 Oct 2025 04:24:40 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077d2sm1068327966b.3.2025.10.28.04.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 12:24:39 +0100
Message-Id: <DDTX1PP2BBSX.WS61ZEATB649@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: qcom: camss: Add SM6350 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bod@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
 <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>
In-Reply-To: <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>

On Tue Oct 28, 2025 at 10:26 AM CET, Bryan O'Donoghue wrote:
> On 24/10/2025 13:24, Luca Weiss wrote:
>> +		.regulators =3D { "vdda-0.9", "vdda-1.25" },
>
> I'd like a little bit more consistency with the regulator names.
>
> 0p9 1p2 instead of 0.9 and 1.25

Based on the dt-bindings discussion, this will be updated in v2:

-          .regulators =3D { "vdda-0.9", "vdda-1.25" },
+          .regulators =3D { "vdd-csiphy-0p9", "vdd-csiphy-1p25" },

Regards
Luca

>
> ---
> bod


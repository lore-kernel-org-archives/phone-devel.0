Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D52405E1
	for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270516; cv=none; b=X3xogDYSeUnbkZlvF5T7WsLYrQRV69L63YEUb2wj8qpQDJoaKV0iFtCBpcqxQiePRzh2J6OZXJ4NmMt4zk2fTbSDzo85Ce6N7XAICPeHb6BJnDiOSlidZYJ2lpD9fFJTm9MEslDZI8z8YkRsbXPiZnhKFOkwJ4vvHBPmFcS/e94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270516; c=relaxed/simple;
	bh=LpPq0O9dCSq2yJKRTchcrI01CNwc9RMMB1sOdqU8n48=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CNQyeVwAqDsGUOxy3NrfXqCra9iVeNdJ90y6EO0bpst/2ysroDUjBzYKIQd0LVaYNH0pDoFZtDVW/yUUwp3L2JUWR0KdnVfQxz8E/B2FPR2fbH9P5csJ2T6jd3zG15lt687SUO4y9is7pRiMZ5oO6BAhou8TuPNPAGN/IFxCsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3o2rgkv4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3o2rgkv4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1040382866b.0
        for <phone-devel@vger.kernel.org>; Mon, 30 Jun 2025 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751270514; x=1751875314; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=3o2rgkv4rKGuVTrnb6FsgGKosPBjftOWxrujgWl+c9P+LgUtrUs97TaF7xDqDGz2+l
         1BgLG/RvA18oiGMuchFqP/KmYDpR/SLT1BMPFWkZu59RXmNvD3G5atSC3T6imgc183tL
         v8RNqPkknonFT/SZpeStUzAeItEDWgrQP7GOZ5QiTXCy1cXFBVfvOSieWXy2Pv6pKXrZ
         FEhTzJmTUs6jbl2c2NGUwtdORHhJKDrZyNFy8u1Eg54nb2pM5SFUG/OXtLJeKUi02m9z
         diqeAsed1DXjDCJ60mQxEgGqyEzdFTCtj8ySzp6ktd2UKhLjkkqGhqJ9A1HeqbRx4xc8
         DgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270514; x=1751875314;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=mwNi5q+34IRGoXMBdnzqQq20adbkVuhBI8opxbRBAkjYTEgPqSOu+Ppon9o7NhVymd
         7pcApiefQIgCCpxmKNAVC6bzp0pDkOKaINd+RmkI/7sY2lr+qnSnx+7L6Qb6yYxuZo7Y
         9VLuszpWw8BFqbIw3LJCkuoZAWyk6G+foc4denv5T9mo+sk1HItmZI2DHuN6z51EcY8j
         P2VMRBmAEKWvlc2a0CxgKE/sMLSOKzUKtOmUNlG/jU5mDO+hyhZdHGBKps1bDzoAfl9y
         GJ13HLO9qS2VFs06CaU6G6pRDoHPEspZ9iWPgA2+aoYRyolmxWCnyY1gHlBrymz8zldG
         K5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVsQT+6hIcMjAGMVPLtd8uofvotCDis3rOewQdLQ5mEl0nUQYaWuAbFj60pFdhILis5VPF97kzMSMDJhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2tulf+RMBok4dDc/iPUEVByzetIswnookFCtmwVEq/lKexF2
	fOs+fU8ojt/n+Of9Qmahb0U22mqVZO7cuUPS3rKLo3f3TzZV0cHJPcXxYx58Mw83Abk=
X-Gm-Gg: ASbGncvPgdhkTFpoq6E9NJt7fzXSRnUXXU4BtiY4S4lqzTlbtY2CZJu7GdMdO2feD8m
	lpAmJNaOUBlHlJ1ahnlY23aMwutnEaTDecnoxjmcojP/Yiqhcy1FzWS90Cbp5tArChGRC498V9F
	k9dXahre4527dY2eIlo2nYmctc/UKu+qV0pj3+wh8gTRHMGLldoLc0xJBT6ZCtWkGTRPvDI7lDi
	avzBxuv8RIUN4bRsjFl9Ocn96Jq45HEWjmcIfllfNDZH8uWvkgvBH5Hs73P/ec73L9qKjuW22WH
	RUXzx70HIuP4sqwqXBfJqNUeaLLkHTNyUEeJ3KlJQ7vHWTX2rZyrMQsdkUmQt/d3NRUiovLcw89
	8L0ImuDvvmO1x0CFMU4q/cPRM/YNViFHtMn0H8GZShenqlukmtI/HVLUqNG4vdkG3eV2yMAC2Tx
	1BMsOOUQ==
X-Google-Smtp-Source: AGHT+IEoVXPzL2X+o6hUB2pvWTzo7iX7ErTJsBfZFxmXtG6Mqo+mQVeD6+zkAYVim486K1lU9hLB1w==
X-Received: by 2002:a17:906:4783:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae0d27309d1mr1642905366b.17.1751270496717;
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01641sm630119466b.77.2025.06.30.01.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 10:01:35 +0200
Message-Id: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
In-Reply-To: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>

Hi Konrad,

On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:12 AM, Luca Weiss wrote:
>>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>>> VIDEOCC on the SM7635 SoC.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (10):
>>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Contro=
ller
>>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Contro=
ller
>>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contr=
oller
>>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controlle=
r
>>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Control=
ler
>>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>>
>> We had a massive yak shaving patchset go in this season, please move
>> the magic settings in .probe to qcom_cc_driver_data {}
>
> Okay cool, I found them
> https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982=
706.b4-ty@kernel.org/

For camcc, gpucc and videocc it seems quite simple to follow these
changes.

For dispcc I don't know what to do with this line.

	/* Enable clock gating for MDP clocks */
	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Do I just keep the regmap references in this probe function and just
move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
config struct?

And similar for gcc, I can move the qcom_branch_set_clk_en calls there
but the qcom_cc_register_rcg_dfs needs to be kept.

Does that sound okay, or what exactly is the desired outcome of the
requested changes?

Regards
Luca

>
>>
>> Konrad


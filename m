Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934042550D8
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150334; cv=none; b=shwTl/+X/gEis6tGscI6qDl4D1nT69pbyZkW5q0Oko9t9ruRH9ADhGXg4d8ejeb0Il1Kef9mYpbRuTGDF7PhfrT+m+A3B3rmJR7iLxAFugzmIEPj6mk0tRheSFzwClHf85dSrYmhs7aYCKt1w6ZGu0kc50Wseu3RDwOsxbGKLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150334; c=relaxed/simple;
	bh=tXi+3udgGBPcB1usSt++Ta3sqSt9dsDiajyFn9u+th8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=AWbpzBpgC9e2odJ8EeVD6chd0L+FRbPv1BhA2eez9j/ahCYW5+JoY/yA5CAMCicEDjEGXKv4Yb/U1m+85B/ly39iCcz41bzEmAZgF+LagdwJOZKa5TXEaP9JkucBHIUr7k8jkEjRfqcIVmEyhtGG2xt9xz5jcBoabQA+UcZlZzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=h4y9XAzU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="h4y9XAzU"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade5b8aab41so156949766b.0
        for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752150331; x=1752755131; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xwbim7kMT0dZOrtg1YvEDqv9pTaWeBwXvEocCP4T4Us=;
        b=h4y9XAzUlMrVAxtYT67ddWP9ZrYnX8dph0zK5U2Yx9j6OsvLjVr2eRqZyWB+zZhqNf
         LL27iWm7JNub+X5pS97wxAeuphaFpX3+3tPRfSJIsLx5DGb79jIMmuI1utZPF+dnAu3K
         BHSWABLsIe6idQWsdyzMKXJO5x6yuwsOILuE03MZb7SsExndYfmw6y31hE2ceSh44o8C
         htBuOGOdYC4CAwAXpG+4zC3FucpD+hegDYDFxrMsjYaWpFdhnpwLNd6zDeOgoOzL5ZKV
         ZOHIIkEhdUg8rjfkj769g/ddK4huRso/+0N+KUfDhNLlkFR9Q7QLoGSFjt4xhcgRDFhP
         06tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752150331; x=1752755131;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xwbim7kMT0dZOrtg1YvEDqv9pTaWeBwXvEocCP4T4Us=;
        b=WxZb9GjRVdRAlhwCZcYtnC/KBNGrdAPdcz8icw3zFZ4g+7ux7r1rd9vahfM0ddSV7c
         G+GZlx8/TYFjxIwUcb0Ygarh6PgXrdmlinvNvabTp8SWIYiVvTPhEAAuCHFPOtVVUwZY
         9fuCoHzpWz8JmqcnDmsvJ356Hxfi263COoXIU/FeCeVTgZjW7bxNQJ3pZKfYhzrWBdz7
         zy1xwJp7N+KChR3Wn3Du3/G82e5kl8xa9ReZkAEEBvwQg5weyccX8cfDld/iPsyREl81
         00RDHfAojnCTBltSNv01zieCFbgyBcoUtEqterytDtdxzTBPVzRSFreMXl//VHsvw+qo
         X1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXsKKeU9aMbYFwySOIYD+4oJF66uksqhd+PYUevyFuRAi+mXFlVXmZhP/+LqPuzc5dZiDwIuLPF/UQvhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx38iZpDadbmVrdQUzLCwEsGaGQkLtIb3onGuBQLD5eL1JL/cK8
	0EQdKlGfZ78OeoGzQ50k/ZFrVV6s9EESvmLnTSJjk4A+PgKwMiaYLW6tyeudeKWIjkU=
X-Gm-Gg: ASbGncuzeN2jqffaykcwugR6yig3K5jLNFRuU5QzMgaTsiDlf+nIXACz0B6ZBtOyb3r
	C42yD5xKoekT1UuQqGDXSk4FmuwmCbaqZiy8jdQbNGdWmN/SAAOpiOc59q8hEh+3LlDMPWUvX7s
	J3oKpDJEPfETPWmqOSD3UeoCmVInA5xqYWIH27ZIXlY55VoyxPENp/J3WkzZAkQ2YTNenPrEFoS
	UG1JVjNTsERk3ydvSP9XRtdItNzLk+mV4FiEZzBTJtkJhsBJyT6K88wfQadvlxp/O+3TjjF6NxD
	ip8WMUTGsus5uccjErbhY9toZSPlzd1i5yVqCp86xvoR4ZnAsE7OM+NF8TlWbCnOrQywNH50pbb
	Y0qUUWCeBuo6dXFgeBn4d9FmOvfNShDg=
X-Google-Smtp-Source: AGHT+IHgPoXaBYMtzbuGf92TYy9uG1SRxa3TcJ8k4yFuiO+mhGC+1G7Z5mU03G7kTXV1yim8ZigM1Q==
X-Received: by 2002:a17:907:ea6:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6e70372a6mr247071066b.30.1752150330835;
        Thu, 10 Jul 2025 05:25:30 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826461esm122729266b.100.2025.07.10.05.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:25:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 14:25:29 +0200
Message-Id: <DB8DGDEN23D2.1GFB8XI0P3YLR@fairphone.com>
Subject: Re: [PATCH v2 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra
 register write for Milos
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-4-4790eeee7ae0@fairphone.com>
 <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>
In-Reply-To: <7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com>

On Thu Jul 10, 2025 at 2:10 PM CEST, Konrad Dybcio wrote:
> On 7/9/25 11:18 AM, Luca Weiss wrote:
>> As per the downstream devicetree for Milos, add a register write for
>> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
>>=20
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> The downstream driver supports an arbitrary extra init sequence via
>> qcom,param-override-seq.
>>=20
>> volcano-usb.dtsi has the following which is implemented in this patch:
>>=20
>>     /* eUSB2 HPG version 1.0.2 update */
>>     qcom,param-override-seq =3D
>>             <0x00 0x58>;
>> ---
>>  drivers/phy/phy-snps-eusb2.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>=20
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index e232b8b4d29100b8fee9e913e2124788af09f2aa..87fc086424ba4d9fb3ce870a=
a7f7971a51d4a567 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p=
)
>>  	/* set default parameters */
>>  	qcom_eusb2_default_parameters(phy);
>> =20
>> +	if (of_device_is_compatible(p->dev.of_node, "qcom,milos-snps-eusb2-phy=
")) {
>> +		/* eUSB2 HPG version 1.0.2 update */
>> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
>
> Said HPG asks to clear bits [7:1] on all targets

Okay, so make this unconditional and only update those bits instead of
writing the full register?

Keep the write at this location, or move the code somewhere else in the
function?

Regards
Luca

>
> Konrad


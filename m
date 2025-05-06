Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528C27EC67
	for <phone-devel@vger.kernel.org>; Tue,  6 May 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533256; cv=none; b=FwykTFcimPSsFMr+Kzm+Zijo756IKT50tsCnKRdU6oOGqy8eyVqdNEz2pux1Djfgb8oa5M2QwOUqdPbwm9B5ktZcrDNM9m3RGHUfrbdx1K2Y07OnjSYZuWeQJm1bbjnS61O/YPK7Ejudf8bpzUccpR9YVmMV10CM8MnHScHtphA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533256; c=relaxed/simple;
	bh=SeRmzyMcT6JX37/ImDnhvHk8HNSqfqzsFYexZDstrTc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JX0nCZVMruG1PtXtP++kG+esORT2ln9utoCyaWXqw3NizNCH3RPE1Jrds+QDFjvcWxJyiH/Kner6BhHCEKy41dQ99iiw/SPTNXuUiwl+DT5i4TVik3+ATzjZ04YK2vllSekJqnwNZ5PbPSopaV6vYZA+VYxNES5sBIg3Msk+CgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cusdtxba; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cusdtxba"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so2370432a12.1
        for <phone-devel@vger.kernel.org>; Tue, 06 May 2025 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746533252; x=1747138052; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7v7vpdvOuhIP8be0gZZCUIgIPmqxbVGMYXTijnoryU=;
        b=cusdtxbaM55uSkeGT6mg39KJxRPo+aL8KfVGdhhHfRpJhL8wfwON1RPyv7yi1LPyqL
         nmnLp/IHdUnnG7l6n3DW1CyN2n649CiPCxGhxTcWCEgklVcvTor0muHnbd+a9KcKy6Gd
         P+JPojGHdB982humWyFyvtzX4UFEWlIwKOVmRam9QdaZKCtDyuQLRCaRmkaun4fsyK5J
         NuVVHnFAEjQuZA7y+qnmJRIkB8tm11aflTU7BRrkOVRLrveyqOYmonzoNKUQtLYkQuLN
         r1b8IwWSSJv1jvwHfwPHvH98CqwlAxcQKYsO6SxzZCkYpZS9e6w4zqvHdWUYLgPZG14s
         h0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746533252; x=1747138052;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7v7vpdvOuhIP8be0gZZCUIgIPmqxbVGMYXTijnoryU=;
        b=iS6bwJd8vuB8+SjBwJLDGgvf5svgPMJLl1IvCNFT+Bogz8MbA5ECI8R7QXYG7R5q81
         N+YimET7Got/GMG/vbnQRTbAvR7SsqRa2zUE5toKNWyyFu/Cf+7ybBi0tVs4ZTnyMEUB
         uXyaXrMYQO6M57OwHg4SDCVDvaOoUARkY7++gBhxCbnYpGPRLXDDD0vL/3MDu5HUvAS8
         teofGYAFVfQZ5i8XBz1ZZYzcbT2347ZyXTehX+De8NCq/PDbAOSCroxPqPCv4QQ/h9al
         Jt1GG9WvBlTUhlRVA73GLF63jd4MMTsm5fMfao+zE5krtwNAzBKp++BY0b2mTgA2otuD
         9baA==
X-Forwarded-Encrypted: i=1; AJvYcCX1a4ENfZzbwZrK5HWigcpIVhCw8JkUeBiFM3ab5vsmhX95wkAKVFnjvzC6R7yUH+dDxBL/1iHnI/np7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YycFxAy2l4OOexhGbcP1C3WX+RkICKyv+XDsDhCJjPJzsS2aJeH
	lBfffHa2TSvu+lgPlqgeAeNFGlPlGCq+Zx5clQAcU/l9+YfKF21OOgu1+EUZVZM=
X-Gm-Gg: ASbGncuWvdui3zUaKXcxxr/cZBxTK+i4UKksplJeqdLwE/wkVZicXV0aKPo0fVrA0lS
	aIHAsGvO7qYvwPtrzM+oS8FKKSEs8emiVXLuXGbfC3P+/9+y0txmKEqlWuVFO226ggp4FhnipZM
	4XQikT0bPIucTqJBl0PXeTjpTsPo+YtpnqPhKsWT2ZT02vZnINDSz61zh7hakelCRwAtWUVnQ25
	pxhbJWaXuzz+WDF8eRfYh8Qjsa2xslK0cC5xkqknDDbvbf8tC9b/hmyNmznwkLMBf0ZYEcKMnIO
	OJrylg9z67imO5TJZcxrQsqfavekhSIqr+tBab6IKIOAZeF3ASvPT3yh3RA6Mg4H7pd2rw0D766
	qup2Xg80NOvmLOX1BsRxn8yS2qDUhgcevy1xrYcHBRH+BYtwkNA==
X-Google-Smtp-Source: AGHT+IFBdvqmi68ta2wRWiT+FRzasDJ5pBCULv7R/+BuR+Ax+JNv4/CaLyds47/kxsM107rKwn7PFw==
X-Received: by 2002:a17:907:868e:b0:ac2:49b1:166f with SMTP id a640c23a62f3a-ad1a4b36f20mr1047373266b.52.1746533251536;
        Tue, 06 May 2025 05:07:31 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a5e1dsm704170466b.55.2025.05.06.05.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2025 14:07:30 +0200
Message-Id: <D9P2D6PG7420.N4T2UBGAOFMR@fairphone.com>
Cc: "Banajit Goswami" <bgoswami@quicinc.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca@lucaweiss.eu>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Srinivas Kandagatla" <srini@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <aBNdCRk_fP2q1vxQ@srini-hackbase>
 <91110CA9-6E83-4811-AA04-C0312B99B95E@lucaweiss.eu>
 <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>
In-Reply-To: <0d094cec-0a2e-4e21-845f-977f3a77993d@oss.qualcomm.com>

Hi Srini,

On Fri May 2, 2025 at 1:06 PM CEST, Srinivas Kandagatla wrote:
> On 5/1/25 15:13, Luca Weiss wrote:
>> Hi Srini,
>>=20
>> Srinivas Kandagatla <srini@kernel.org> schreef op 1 mei 2025 13:37:45 CE=
ST:
>>> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>>>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>>>> SoCs. But user space ALSA UCM files depend on the card driver name whi=
ch
>>>> should be set per board/SoC.
>>>>
>>>> Allow such customization by using driver match data as sound card driv=
er
>>>> name.
>>>>
>>>> Also while we're already touching these lines, sort the compatibles
>>>> alphabetically.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  sound/soc/qcom/sm8250.c | 9 ++++-----
>>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>>>> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc40=
49f35deba828275478 100644
>>>> --- a/sound/soc/qcom/sm8250.c
>>>> +++ b/sound/soc/qcom/sm8250.c
>>>> @@ -16,7 +16,6 @@
>>>>  #include "usb_offload_utils.h"
>>>>  #include "sdw.h"
>>>> =20
>>>> -#define DRIVER_NAME		"sm8250"
>>>>  #define MI2S_BCLK_RATE		1536000
>>>> =20
>>>>  struct sm8250_snd_data {
>>>> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform=
_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>> =20
>>>> -	card->driver_name =3D DRIVER_NAME;
>>>> +	card->driver_name =3D of_device_get_match_data(dev);
>>>>  	sm8250_add_be_ops(card);
>>>>  	return devm_snd_soc_register_card(dev, card);
>>>>  }
>>>> =20
>>>>  static const struct of_device_id snd_sm8250_dt_match[] =3D {
>>>> -	{.compatible =3D "qcom,sm8250-sndcard"},
>>>> -	{.compatible =3D "qcom,qrb4210-rb2-sndcard"},
>>>> -	{.compatible =3D "qcom,qrb5165-rb5-sndcard"},
>>>> +	{ .compatible =3D "qcom,qrb4210-rb2-sndcard", .data =3D "sm8250" },
>>>
>>> sm4250 for rb2?
>>=20
>> Since this name is visible to user space and used for picking the UCM co=
nfig, I don't think it's a good idea to change it.
>>=20
> It is not correct to pretend that rb2 is sm8250 for ucm cases, I agree pr=
evious code was
> already doing this, Good thing is that we do not have a ucm written yet f=
or RB2.
>
> Lets fix this as you are already doing this for other compatibles.

Okay, will change this in v4.

Regards
Luca

>
> --srini
>
>> Regards
>> Luca
>>=20
>>>
>>>> +	{ .compatible =3D "qcom,qrb5165-rb5-sndcard", .data =3D "sm8250" },
>>>> +	{ .compatible =3D "qcom,sm8250-sndcard", .data =3D "sm8250" },
>>>>  	{}
>>>>  };
>>>> =20
>>>>
>>>> --=20
>>>> 2.49.0
>>>>


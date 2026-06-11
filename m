Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8F540D580
	for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172978; cv=none; b=ojbx4mLfkmalRbrQQ4S72yCoiayi5hPoyD77inwQg9rzpx4uB7kaU/s6y0VeMvYIcDOiZynHWj49s6lifp/zlK/VE0I8kfRZBfrYAyBvYqkRmljMX2gHKaqOgJN8cDAuIaamETJ05IHnT0M/iBXekYArdmLZelIixLTy0rKAfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172978; c=relaxed/simple;
	bh=rnRpWmG4J48ZICobw97cnDsqPP732sbLJJ65tkBqeIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QGYgjCZJv7LnhVtNylrJENZ1dlZg82Gj72/zqWeyCwV+oxnRjRkFJqIRMb8cpaDADfTaPXutJ1H4Z71We3CoxlM85+xcQeF2MyavJR5XoH0SFRN2rJW3vam+mvG30LKVnZDL8/WRQtLTg/+ksQmYt5jeBnOXMGk3a6xWpBhK77w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G69zae+J; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G69zae+J"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so11415215a12.3
        for <phone-devel@vger.kernel.org>; Thu, 11 Jun 2026 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781172974; x=1781777774; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhJd7zCUXuRcUedlV9DBkM4yrOANKOlgS/yqDuehskQ=;
        b=G69zae+Ju4pHWOEwD23d1mRyH38is151jX/CezTDqRVv3gOUkTnhdclFRM6XeRHpix
         w6g+APpYd1G+cXckv2l0Z0+KFgmvnZ8cZNkzCswJ3ksYOGTMKHA6ylxgnvLLVznzmEAz
         +7q7hqpINdptlgQnv4LU+HTPHnS9anEQjpN5f0D3iz8u5ZclpgdgNtLsnqKH1+j3vVrP
         23JqOqtGeNW5Ef7isjufuKrq6P/qS5p9qTix63+uEDiM5y0icnOr0QeLI4OZDMRUAov4
         8yq7Hb7HniZTFKh1piEsTwpAr+xsVjjGcdJYopiXeTp/QcD9TH0+f7Iym9wAxiHGUkMG
         bqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172974; x=1781777774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhJd7zCUXuRcUedlV9DBkM4yrOANKOlgS/yqDuehskQ=;
        b=YbCpejYJPGnoCoLWOHtAp5hnOIo8K6ewgt5n9zSHhDiGmvB5oCiQ6quxKcpmoZUujJ
         gbm4z/ziYfw73IwQNYF/yNFbxtDY9VqsCJELnH5X2hiWGq0b/46FlLFSgyMq8vqhxgdD
         YfswzGm2/g3L3wirpwvzC2rQuca5Mc5wi+lv2QLsLjqWZ8X5w0XcZnb6/ifgXiGa8rvX
         THAR1Ls/6GFVoYMX08FAL+ZuyPTMzkYmFr4Bt+8Nuz4DVKFkLOlO4R0cBcf6EdfepTBa
         VyOL7wTXqgflNHN/g/wmMdkxEC4iE1zVNA24WsbohaCxC+VKTgPlghk2prmOiTMoJ762
         BvyA==
X-Forwarded-Encrypted: i=1; AFNElJ/gBFYC/DA1Oo3KKbl0YOH9P3f6E4wEFMHu1snEdR6MSXTnjbeBJJOc/tp1G6CU4n1hwQKpFlR3IJXDHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6ZH/cEUmWGDnKRkcStxaMmvrp5P/xgEFRMfEZtmqLdIVXZGd
	2Jx9PPLUIOdXpxOGagzbUNQDxHJm5ujGAyUcHPqij6uf3sexYmwVjiyeGFnksNc4vkA=
X-Gm-Gg: Acq92OGFKnMCvTSA8w/ySwbWwCTFJhcfQZrBKGviN8Gau9hy52Oci+3GRUlzuGEQZMN
	aHyBJplIHvj2YQf4W7g7CQ1NrjxomKqgosBKXHO5D27nt4p7RwXnT/qs+e8UXc8o4GTTeIxzNlj
	o3pCvLu57e/j9dh3ROpNUxtQ/mptzPKOJXA+uws0DZZF7AmWdD15D9vdPDa3WeYQOkC1IBil4RD
	YLVt+zMM9i11SwGhcVk9/3wY+e4rvtJmDivpXrAMbo5GZtxpSg/taFOnavUGZCDKQ5+UrGOaKwN
	ddymvGDjEwF0ioF8g6RgGyK8c6L1eP3c05ESL9swMUL1CTQ0pukcR92Xj63gh4B5CJEHCKhVLVo
	2gWLliFQkfCWUozVwA8q0J3Ym19pVR+Bxp4OZN8ey8BUYxJ75vKaZ241bSzLW7pGMuc7fGq/7LF
	0DbY19+cdfiWzSOPjiHq+Q7MP9f6+EE/eG9EY21NIWOcwpDuT3JleXeXemnnCjLBwUWsEAGzeZ0
	NIeO+c=
X-Received: by 2002:a05:6402:4405:b0:692:4761:989e with SMTP id 4fb4d7f45d1cf-6930e2e5988mr1051968a12.13.1781172973893;
        Thu, 11 Jun 2026 03:16:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm10571626a12.17.2026.06.11.03.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 12:16:12 +0200
Message-Id: <DJ654FFH3T09.1VKAT493JUWP3@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version
 for SC7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca.weiss@fairphone.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Dmitry Baryshkov" <lumag@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
 <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
In-Reply-To: <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>

On Wed Jun 10, 2026 at 12:52 PM CEST, Srinivas Kandagatla wrote:
>
> Thanks Luca for the patch,
>
> On 5/26/26 4:03 PM, Luca Weiss wrote:
>> According to both the static definition in downstream...
>>=20
>>   yupik-audio-overlay.dtsi: qcom,bolero-version =3D <4>;
>>   #define BOLERO_VERSION_2_0 0x0004)
>>=20
>> and the runtime detection:
>>=20
>>   CDC_VA_TOP_CSR_CORE_ID_0=3D0x1
>>   CDC_VA_TOP_CSR_CORE_ID_1=3D0xf
>>=20
>> SC7280 has LPASS Codec Version 2.0 and not, as declared with
>> sm8250_va_data LPASS_CODEC_VERSION_1_0.
>>=20
>> Create new va_macro_data with .version not set to use the runtime
>> detection and correctly get .version =3D LPASS_CODEC_VERSION_2_0.
>>=20
>> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default code=
c version for sm8250")
>
> Can you help me understand if this change was fixing any issue, if so
> can you pl add CC stable

I'm pretty sure that just came around because I was looking at the
different parts of the audio stack and trying to figure out if there's
something wrong somewhere, and how the different versions floating
around downstream & upstream & documentation match up.

I'm not aware of a situation where this change makes a difference -
apart from the dev_dbg() print.

>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> I'm fairly confident this is correct, but please someone double check
>> this if they can.
>
> Yes, you are correct, this is actually Bolero 1.1.0 Version where things
> have changed in codec. if you read major number it will be 1
> This has been artificially tagged as 2.0 in the driver.
> So the change that you are doing is correct.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Thanks a lot for checking! Opens even more questions in my mind, why
1.1.0 =3D=3D 2.0 but somebody somewhere decided that at some point I guess.

Regards
Luca

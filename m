Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B46145348
	for <phone-devel@vger.kernel.org>; Mon,  7 Jul 2025 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751896200; cv=none; b=F6rxggNA7JhMbWyt7w+48Qe81igfMdawf3fTHijPKr8cjkcf2R79Zb9bMfUDElKyryz9QzRFZdpVFxbdbiT/iOkVNapHYQOmB1VyeXITqom2yLQzDJTa5PTtwlX+tasH62jzqbR0d4tEOy+VGDHrNCSvbngskekbCHxngH8LUvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751896200; c=relaxed/simple;
	bh=4luD94zEk/hzW29upK2TZa2T7UiavJ6bCdqdzulQjJM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hbjPhO1TXVCThX48Ak0aN0G/uva+VlUpBJnDapslDgrZZ0R4Z2xhIyA5d+G0mHkvE5jud7Q8mtgHKglo6nGZ39CFACJ8ctOYQyMuX9vnXvzqu7UuzFVpZSL/x+aLMVYISTPqSz927DrKQzlwPuORuOjQLwvp8cohiiSARs3OAo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EFGTtkZP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EFGTtkZP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade5b8aab41so655271366b.0
        for <phone-devel@vger.kernel.org>; Mon, 07 Jul 2025 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751896196; x=1752500996; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zyQsmDxtSSwWfwFyswcoFXsE5e1vPtKLX9bKtkWsis=;
        b=EFGTtkZPoDGNBenLlDebPipNIHoJAV4LY59Kj4OGN+LN005+ffaPDhF6TlqwP+mq6E
         hXSdDcVu5BM2rSDtMuhwh/oKAbMtKWkLE/Yf851nhAgVyieNo6BkP8v83arMW6jyUgdu
         Rf/ROko7f5++Zsz8z/9eVJo1fNugTrt7BHf9991Fvzb+JuAcTsjREFGys784yMxeZp+t
         Bsp7u4I4Ewt4VpE+ACiU5YENRZ3zmRQgNccmkaYxokyMBoLRAG3o4AoBMJoof/JwQH74
         d67cXli1+q6DXRUcs4ilC5hlhQKpQrrCBclSlxHQytAJbYP9FfcoRrj13orZ1RMZJpZp
         1cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751896196; x=1752500996;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0zyQsmDxtSSwWfwFyswcoFXsE5e1vPtKLX9bKtkWsis=;
        b=kOnSvbQYgSgPrlER6/wKk69J2AhWiaLd0yc2dF8CFzqWLyIQgsPBVmhiA17DitxM3t
         F1KyTa9N3HbvGB6hfOmhKkhF0+/sQpWA1UPJsyUFhutWX3C0kYgdjD7SjETNOuysU5ZR
         NGv78qJ4LlKfvIhGur78pBRnDSacExyuubu1Dwz6NLooP8koxr7Irbq1/ZIF/rSPHj5Y
         MAmeAjhLjWirYBYxt018CYykWzqlh9E4pOXSGy5TNDodaw/8zjAURllzsijvYIiikaUg
         TB1Q4UjzVIfL0YCMnftNiX2qbS7Hc27f05NtgIf+1fI2Ho/XFAZf4PqxNEViW/XFnCHo
         crkA==
X-Forwarded-Encrypted: i=1; AJvYcCWL5Ti+TmQB1ZL1frUoQ3ecDVR1sSSNdtwPylDXLKH9IN2jLeX17Ytshd9a9qUYHdFX1RHiTaGmezQ4MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsCVfRrQwaht44F3oSizfW7XWBr9G32MdjAb37bNnqDQTdLSnw
	4lxNWc7NswS9JLQ/vtLnYRgIaOkYVyPpBfhEBsCBoiDWujBEwRp8Z9qYGxHJNOWZmb4=
X-Gm-Gg: ASbGncsmEG7+xwJcGwGDQBxaoVWReI91Smupb8HPAc9lz+IAvsGvJMjWdc3LaPdckJ/
	ZXY2Dz/D1MehYjMwdpkkthqj8CkWCbF22p5aaf9cU/ga1lU6O6FrDjW7riRPsQhV9I4rCrmYy0g
	rPhT+5y7CF7H1vvSrakfgbLurPs7o68j1DMD8UmwPngnfk9wunrrmgjoRLRA3ww9f1miMEXvUvG
	JM061IxvaSuM1EdSFO+mANVZisXU7ZQKMk8CxdYx6FraorvEeKNWlHzbL1yd8B982jOSxkJs7Cw
	vzuunLJSWikimT4qPaQhcBMvACvDdOjCHKIM8xmmYwRnTjDQDX9y/6UboDica3LbtlAPbzqVB+l
	tFE8BTEWrdIToPWOGiPbG5H7iSVAD0cA=
X-Google-Smtp-Source: AGHT+IGS6AceJdvZjybPrOvkELUyoLgdZjzLvFcMOFta4Q1dd6p+klkTcLpeNvXPfTL15dUroYXivA==
X-Received: by 2002:a17:906:6a05:b0:ae0:e065:de05 with SMTP id a640c23a62f3a-ae3fe5966c4mr1393350066b.3.1751896195957;
        Mon, 07 Jul 2025 06:49:55 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60ff11c3e83sm4012090a12.66.2025.07.07.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 15:49:55 +0200
Message-Id: <DB5VDDKCAQQG.LDCMHXAZN17S@fairphone.com>
Subject: Re: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
 <06760125-4800-4068-8936-dddf27c28d17@linaro.org>
In-Reply-To: <06760125-4800-4068-8936-dddf27c28d17@linaro.org>

Hi Casey,

On Mon Jul 7, 2025 at 3:23 PM CEST, Casey Connolly wrote:
>
>
> On 7/7/25 12:18, Luca Weiss wrote:
>> Add the power domains exposed by RPMH in the Qualcomm Milos platform.
>
> \o/ codenames!
>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>=20
>> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmh=
pd.c
>> index 078323b85b5648e33dd89e08cf31bdc5ab76d553..e09552a469264f28952fc46c=
3ab8c125e87310da 100644
>> --- a/drivers/pmdomain/qcom/rpmhpd.c
>> +++ b/drivers/pmdomain/qcom/rpmhpd.c
>> @@ -217,6 +217,24 @@ static struct rpmhpd gmxc =3D {
>>   	.res_name =3D "gmxc.lvl",
>>   };
>>  =20
>> +/* Milos RPMH powerdomains */
>
> I can't find any public docs telling us which SoC is Milos (the only=20
> relevant result is Bjorn's email asking you to use that name instead of=
=20
> SM7635). So for the sake of future generations could you reference both=
=20
> names in a comment somewhere? Or even the commit message would be enough=
=20
> tbh.

I don't know the full list of model numbers for Milos. I assume it's
SM7635, SM6650, SM6650P, QCM6690 and QCS6690 based on the info I could
fine, but such info is hard to get. So this is not a definite list that
all those are actually Milos, or that this is the full list of Milos
chipsets.

> Off-topic here, but maybe it would be a good idea to add some Qualcomm=20
> platform docs to the kernel with a table of all the publicly known names=
=20
> for each SoC? This would also be really helpful even ignoring codenames=
=20
> just to know that SM8550 is Snapdragon 8 Gen 2 for example.

So far my source for this has been the postmarketOS wiki, and this
Google Doc, but the latter hasn't been updated for new chips since a
year or so, and is also probably not very complete:
https://docs.google.com/spreadsheets/d/1WrKHLj_oSoiykhSc6xqXAkT3nlD2hq-fzUP=
SGiq3Kbc/edit?gid=3D1270863184#gid=3D1270863184

And I've got some notes locally for a couple that I regularly need.

But I'd love a more central place that isn't specific to postmarketOS
for example. Not sure where though?

Regards
Luca

>
> Kind regards,
> Casey (she/they)
>
>> +static struct rpmhpd *milos_rpmhpds[] =3D {
>> +	[RPMHPD_CX] =3D &cx,
>> +	[RPMHPD_CX_AO] =3D &cx_ao,
>> +	[RPMHPD_EBI] =3D &ebi,
>> +	[RPMHPD_GFX] =3D &gfx,
>> +	[RPMHPD_LCX] =3D &lcx,
>> +	[RPMHPD_LMX] =3D &lmx,
>> +	[RPMHPD_MSS] =3D &mss,
>> +	[RPMHPD_MX] =3D &mx,
>> +	[RPMHPD_MX_AO] =3D &mx_ao,
>> +};
>> +
>> +static const struct rpmhpd_desc milos_desc =3D {
>> +	.rpmhpds =3D milos_rpmhpds,
>> +	.num_pds =3D ARRAY_SIZE(milos_rpmhpds),
>> +};
>> +
>>   /* SA8540P RPMH powerdomains */
>>   static struct rpmhpd *sa8540p_rpmhpds[] =3D {
>>   	[SC8280XP_CX] =3D &cx,
>> @@ -723,6 +741,7 @@ static const struct rpmhpd_desc qcs615_desc =3D {
>>   };
>>  =20
>>   static const struct of_device_id rpmhpd_match_table[] =3D {
>> +	{ .compatible =3D "qcom,milos-rpmhpd", .data =3D &milos_desc },
>>   	{ .compatible =3D "qcom,qcs615-rpmhpd", .data =3D &qcs615_desc },
>>   	{ .compatible =3D "qcom,qcs8300-rpmhpd", .data =3D &qcs8300_desc },
>>   	{ .compatible =3D "qcom,qdu1000-rpmhpd", .data =3D &qdu1000_desc },
>>=20


Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5831280D
	for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459025; cv=none; b=EP6cCz1OiQwEFp6vzLXtEwZ8AbIF8Pmdmgz+FiQqQJdlTSYNpdtATw7ZbTxQo8w8KJ5Mqhqvyd9S4MqWQu7SHU1PFa9+iwsaNn43CkUMqyTvKLR9bcLTXqxmehKQ88SDdsYf81fdZmSOHBlICx5nDFES2nsLsod/AFkSxVp9Ft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459025; c=relaxed/simple;
	bh=QkORPaFPwCkJw2PTlt9CLHW3UfkaqxDK0oZQhFUaUUI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Ud3aeKVJ2cTlHyNBmDp0ynaIzyC4yZOJX847SYekHY8xpUaNVuFMQPTJl0XJ2IVroOoT4jWXbEbphhGFCfzFJYozxbsM0lnD2ORbDxpFtXKd/RqqVkcnZGUP6vkZiit0IKqjsad7IwbVS3lzHKK6J9hyChMZMbTwLpCAohoayB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=AOzjmjLE; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="AOzjmjLE"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so7288462a12.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Nov 2025 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763459020; x=1764063820; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kFq44+Lpbf++jR+7pJqPo09W9HDnlu7As7z112j1Xg=;
        b=AOzjmjLE/CJZy+/mVVpthXaASJkUl8AIoRNSCvvidpQz09g3eTb9MpuZkkHAT9f5WS
         6UUFUBUX1yW9hmLR0hpbiuhpdHxJBMG2Ae/TfjrBaEqkYyBX9n8+uaqelz2GxZjX2psM
         NJ7BO+7/QVd0p99IzPGnR5us/z5iRq3vJIY7Ru7NBi3ID3QpVlkDx5IemLwfB4iEKImM
         8Mif0HKTwxTlpSVSLDxx0YH545DYbhMYb+JBWimQeKMjRM499RnMXNnxxmuMNw7Tq9tS
         PhflSn4lVIDxORys5YTQS6LMpllUf2hIV9PA6cPZs0UGuYjSlTNTaxWEW0NbzzRZ77H8
         FDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459020; x=1764063820;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kFq44+Lpbf++jR+7pJqPo09W9HDnlu7As7z112j1Xg=;
        b=jjIg6ImiVSNRmY9NnfGgRQFdfFJ2YJj6enYKyhhGP/KR7g0jKnoR18vFcj4JXtBsCG
         5IlbnlE8BxTNl0IGncZTMxEBakOpaIgF/3vzH5/gKLXUKSnyLHA1xTv5tzyBUNi9zDmn
         2VHUt7VI6E3TEpOouwMkyx/rbQBo1DqGpMiHA80JPnlC/7I0LA9n3aKC8F+P9/JUx+Qg
         PgWK0bZbnqReikHtDBGwdwKu9u/VdRkk8fg2irT9gvuZlZMVJ7LatoL8LMUy0Bieu954
         2xoZvz9K70dGPqCUduqiDv4OP379mDakVTBf9f0EJda9spc2p1ocbKo2nFQo65gFFWxO
         u91g==
X-Forwarded-Encrypted: i=1; AJvYcCVpzXn17HgUb55bv8XnW8+0LSGNAWe66ZVbHTftkLAQcxx0219Z2VmtBA7VleVAicl0KZpHt2wENcGEFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLCDZcdXk6Qr6K1hboT9Pq49GUoerDTWZWmYJcTU0gsIei4nj1
	U39p1JCBPwXwXAqkodJf03rkrUH2FLhyjwM+Nlo7WRScI269FU9Y3O3ZKJOqvAfgAmg=
X-Gm-Gg: ASbGncswt0rrtUfkcPUFP+JtWsImXdJDcL5R2CwWpg7GshFhxG8mYcqMwupR2OZl689
	K5KvH8rl8XY0rN1sQtg7Pq7TsGreZLvHa9Qjs5Q2g0qOa7+UFfFYgBfK654wapi6X07yhqDSfeU
	DOUw3xXlSNbsTv8apKZeEewDBs6HFU1fyTDtHEt1oaswOx9PFAoC+ZF+WotdjqvTVFz0p+Ow9pf
	C/BYrX0PJRZ+aCOc1FcH424HOJay8ztjED2yMlUXK6Ae58eckA1844apapMLGiK+TcSmZkPKQ6j
	awu2UouH/nn2VHVwQDi6hyakaWK2YbQTA+P4CrhVflnsddznKambwvBSVRx+9v7VApW5i/r3X8x
	jBGn5wu+4Y738mrflEF9GE9Vzpqh4H6GtyjndyWN9LCf6eJOWcJ2hNbg4BtCCwU7yku3iLGOObq
	uv/7L/5djD27rf5dpd2WMhXPhGVykj9UjSSFfk54/Qn23nwQ==
X-Google-Smtp-Source: AGHT+IHAjAvIoHxilsvGJvQimz2d0nFw/5Rl8TnnwT5flUI3SNpQzBhZbA9wUwqDHELdp5l6m/XSsw==
X-Received: by 2002:a05:6402:1ed6:b0:640:7402:4782 with SMTP id 4fb4d7f45d1cf-64350d328c8mr13403646a12.0.1763459020364;
        Tue, 18 Nov 2025 01:43:40 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f96e2sm12254612a12.16.2025.11.18.01.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:43:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 10:43:39 +0100
Message-Id: <DEBQ1TNRYEK9.3VIMEEAM7M5WF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Bryan O'Donoghue" <bod@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Todor Tomov" <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid> <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com> <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org> <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com> <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org> <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com> <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
In-Reply-To: <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>

Hi Bryan,

On Tue Nov 18, 2025 at 10:33 AM CET, Bryan O'Donoghue wrote:
> On 17/11/2025 12:53, Konrad Dybcio wrote:
>> On 11/16/25 3:30 PM, Bryan O'Donoghue wrote:
>>> On 14/11/2025 15:59, Luca Weiss wrote:
>>>> On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
>>>>> On 14/11/2025 11:15, Luca Weiss wrote:
>>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>>> SM6350 SoC.
>>>>>>
>>>>>> These patches were tested on a Fairphone 4 smartphone with WIP senso=
r
>>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly=
 as
>>>>>> far as I can tell.
>>>>>>
>>>>>> Though when stopping the camera stream, the following clock warning
>>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>>> starting and stopping the stream works and debugcc is showing 426.4 =
MHz
>>>>>> while the clock is on, and 'off' while it's off.
>>>>>>
>>>>>> Any suggestion how to fix this, is appreciated.
>>>>>>
>>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-bra=
nch.c:87 clk_branch_toggle+0x170/0x190
>>>>>
>>>>> Do you have a full and complete kernel tree we could look at here ?
>>>>
>>>> Sure, this branch has everything in:
>>>>
>>>> https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/
>>>>
>>>> For further refence, at least two other people have tested this branch
>>>> in postmarketOS, nothing particularly exciting to report from there,
>>>> apart from that the sdm-skin-thermal thermal zone (thermistor right ne=
xt
>>>> to SoC) is currently configured with 55 degC as critical trip, which i=
s
>>>> quickly achieved when starting a video recording, but that's not reall=
y
>>>> an issue with camss, but will need some tweaking regardless.
>>>>
>>>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests=
/7281
>>>
>>> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm635=
0.c
>>> index a4d6dff9d0f7f..229629ef82809 100644
>>> --- a/drivers/clk/qcom/gcc-sm6350.c
>>> +++ b/drivers/clk/qcom/gcc-sm6350.c
>>> @@ -908,9 +908,7 @@ static struct clk_branch gcc_camera_ahb_clk =3D {
>>>
>>>  =C2=A0static struct clk_branch gcc_camera_axi_clk =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .halt_reg =3D 0x17018,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .halt_check =3D BRANCH_HALT,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .hwcg_reg =3D 0x17018,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .hwcg_bit =3D 1,
>>=20
>> No reason to drop the hwcg description
>>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .halt_check =3D BRANCH_VOTED,
>>=20
>> It'd be useful to explain why we should ignore the hw feedback in this c=
ase
>>=20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .clkr =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .enable_reg =3D 0x17018,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .enable_mask =3D BIT(0),
>>=20
>> Konrad
>
> vfe170 is what we have on sdm845
>
> So I'm just asking Luca to try the sdm845 method of waggling this clock=
=20
> since what we have doesn't work.

Yes, your change to gcc-sm6350.c does remove the warning and everything
seems to work as expected. Opening and closing the plasma-camera
application, switching between cameras works without any visible issues.

Regards
Luca

>
> ---
> bod


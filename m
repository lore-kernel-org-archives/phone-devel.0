Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A6379964
	for <phone-devel@vger.kernel.org>; Mon,  4 May 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900878; cv=none; b=aOXjpMqT3ENmoXFqjUd0vVZF7t4hW8xloNOxY8NCp3c8paY3SxGy2C+VhjkIP7NVhFCnbmcWX916LqL9D9CZ6yECFPhPUdb0Iy+w7k4yxFGPPGojbldtHR8lr52sD52eWrQjMAoOozhjxmkdXev9tifWxI5KVk9pdYhRF+woR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900878; c=relaxed/simple;
	bh=RRcMT5aXF695WT2y3yloWwLGYO0Wery2Qd+Ip0HySMg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dt/0SSn18iw5lt/OxBN+koDkGBjPkkjme/yUtc3y4ojoXOo4deTZIrN24mJC/Y1ARjir3l5tHDiy0P3daSuBFGhUUKDbs9m/M9eZWctWybtGVAoccGnrO9FSQKZ/vdx47hV4Gz4wVPYerGP8RFeDc+Pr9BqeSOGhPDmFeBTvx2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Vfe34t3l; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Vfe34t3l"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso5181108a12.0
        for <phone-devel@vger.kernel.org>; Mon, 04 May 2026 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777900875; x=1778505675; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=;
        b=Vfe34t3lpzoBSlxMarmtHtJZ6Tq8MHmt9dUapF07HnO9QtHzkXSFoBbdbpjPA/dNPd
         LSHmqVNmgtS/Qcz5ksymrf9ETnAbokCKpfuGVccUjzpRCz3iZfwmdp5yZYdVq8Qt2rXb
         kdmeUi0CpFyYSoEkHdYKBEQXmmzp9qGQOvMJyM1TVUQzcM5LKckfhLkLah/YA0tu/aWL
         AEKft72sUUKEP3w0ESKp/LA2MAZHBaBmQ35/ntiwCWK00l+dTtboshhep/kHmoHX4Y+4
         G+tTJq9M8uDty92qngjUPNEuJEfMnojvoEJikJPylhqyWkRItzTDCliU/KwFuZt80ntD
         2dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900875; x=1778505675;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cu51mh4jahJU18+vQyHL65Jaia7lK69Ad8pkf9BheHQ=;
        b=JUxzNbAc42ajCD+LlIDYPmmM/hzr7Qbt2qYgCj7/f7l8B1U5LkAZ7AhPSWOzzPrUi6
         ycKCstH4kHhgQ95qd15IkxBC4OEUIB97xHOas0B6gErsR1stqzeYvVaxoQgb8SSBtwnM
         eyggNEB3fwzFJO4c34iW2UmrVYNiR1wbQr/CSilvG9nV30u8v+DHrvybQtnaIjr9BoXb
         dIZUftbR7Qbet9jssYmXnRf6vWawfaUvMX7riiwjEk2Bo+7dMuFaORVc46UNPjsm36yJ
         zg0Av8s6zH0w3WnHwebdE0ZB4dSJQuSEAMNVxCOa1ppBFtBCJpg0r7Pi8jmf8nrnhonz
         rhqw==
X-Forwarded-Encrypted: i=1; AFNElJ/wEzcy3j2mA9AG5KazbNRYq6QNsUrT1jFlVCimN5MLsclrm+ALtiKfroXkAvli1Yiw9V6Cv6bbfZx9fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFG6pSOH7WpseOt0NXMJwPXtZRpaUnkEkaV7OHtkIKZJzyAkfp
	YcGXrA5CCgbJkyYUGx+eiBJ1B9EFRtlxHRxsvxK5n+oxCuEZU/4Rp/wi3rpkVVfCfZ8=
X-Gm-Gg: AeBDietvxh1SIQSupsK5To/iHYd1jJKrud6aFavuMuRQRewoZkblctiZmCgHEHnB3Ys
	HHa9mQ1KaCvqzI5AsE6qNlM9wpIS1n0WOe2EOylnKgqAKgvCiUe00R5j8JrYci1r6gpp3E+uonr
	3O30L96eN0SyBoHj5tSkI6eJE5NTcRyW4CECjfREZpRGkP6EbIHTLXbxUGCyZR6c84sGn4tJG5n
	IrLC1Y5atFRD8fvBlqxDj2jL8qw0PrHi0NbYBPIv7fuGLI4kKj4c0632fri2l8VeHo4wqe1454e
	LMvJ+yFS7bnm/j0HA3D+oN5KIf04hLXRvgyMJ4jrZvGT8t0IhVUgHIWRZN7NFr9c40B8BoLaVtE
	BwuGlXgfs3mxMHTPrpZUaFY2WB0F+o65HAfd/7YhziFnOm+d1putORqc6DAe7taBC1OUBFmLops
	7NXTZYjtrQ40AGNcvx4U7CXCW0KEokYG6mrSDsYkb6DPUTe4bXi/3+GikZspcIsQKLzt7Yz6Vso
	WQE0AA=
X-Received: by 2002:a05:6402:2b99:b0:671:eac2:d328 with SMTP id 4fb4d7f45d1cf-67c1992a1c7mr4428495a12.10.1777900875106;
        Mon, 04 May 2026 06:21:15 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3367092a12.2.2026.05.04.06.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 15:21:11 +0200
Message-Id: <DI9X9D3TTIRE.1CGHQI2LEZ1UL@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Jeff Johnson"
 <jeff.johnson@oss.qualcomm.com>, "Baochen Qiang"
 <baochen.qiang@oss.qualcomm.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alexander Koskovich" <AKoskovich@pm.me>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Rocky Liao" <quic_rjliao@quicinc.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, "Jeff Johnson"
 <jjohnson@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
 <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
 <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>
In-Reply-To: <870d16bb-b426-4285-a299-deb09ae90243@oss.qualcomm.com>

On Mon May 4, 2026 at 3:10 PM CEST, Konrad Dybcio wrote:
> On 5/1/26 11:20 AM, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
>>> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>>>> Configure and enable the WiFi node, and add the required pinctrl to
>>>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>>>
>>>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>>>> the missing pinctrl to make the WPSS stop crashing.
>>>>>
>>>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY=
@fairphone.com/
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++=
++++-
>>>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/=
arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> index db72418b7195..d8ac495ca7c8 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>>>> =20
>>>>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>>>>> =20
>>>>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>>>>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_def=
ault>;
>>>>>  		pinctrl-names =3D "default";
>>>>> =20
>>>>>  		regulators {
>>>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>>>>  };
>>>>> =20
>>>>> +&pmk8550_gpios {
>>>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>>>> +		pins =3D "gpio5";
>>>>> +		function =3D "func1";
>>>>> +		input-disable;
>>>>> +		output-enable;
>>>>
>>>> Hmm, if it's a sleep_clk, should it not be handled via the power
>>>> sequencer?
>>>
>>> If you mean that it may be needed to toggle it with specific timings,
>>> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
>>> access to some docs that I think should have the answer, hopefully shou=
ld
>>> get it soon.
>>=20
>> Did you manage to get anything there yet?
>
> Yeah, sorry, it got lost in the sea of emails..
>
> The PDF talks about the electrical requirements of the clock signal and
> the section titled "Power-up sequence timing" doesn't mention it at all,
> so my assumption would be "OK so long as it's ticking before you power
> up the WCN"

Thanks for checking!

Is this an R-b then?

Regards
Luca

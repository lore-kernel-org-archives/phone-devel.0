Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ADF3806A1
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627254; cv=none; b=FHAFlf2lpswtlsDsSHSk0ilfMSTmSf1+lJtiSNeXdJ3z1zUPZanFYCTuKSY2baMQr7Vs+9H0kdryjTaPzA1uzLoSLYy4qiWP6z4PsbkvGGRRjNc9ffZ9dqk6s2MJ+5h4HDAC6z3eBaY+iKcZMiHlxq5qKi0O5lfIciEEpbBRBQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627254; c=relaxed/simple;
	bh=t3nxPYsn/+uIJrb9cvX2Su+SoURhZtwc/pGiLCniQoM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z3SkGPJrssIIXM5IaK7jMenv78KnThb0TeYDVKDPVLTm2gniD1IuPV1NKJQJBe3czV0vBkNhDl2mtPIT9Cq97xuozqVIrKSFc0RYwC68mcibbCpjJIfT1tptYl8LkaUiQ/u2U2htoXvqrkuSoEeM9aPOQOYHebIRDSkC8VwwZWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4cducM1g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4cducM1g"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a786a9a35so322712f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627250; x=1778232050; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=;
        b=4cducM1goAgbmhRjB7BIeqVv4bhmvt/VGodszsfyXX9V+Y/WIx7CWBq3zq/e2LHY6v
         oyxMrxfTKFkxp3Df6OIh7TXYpy5bkqrY9bWuoRADiTOVWKfVLpOp2nlyWdVm/NilvQt/
         JeeHmwJiATC3bAGy/cvOYDsBxvMDA520LZnu3JNVxn3a7SZeB3zWHrgJFTgno9dL5XSq
         39dVjZ/mzBqa+w9vf2fSkgec+ROGW1wPzHu8COQdnu5tVXASYxMAdDQmucxVlXla+46w
         sd9xPL+p5rgFxJJZ2GuaYJlW0o5AzoTqx6A5qHlSh2qgcx7eO4vPrZfJ+AD33bB/taul
         ZG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627250; x=1778232050;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0bfYkGp++VX2XGf/8Df8kQnMjnWB1zask25dl4NteK4=;
        b=rUmDDag/bvggNPZxSuDWSd6VFNFLcLPwwd9TSenox4wBOLOjTELHNnNhVk/lIJOYNh
         aJ6YLA2jqToXPdJj7vm6CElLTQYWMXKtJM0p5LBBsXfwbZ1Wp3Gx1D3q/Xzmijr4ftP+
         ormGOvYJT4nVMU4t/U9Q7jeGIBwHA6J+LATwCYrjE9siyaNNEI0u5yqPa3bH8Il3gvW7
         vPTZY0/AVESsPV8aGa1X0fpBppkfkmAYv4UQZl3kY5BXvvFZ12K3s5vdI9lkNXE70KbW
         IaIK2/Aw0lkckxeWwmm9MWlE0YgInL6fY7g/mn6ej6rqbtaSW3IyY9mvP3mSxHRfJU8/
         MpXw==
X-Forwarded-Encrypted: i=1; AFNElJ+jaCXRzDtBB2KVzZmHGI+/Lms7auLlLVsdUx6LzC8ObVQ/bH8rrcM+s/LNOmLKZaXc0NlITx4REhMwGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6JzarcYAob3jPj84nsvOaYw8GVAelepaH46aI3WFuEaBohoqj
	9KIU8pEZhZqefaXUH+uSHwpnNLt/gg67YYodiBie8vwp6l/hejoTl5wtwNfBcjCTpiA=
X-Gm-Gg: AeBDievZfomTAPBjtk+rVFUxnxUI8v8GAk7GDMHbrUu8yMExBy5awVaGtW4bF8Oo5Ta
	AVNpjUaglFygiXtPR9TJoOsb1/KKBMshE2Q+Ft198n+BGrGLQyRj9FWu7W6lWPoJWE1EW0ujIL5
	DjxtZM70ryp3/oNzHEg2TUtXmfw4J+79Su2YJXBKhKJh7Q6TD9VbUb2N9YnimwtTf/RYGQGqPkc
	Y768//Q26CUmGr6c8kTXNFm/q/luH/t+l96f6l5HJQWrFcUeQKMrnoJkJvZ38VlCp3ISyfSLcmY
	QwBP6P/ikQeaG1NLjqIVkNa5UGVieOhmJj/TIOG6kLrEBtP9teL11sk3VTs54IFT3XLaRnqiP7O
	675B+2fjd3UF7sCTUTq96YG/6/xZ96Cw+UxWfLdifpGLFh+wny2sQBIuavRX3zTqKkxDzFiScEe
	bnD7d16IwHW1xSKH8+NhesugUnoWfCcdezCmJyO+0MuHOHRq5qqAuIHT8MZxJJXIgFKU8ojSnhM
	efIfhvAgg==
X-Received: by 2002:a05:6000:240c:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-44a857c10e8mr3084632f8f.6.1777627250496;
        Fri, 01 May 2026 02:20:50 -0700 (PDT)
Received: from localhost (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm3583191f8f.33.2026.05.01.02.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 02:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 11:20:47 +0200
Message-Id: <DI789NOBWJHK.1V3SFQLCFLS4P@fairphone.com>
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
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 "Baochen Qiang" <baochen.qiang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
 <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
 <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>
In-Reply-To: <2514523f-a43f-4470-a69b-3d5175d10385@oss.qualcomm.com>

Hi Konrad,

On Tue Apr 7, 2026 at 3:16 PM CEST, Konrad Dybcio wrote:
> On 4/3/26 9:35 PM, Dmitry Baryshkov wrote:
>> On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
>>> Configure and enable the WiFi node, and add the required pinctrl to
>>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>>
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> the missing pinctrl to make the WPSS stop crashing.
>>>
>>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@f=
airphone.com/
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++=
++-
>>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/ar=
m64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index db72418b7195..d8ac495ca7c8 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -242,7 +242,7 @@ wcn6750-pmu {
>>> =20
>>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>>> =20
>>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defau=
lt>;
>>>  		pinctrl-names =3D "default";
>>> =20
>>>  		regulators {
>>> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>>  };
>>> =20
>>> +&pmk8550_gpios {
>>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>>> +		pins =3D "gpio5";
>>> +		function =3D "func1";
>>> +		input-disable;
>>> +		output-enable;
>>=20
>> Hmm, if it's a sleep_clk, should it not be handled via the power
>> sequencer?
>
> If you mean that it may be needed to toggle it with specific timings,
> possibly..  seems that WCN6855 has a "xo-clk" GPIO defined. I requested
> access to some docs that I think should have the answer, hopefully should
> get it soon.

Did you manage to get anything there yet?

Regards
Luca

> Or maybe +Jeff/Baochen could answer faster?
>
> Konrad


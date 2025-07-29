Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640D264625
	for <phone-devel@vger.kernel.org>; Tue, 29 Jul 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753771796; cv=none; b=peb64+wd0GpkMh62TULUgfAJj/QLuCE5oLD34IQ6tvRGKlr/aOb/LHeZ1vjRwr//g0exR5TY35fScBnUzNg5znJhheuTuzY8Y64+Yo2OGk0BNUZCt2X96CIjmCCCDHk2K1KUMH1K7/bnMhOo0P7V3RmaALUZMTHQo9a3RAnW7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753771796; c=relaxed/simple;
	bh=EOhJI4XE7EmddrlB9TelXwBH+e7RrRI3HJn7pIRR/rk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y7jcdELu8t0jwJ2j/LzhOhaMCiURoittpXoFWQt0TxuXkyfuJAcGCIzn8XsEwgnYy7xitUtNSzv3HZq4S8npk2pC/fxiEasoyhOFSIzi5b7kG2lW/xPlZbPX1SkaaLc1H1UrwPMjKT1Pxzfv7OOENuBc47SkAKiT1Z2A/SP4gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=26X3Idx1; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="26X3Idx1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af66d49daffso244906266b.1
        for <phone-devel@vger.kernel.org>; Mon, 28 Jul 2025 23:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753771792; x=1754376592; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=;
        b=26X3Idx1BYDQEUjbe/WE12+rsByQkqNFRz9t0mlCCQMZcoOMcqWZUQPITGUIMcjFCT
         kl5I5w2g7pXjhwftBtc7hLyZa8CRpe+QUDlYBvdklu30eZJu2CJTYVHQJIrYSo412gjH
         5HJW8KmTF5XlVXAraB7W3dm/STPlocv5C0W4f/fuDkwq9fdi4B/EN3HwvmUODcqpSVUt
         ScJcdmrKeVrOljbrRC6Y64732dH12RV/cuw3wZ3adkVhU5YuDCmE9CBGuvLP1hIffyzv
         x++sHYcjLcoYCEGOCfwWjjNJjKQQgciew/AsTgBxb1s8gm0ClBaAIAUlth25CWEI+bfe
         TR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753771792; x=1754376592;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tvO0qmfUNC2jqa8M7kzzmnccGVoia4ygdONyDNCxVc=;
        b=dr5xSiYifcy6MhBCgBOzPkg1L75umsmsUxS6Bjsasmd6cPd5/64zx+BrH1tsffZDGw
         u63t5Xi5faCBNb98wGH880SN7VTSiae7azbXIZAN3W533QAXrv4ImY7pX5Rl/9hZuHyp
         45R5AS47veP9Hc02DXqvUFyLUSTZVE7hTO6YVaJd/yic+UkYsSil/QZJO6iWBJLP5xsZ
         5PovdSXb1NOWN6SXRSBUaKfY8KDtf4vUgkuCPn0vWKn3j72CA5+kgrjDWWlbI71SSJqo
         9Hr7aaUrNo9X/sCywc+IrImjl0qo3jhb7K1FyG4QnlsrjXi2Ixt16SwpyIS+aUpxKsFD
         V4tw==
X-Forwarded-Encrypted: i=1; AJvYcCWwXgXUfW0dPkvFHXBQYSp5+UBkhv0GDsbcOc7dlzUs4cbBiwPS63N+pr2IqOPc9N9u3+0P2R4Xqe673Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1sps8Ymj7rw6a6iYltn56+hTANCztBcD35lx+SYafGzRa80/
	PiebV+xbbx40/irqNKxNUxsryCUY8ZcFlX8g6mC5R+e4wvm3AqRaueCU+A/HHTnq5LA=
X-Gm-Gg: ASbGncvXDb9kBDH1L8vQiJWgEvXD9aNanmdB6B8eQaL9/Tl5WhzoRvZVbYNE///jmCa
	dDYUQYHjTetXKfS47eGwhXnXM6lNM0v/lQ1nyAaD7RtwKwTE5UTdPOdN3UpbuneZDT+hN+8vjrl
	rmmNWr/CAjPJtfcXZektXc30ba+Ob1BEIu3s08RyE2kgVpT9FaN9zV52zM24afNH0LMVWhkMhMk
	SofZD4KqoTX6Si+lSoda+mGTL9ifGCsYPrCEc+ulgsn4AobVJUC/o9yqaoUEHrXXsdJIXBxtHgu
	nLBt/W0cXoKXpDhMIjGgRY6LzGPSwGoKVmLl6rJeK1y7/rFqCKZvatHwLE0FA/kUzVSO/JBCH/g
	slMd1Gal+8ZcA5dEvkM8Sh1Giy5dPNi6uR89kx3mDpCHhr2osKZ+W9sshXArWE9/U0zw=
X-Google-Smtp-Source: AGHT+IFY1cXRHhDZKmmaOPFoMzRlis7auiB0SY6wze0NFezD/noiXwvsAjKX3xVSDeubNvW/ghlrqg==
X-Received: by 2002:a17:907:868c:b0:ae0:da16:f550 with SMTP id a640c23a62f3a-af619d062b6mr1776275666b.49.1753771792232;
        Mon, 28 Jul 2025 23:49:52 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358600b1sm546209366b.7.2025.07.28.23.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 23:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 08:49:50 +0200
Message-Id: <DBOC7QBND54K.1SI5V9C2Z76BY@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: Add initial Milos dtsi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Will Deacon" <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, "Joerg Roedel" <joro@8bytes.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Robert Marko" <robimarko@gmail.com>, "Das
 Srinagesh" <quic_gurus@quicinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>, "Amit
 Kucheria" <amitk@kernel.org>, "Thara Gopinath" <thara.gopinath@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang Rui"
 <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-14-e8f9a789505b@fairphone.com>
 <3e0299ad-766a-4876-912e-438fe2cc856d@oss.qualcomm.com>
 <DBE6TK1KDOTP.IIT72I1LUN5M@fairphone.com>
 <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>
In-Reply-To: <DBE8G88CIQ53.2N51CABIBJOOO@fairphone.com>

Hi Konrad,

On Thu Jul 17, 2025 at 11:46 AM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Thu Jul 17, 2025 at 10:29 AM CEST, Luca Weiss wrote:
>> On Mon Jul 14, 2025 at 1:06 PM CEST, Konrad Dybcio wrote:
>>> On 7/13/25 10:05 AM, Luca Weiss wrote:
>>>> Add a devicetree description for the Milos SoC, which is for example
>>>> Snapdragon 7s Gen 3 (SM7635).
>>>>=20
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>
>>> [...]
>>>> +
>>>> +		spmi_bus: spmi@c400000 {
>>>> +			compatible =3D "qcom,spmi-pmic-arb";
>>>
>>> There's two bus instances on this platform, check out the x1e binding
>>
>> Will do
>
> One problem: If we make the labels spmi_bus0 and spmi_bus1 then we can't
> reuse the existing PMIC dtsi files since they all reference &spmi_bus.
>
> On FP6 everything's connected to PMIC_SPMI0_*, and PMIC_SPMI1_* is not
> connected to anything so just adding the label spmi_bus on spmi_bus0
> would be fine.
>
> Can I add this to the device dts? Not going to be pretty though...
>
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm6=
4/boot/dts/qcom/milos-fairphone-fp6.dts
> index d12eaa585b31..69605c9ed344 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -11,6 +11,9 @@
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "milos.dtsi"
> +
> +spmi_bus: &spmi_bus0 {};
> +
>  #include "pm7550.dtsi"
>  #include "pm8550vs.dtsi"
>  #include "pmiv0104.dtsi" /* PMIV0108 */
>
> Or I can add a second label for the spmi_bus0 as 'spmi_bus'. Not sure
> other designs than SM7635 recommend using spmi_bus1 for some stuff.
>
> But I guess longer term we'd need to figure out a solution to this, how
> to place a PMIC on a given SPMI bus, if reference designs start to
> recommend putting different PMIC on the separate busses.

Any feedback on this regarding the spmi_bus label?

Regards
Luca

>
> Regards
> Luca


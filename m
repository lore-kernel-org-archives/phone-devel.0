Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A015340A6A;
	Mon,  9 Mar 2026 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092216; cv=none; b=ZtOBRcniFErM626racIUvY9qQQ1Mm9vPscHg7Q4mOF/fO/mXB+6QgT4gwT0HBUf1Tv8hvSw4vHCID/gUPiQfCOE/dZ5vv2zE08paK8wM/mIsH2AaZjyoOYgJcBLr4h0uwNfyPyli8ooO0xvjBvWv9AsqKrDmDiKIQJcfzLQDSvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092216; c=relaxed/simple;
	bh=GdAYXYkcc+r7aRkwfhgnxP8RqUJbn8BcxNULbOBSAAE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XAvDbSVSEdpMzODr91GcLI6JYw1pZpTAtCsrEp1DRKqHtJIQ82xddOMLUmTLTBPB6KAuY5qZmKHbNV2lesk71aY/H4sKXUJp5EyMSpmyTPoJwSTpc56KglABuSAR+oywSB2RFnDq0obDweWqMyB/KgLv/9KA5q3S8ba/T1b2JoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ECuChA/y; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xFDZOwbU; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ECuChA/y";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xFDZOwbU"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773092200; bh=0vC0kdxiA9DWPung36UoRuU
	2EzBeNogYAWwkCdFCOoo=; b=ECuChA/yxYY4hRKh4T7jksmNhnfeH8O+e89O2neW+wbyYfuRUV
	d5xv0fyGOIXTxd6n6bd2ddSYisGOBDoRDJXAgf8052Fa41+auGZvj8B+21Nf+40tw0cyjRwGQx0
	Zj5sH7x3HazGsP36jRuqUaoG68EdD0aMg+KSqbxgqWFNzQy2dDTEkYcjoDx/AQ0c+kQIXvCg7Pr
	NlRE65qrW2d9MZgXdLyEaIg7XOcdh4kf7YQzVzt7sZE+00Cmcf+oFjdgrsAa8aOy+zZexFTzQdQ
	oGc2BgwlSa2u4w00emxapW2iHv1ytGkXu3g+J2nQRuc6f//tD8y9EqeJcPuS3YS92yA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773092200; bh=0vC0kdxiA9DWPung36UoRuU
	2EzBeNogYAWwkCdFCOoo=; b=xFDZOwbUbjZtj3Fc2TPkSfPJSTbHjkDuAdl/PGrUQKguLyaphN
	Hfqx2RyUr7sZ9Irla9CHKy+zGG1ZZwrtBjCA==;
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Mar 2026 22:36:40 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Redmi Go
In-Reply-To: <390f4c8b89f3465924d6ef95bccccc6a@mainlining.org>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
 <07b552b4-ecdb-4877-8b45-fcaa6792aee4@oss.qualcomm.com>
 <390f4c8b89f3465924d6ef95bccccc6a@mainlining.org>
Message-ID: <46a3f0ff1a5c20e8bd4a4c1efb16960d@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-03-09 22:19, barnabas.czeman@mainlining.org wrote:
> On 2026-03-09 13:53, Konrad Dybcio wrote:
>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>> Redmi Go (tiare) is like Redmi 5A with small differences like 
>>> charging,
>>> fuel gauge and different speaker codec.
>>> 
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile                 |  1 +
>>>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 27 
>>> +++++++++++++++++++++++
>>>  2 files changed, 28 insertions(+)
>>> 
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>>> b/arch/arm64/boot/dts/qcom/Makefile
>>> index 20e161e843ed..a74598cf0b47 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= 
>>> msm8916-wingtech-wt88047.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-tiare.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts 
>>> b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
>>> new file mode 100644
>>> index 000000000000..c3a74530c34c
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
>>> @@ -0,0 +1,27 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2026, Barnabas Czeman
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "msm8917-xiaomi-riva-common.dtsi"
>>> +
>>> +/ {
>>> +	model = "Xiaomi Redmi Go (tiare)";
>>> +	compatible = "xiaomi,tiare", "qcom,msm8917";
>>> +
>>> +	qcom,board-id = <0x1000b 1>;
>> 
>> Could you please double-check this? Riva and Rolex seem to have
>> properly different values there, but this one mimics one of the
>> values for Rolex.
> riva value is depends from the bootloader, Oreo bootloader using same 
> value
> like rolex and tiare, 2nd entry in the board-id is not used so i should 
> remove it.
> Here is some more context:
> https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8952/msm8917-xiaomi-riva.dts
> https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8952/msm8917-xiaomi-common.dts
> 
I have find out this qcom,board-id = <0x1000b 1>, <0x1000b 2>; works 
with both bootloader version
on riva but if i set only one of them, the bootloader version will be 
limited.
>> 
>> FWIW these values are almost never properly fused so I wouldn't be
>> surprised if this was a fail.
>> 
>> Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D9392C4C
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 12:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060769; cv=none; b=aRx83H/rW4VaiDcDhf8PMSunK0CaQkifn4ONOTdn9fg9GjndlpyjY1+ku7CZHW2OavXq1nd9ED+WiXB21ClQJrNc6Y0Y0eheeGyWxpZijb69itQ+euVi7K/ZEFikdFYBoqXe1uLrHXw11krvvN9zuW9fKUysYe411zcxrXYI8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060769; c=relaxed/simple;
	bh=ePCQ6m0laKIuOq6nhIk1YmPWwno2KDr1pvgdMxF+7gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQx6kH7sPyVH4vj1FCPiu1yBhSUtqX9pXSunWc8GbHavceclWUiL9aYOJZpHnRm63t0GlAQUrLbGUlf79MX5JT74UCQy6792/JvD0cQIX34Jn9xFZNrMu3DBKuFNVBDTVUpUDDpA0neHNBRUsSCVCVk17GiNiEiOBJTdfj4cMGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1t+ykwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtbzPZTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1t+ykwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtbzPZTU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629ATrJA1589091
	for <phone-devel@vger.kernel.org>; Mon, 9 Mar 2026 12:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QwcWNU94OXy3ETGq9rRST1xSdW7sXoKXYRhilNIUDP8=; b=R1t+ykwCyvAzTpEx
	t2JsFLyCxRzKjvkQIp7nrNtWtEthMKiCma3SY2Wvh2CuSbkSlfQ9myZVDjSp2NqU
	MNttzTdzH8jpBkLKF7Yt8RNAeV8Yd4R15jJbPeO1wv5hX8Ui1XJILwOplWGcttDA
	Q/mCaunEFmvQ7MFVRiM4tLHoYn1JKLwUHtFOvH10GqexF+rUEIyD33yj2g3lrLIJ
	zH1275Eu+TAvbiSFQfkv96vcUQSyua19qKPMTiCsZDCAWUt/oF2uxBqxV6yUfKF6
	UUTKt8pSGksqV0j4aJE8bRQmo6EQz2kpx2AFje/4C6U0nkOizUlkGb5b24nNZXLv
	lO7NUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy9je1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 12:52:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a063277f7so38563796d6.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060766; x=1773665566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwcWNU94OXy3ETGq9rRST1xSdW7sXoKXYRhilNIUDP8=;
        b=gtbzPZTU1hpNlfKtaoUKVQFL2gba/fJjVVAamYuJIXmvNvu/kQbGjG0XsFCLlNop8W
         VH7tx2pARrOXtSSzGSxhlnUFdjevI/NoelenOwtyjheofZStfwW0GQPd7GDAptAHB+zF
         /05NcZySoIouNxJG5k1Uo5/co3L3HIu70/VaHcx4i0lHx6rouIBgNHyiwB1YEhsUc2r5
         GCUOExWcc5bE2f7GYr4hCi3CfPl1ZGG+hP5nNFDj6MacYqZehGv9xdNdnhXyDJyLXaSp
         sOx+MKpF4uzTZSGgjMh/qU7cKMtKyL1V2o0ZYwlA9FPse6HaeDCu0m0aj/rHK2I95TIQ
         rcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060766; x=1773665566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwcWNU94OXy3ETGq9rRST1xSdW7sXoKXYRhilNIUDP8=;
        b=m36vnz0wH1thbQOQvgeHEDDNZxP3hdCXZEt8ZXd8H/xlAJTazCG+SRT5u0Rwx+63+R
         HqhcrInY5n8WDQVubWJMuB/QR8xHrBSONlQD916+mYcqDbmV3CqqVzbmjCjVRXKgCuDd
         +N5U46nCAEuIv1z0br4+D7oM7neAHVMVEN77J+zaggUMRShx/nDd3qLrpnP4RCF4I4pk
         88bQTWPZmoAcesNVYcZtlg3eiNAeYzIP23cr9sj9ZJsPTAc4pcZWpRTCc76NRLKVkJII
         rm56Nikkj83ar1i1flN1K70ZqvGyetaBn/Pt/XtU/OgzuH/TSZib5d+g6IkGPC0MKKl+
         7uFw==
X-Forwarded-Encrypted: i=1; AJvYcCXBYHkBYdXPLcgKBf8bRP6mkHeFHSSY7xuQLJkjXTWeOa62/3M13Nk6OM18pUqdyhYeDoZz8LVutgXKMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJGXBxZgyl+9WsScr5Fdzs/v3QqF0JhbSBxOecw0ye4dfcW/DH
	oKxY/tCNJTN0kHjjZDtwPOtgQk98zpb0Nc0wPoiwVOq57piPka+s5nVv3D+nz0cGrkfwzjwmeWO
	wiWEnuAXe6TASbH/q9uBjcuzg/fW5wlZkL0CVihj0GfwZ0TeNR5HurP5qw7j94P/Nsw==
X-Gm-Gg: ATEYQzwdBzuh1FAVZpt2sqisui+QGGc3bQdhR00OmHO95/dTqF9p1k7ktjcNGd99SEd
	4tSAFlbVxPNAxwi5r8dDFwCsA7kiV37hdh77ZWnqB32tQwavfjg6C/gEUHaePdl+BW031nOcPnd
	qTd+KPZWTwJ76zF7Buoq4yEXT9uCAT1DU2g2VmtbD7azuxJLAGDfPr6NdgXngGf6Zlh6HghHFAZ
	h4UOkr3Xg8X4Eb5wQt0mXaynK+9mkk9OWTs8iT72kS2tvTvyFYIlxetenfT0lH12j5THEi0v5Qt
	mzOOyBSWoCIgZRYcnRpqUE57AKphIn9Se7l9VbUtaeD33FwUQcIArrQGPMKnO8XrHh55HAGgoy+
	m0aHHmkQ94wkJpBt26gObqV43Pzskhgz3vGozIP6pV23pHC/eBrHAXG8BacVmFdvNKmvjiPmB5r
	9D//M=
X-Received: by 2002:a05:6214:5e09:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a46fd344bmr41416566d6.0.1773060766303;
        Mon, 09 Mar 2026 05:52:46 -0700 (PDT)
X-Received: by 2002:a05:6214:5e09:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-89a46fd344bmr41416196d6.0.1773060765740;
        Mon, 09 Mar 2026 05:52:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96dbd03678sm244588966b.13.2026.03.09.05.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:52:44 -0700 (PDT)
Message-ID: <098cf81c-d3a4-4591-948f-0517b0430343@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:52:42 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Redmi 4A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-3-436f1f4b7399@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-riva-common-v1-3-436f1f4b7399@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOCBTYWx0ZWRfXyfJWaVQO8ws1
 7L+9xBuh36KvI6edtN3ys2OZ0UJAhSrO/wAPbFSUS5jrRWT6KZN2aGF/WkkS464VNZT2FdU78uT
 HLNpqzIGLTR5OmCjeuIr07Cr9ipYs6V1YaT52r0aV0nH19tMH5l4+pTFM36ljSWp7TxhDzjuumX
 G7l1OrJIEEcT1zMlN2JRSIQJ0gd2F02K6/jqvWWKE9+Cpy0EzT7It8yiao/2Se0PtSvW8Q7OsnS
 QPtbEsvFxSF+aoJ8Ge5ZhGiOyph66HugyYuT0WFjhUcE9UxXKoNj6aikRan2nqytRvYBn6uu917
 rOhPNdJKtiN9/4ShbFCMuWkj5aFXb5Izq8NS9bcrDoj9UqjN1g7sYqISSFrvmghjkgvI4bS4ULH
 IqwigYpzTgLGsKT7VYxvxGp6JAv102JypBDIAh8s6ujpjsPBnv2pGgLuPfnTcFT2B7IA5nAHZ7P
 Qrc+X9/MWcRCHQ5sgKw==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aec29f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=A3-p6XzUPt2pthl3_K4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: fw4LyFhjrUAMcuQJnJb3-Agsjx6l-3E9
X-Proofpoint-GUID: fw4LyFhjrUAMcuQJnJb3-Agsjx6l-3E9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090118

On 3/5/26 6:28 PM, Barnabás Czémán wrote:
> Redmi 4A (rolex) is like Redmi 5A with small differences like charging,
> fuel gauge, different speaker codec configuration and display.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                     |  1 +
>  .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi     | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts     | 19 +++++++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6d87be639aac..20e161e843ed 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -82,6 +82,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
> index f0a534106e11..50868c679693 100644
> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
> @@ -104,6 +104,22 @@ edt_ft5306: touchscreen@38 {
>  
>  		status = "disabled";
>  	};
> +
> +	goodix_gt911: touchscreen@5d {
> +		compatible = "goodix,gt911";
> +		reg = <0x5d>;
> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&tsp_int_rst_default>;
> +		pinctrl-names = "default";
> +		AVDD28-supply = <&pm8937_l10>;
> +		VDDIO-supply = <&pm8937_l5>;
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1280>;
> +
> +		status = "disabled";
> +	};

I think an easier thing would be to just add a 'touchscreen' label
to the original one, /delete-node/ &touchscreen from rolex.dts and
add the new node there (seems like it's the only used) and do nothing
in the other two using EDT_FT5306

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063B38AC9A
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398151; cv=none; b=FsZq3f3yGIkCTwmYSgc9MF2wtVTPAHhDsz/AzLtfUhCtPZBMjJ+D2G9vnl/r+P04/o8ntmTxFwq/LrlN3PAJUlhr44bKVyMnXZUO/Xisfx9oOOpc8oNh5pH30+CvWKrpfHHphmhEJxivTbToLW9Ly9gNhIAQZQ5/E0ZkLfyte8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398151; c=relaxed/simple;
	bh=GKiyqNjisb/Y2Jr4SeL3XPeRpx/T6o1b64dhQEYlvzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsXUHD6hQJ8OMGotdp68vruV3SmtMp5yqUqh8RnT62iT0r2jxcZBcin6bt980dYgx6Vi5Flh/rxg1gwFpROad+LwylAAQao1br/DFuP2bVmL0Bu9Wp3kHbW4iFfgNhBm3pQck5sLTkcnMaGA9tri4KhtGK7NSlgZdRUTrMU4ZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRIdAM3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsrFNupC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRIdAM3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsrFNupC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tssH1574867
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 10:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+0tEDK+ElUTmYUPlBnlqAGAqNio6mVrev+WXl+AO/k=; b=DRIdAM3YIzIz5Jy2
	qFmHg2AtT/QESWr3iC2GNJ8YA+gaWSdtrOSS3l2gTBKsse2SjedTh1NfC9v7/j3i
	YEqFVqg3ezC4QWqB4ztC6QSmWyEQundM1P2w81NAG41yD7JZnixbpeGgSH8Ju6om
	FemkqmAjOiQbkdRyorubh4CORq6qT3MhAkAEh3kBuuJd89ZhFoxZHlsc22F8ZxMe
	5edR9/Hv37s2k1mzdaYitB5Slb9+7EYc6knHyVj4FLtl+b2JeSpb4e5kl679U9Fh
	YCFWgc84MJO8TPwmqk4jeFoCUVr1tM3YRWiUU/bV7Y7K/2IjLDFRm8jBhL5ctGfZ
	yL+lsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53np5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 10:35:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so109595885a.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398148; x=1774002948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+0tEDK+ElUTmYUPlBnlqAGAqNio6mVrev+WXl+AO/k=;
        b=AsrFNupCwsWgmK/cwYN8i/TEp/ze3IT2EcibqwewhdJauguqa4LPhs/XvUMmrLFpMI
         0TxFadIp1pu/UnQnBqGkZgYIZ8okjpbenH7hkgYwxdeueCVAS4+IvdJAaXLQcr1SeRH9
         okOlgTrODex/NQNmpEGo++EkW87gGroe7d6JmGLIIcpV8YlTN5Gqj5+1O4zW7Q5VwnE7
         GFkpsIK5evaBG3HMPUW8MHWbuCERP7qkP5hA1d/ksqXUFEQl4JdkUHl1Pmt6Z9hmutCK
         G1p101uygo/QbILjkKbvJ5tpQq0jAKe8RSLgdX4l6YnD83IRuZundj3pC9bAoQeScoMs
         9b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398148; x=1774002948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+0tEDK+ElUTmYUPlBnlqAGAqNio6mVrev+WXl+AO/k=;
        b=mo8/TVEKoyYvffY5ZzNqptwrPGEN1dDmM7PpkBH/LCL/iZp3eokpG/butMGuGyZn8J
         hj8cJh3Tp1TqcSFlKf3GyebpxxSogINiQDdUqKMuDZAk9fhXoD/LyPLxNLtGnClxj6Pc
         hZkPyNllNEPIp+d3p2sGq/zJEcTq/4CJupnMl+CZCwbgUSxsaKfFHBy0Nj0bnxYEPeCT
         gffuhr5MgolLLQ1PqP60+YaxNyjRQCFErVycCEglYUPqKzefL+qNghpMGpm0xGpY7op/
         GMFbhBxir8JNAAuUp12GpYK43K39ZXI964Fd4ekstvtHcRCEYkUc/eZA9vhG4TF9pIM6
         1aYg==
X-Forwarded-Encrypted: i=1; AJvYcCXYv+eURZBCXN3hXCxrKyt6O4QHjg2XbumseRU/ReFBwkPRnH8uF1Z/8IWCehX5oQF71SOwtLk2FS5/zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq/RaOl45naveGIt4ukrPqZZAHctsyThJR54f2TYE83CQRiGXf
	mEn1QFMxwSSQzn0u06HrUIizzxpU1Vd4Kcd+2ZCRnnCTU7ksFmQuo6EmSK7q4GkFwbjCUYidLKI
	ADLscXCL74jDtI49yKzJsYcS7yhiYMYlaTqs7GOqAeJBMj3iA9S+eZUkIOSTHvdONvg==
X-Gm-Gg: ATEYQzy8hrkJXLdyZVwDP9onBc2gDMSxYBoYhnV35g8skufz88NDPF90cjea+vcuqpS
	BcUeXSYwgHUBBHlcGxo2jRftDU2FCcCV7UlBd9uKRZQCULmgUQkmCjfonKjdTt9HNKKGhwOvKhL
	KpECyOtnm+ZOGtbPHfh0KWRU2cyeKBQ/zVFMMhaNeC2MSK/5sF/YbKa+u9giJM+qqQsGxe3LODF
	Va0Z5gYOPGGQW+Ec7XxWyK3hXu8Wkh3bcHAWmJrjGn4on2bU4Ib/Yz8E0aoJYem7gGdip5mQiDT
	qlDXr9/+wk+mJ5XBlmEWUFIJQaiOHgUjA2r0XXrilQ6Oy+lgHVsUF7Emudeh5KUZcMF9CBxEy8z
	xJrzATFtufgIrAC8LHnhBNv+B4zTvwqCYw8lS5qrHDb87V9e9HC+Tm8Q81JJ5RYtf1WWJZoInDc
	GYrr8=
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr161826185a.6.1773398148274;
        Fri, 13 Mar 2026 03:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr161823185a.6.1773398147839;
        Fri, 13 Mar 2026 03:35:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb480asm36588866b.42.2026.03.13.03.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:35:46 -0700 (PDT)
Message-ID: <225c1632-599e-418d-a93a-5c17512aa5a1@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:35:43 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add USB-OTG pin
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260312-z00t-otg-pin-v1-1-ce86137ab989@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-z00t-otg-pin-v1-1-ce86137ab989@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3e884 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=RLSkRAEihx7W8zUaP-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfXwSaL1pd6LzdW
 PltL9+2vis4bUZ7AK13BZOah9I7JLW8u8orVvxz2u+GL1QRLtCuLYVejf9NEQLEAo+0zaXJaanw
 MV8cgwc1ysXWpELpvShR3zNtuaqTcFmIqLHoYPXpaMbrC0vjPMCCVP9yEPqndP6s7Q3PRcURpYA
 FXb+fXUzaj/ewC9cWTDqoBRtxOHxFVeNFn5ugVrzAXkBoOmx2qn11tFepk9lPtcFiGopeS4UFZJ
 8rrlFPj4fko4m2JA+/QsyyopQSAT/TfeqVbx5hSSeVXkgd1mGUPLtsU3Rl9T1jKUx1CIt7WzGu/
 jUYwHEwxN7/zd5/mtoEYzqYwqggIMbOhb9DF0qChoXT/9CfmFNDAa1VDfXpRh+wx5jw+av/43KE
 fG8Z7EjXWvdaTY9Ai4ECtMon0wPk+g82dIP31dlQzJ6s58iL5q1Ccou5YUPkd/e5orLSP4fKTe2
 Ta99eAqF8McoxKGVjlQ==
X-Proofpoint-GUID: OxK1dvwKEYF0b9TDHEQk2KI7x0sYzLvp
X-Proofpoint-ORIG-GUID: OxK1dvwKEYF0b9TDHEQk2KI7x0sYzLvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082

On 3/12/26 2:12 PM, Erikas Bitovtas wrote:
> This device uses an ID pin set to active high to detect USB-OTG devices.
> Add support for it on extcon-usb-gpio.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> This device uses an ID pin to identify USB-OTG devices. In this commit
> we add support for USB-OTG gpio over pinctrl in extcon-usb-gpio.
> 
> For USB to work in host mode, a vbus-supply is also needed. On this
> device, vbus is supplied by Summit Microelectronics SMB358 charging IC,
> for which there is a driver in mainline. Unfortunately, it cannot be
> added to this device tree at the moment, because charging detection does
> not work correctly - device begins to charge only upon probing the
> charger driver module. For now, we add just the pin - USB-OTG will
> require an adapter with an external power supply.
> ---
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> index ea90b00a2c8a..6c19044c24bc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> @@ -127,7 +127,7 @@ reg_sd_vmmc: regulator-sdcard-vmmc {
>  	usb_id: usb-id {
>  		compatible = "linux,extcon-usb-gpio";
>  		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> -		pinctrl-0 = <&usb_id_default>;
> +		pinctrl-0 = <&usb_id_default>, <&usb_id_switch_default>;

If GPIO_121 is the ID (OTG) pin, then what is the other "ID" pin?

It's further confusing that you configure it as output. Could you
please try and rephrase its description?

FWIW it may be beneficial to turn to the "gpio-usb-b-connector" binding

Konrad

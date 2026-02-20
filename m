Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B02DE709
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771581651; cv=none; b=HZRfo7zwUiX/axK+0HP7u0P3zxOwcxvQNpD0mZsaftld89hogL2z13wyDNvr7NeRlG12pUok/ppUFmz0nEcMNr+LUNM7d8UAMokuX7CKgCCuywNWpGlhgVAb/A0cxf5AFm5rkPGIC2XI+agLvYd+h1HsDe6noPR6NqrrE15hL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771581651; c=relaxed/simple;
	bh=ALv+Y4MazO7kBQC/n25Bvu/WdhV9xJoS4dScH4XjcXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ab0zTaUA0J6I/KAvI05jgY7LYNMU0dIJP0ZcnguRJcv13q2LYeOzHc3XKKDcxwsGlJENbkStg9ubjFFZJWWVMQhsHluHXPEJK1F9fmIWA8n5aiZAKFH40oqEXS3BVgpFRu4CBcJZmP7TQQ0rc+4NUG+R71L2F2e0DRjG0RueGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9+1vcW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S67XPS8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9+1vcW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S67XPS8I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SGIl3863977
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 10:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddo+U4gF3xTQh78RUVFL3FgkhoVPcyhxFLNelU0/ITw=; b=j9+1vcW9GTqa1ay/
	BXhTEz6glwDILfEnCfWUGItTE1+SXCH8rLdVzkirf713jCD35xCTM5xG1od6XcjY
	QOP6grijJG2smmA0QmKzlARJDTRjNKAwPpzUjqKoyqW3ChiDFizLjCNt65hlgrKG
	6XRJnQaO7UeYK679pTA9/qrIbIbP+gIxoiRyyxP7zvxLF387ia0Vvdanv0FufmMo
	WkIi3d1HgYroHZdXpfGHL6jLYy8whGtwQFUZ9TxxoFAbMo23GcxDfY/KChUjYNCU
	7ytuSLny5E/Umy2N2ieBusd5+saPSWeFOzBgTnsqP8Hjb/fPVw0Ji6tdYK2KM9q2
	Sul2cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2ghucm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 10:00:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50fb0abdso209092685a.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 02:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771581648; x=1772186448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ddo+U4gF3xTQh78RUVFL3FgkhoVPcyhxFLNelU0/ITw=;
        b=S67XPS8I104hm+O+CmKQ6nhxIYHmOQ+/yZ35aNLvx9Q4KeW2L8f4wpf02xzhtb0nkr
         36zAYNcXXSq2SMS/HRvBA2RulCct/dFaDZeTCc7h1NudJ6f2ia1eTuE+5FgrN6MMwrtC
         csyTfYp8F48FMUKiDNxT53NQ7zUgdzp7zhUoqWwGf0aRAP/FVOgOplBFaODA5ebFCOKi
         prLvUnChxiJxXTFATLNjtqUnnciok5jRV8x8FAmSwB4jGnET31g0YG18rbbp7lUNOJ9J
         BJHsTzv5V9G/6MF9A+V/lxALIVVRPR3WEdmsoeWA97/j6diJ2sws8INjPpQh28RODHp7
         ZU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581648; x=1772186448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddo+U4gF3xTQh78RUVFL3FgkhoVPcyhxFLNelU0/ITw=;
        b=BdVPAwDtn2SBvPQW8uDd4JWl4t3F7oKyjDykSJSxWXUJKi0QxwxtLz8HHrHwoWREIL
         AaJmMtk7oQMaH31PQr7fDFzXbOAMbZT2QCFjBnkPejpJHlNB/xtSLrmzeRgpb3eA0F6A
         yfpgPr1gjEyFYDRmA7uwHqhqTtejWwXtaMgSbCU7QV/0RAuJfaowByS42pDzeS00kvgg
         GdKAZxGssnkwm0bjTSiWvba1fR0FjD22ZLzQZNHvmZUuEQahhnwyibGTk+ebJmgC1r+P
         agKPdqGspRc+4J10G7PCD7v2drvrs82M/aZaBHKJZKmvJzOY+fA+Bf0tckf2D8/KM1tj
         qOCg==
X-Forwarded-Encrypted: i=1; AJvYcCVp31c1IQ+iLeEH1YZVNE9iBHGa2gQslAKX9N288CXf5hBOXZRQovZLfwNE676tV5QTAJyq3dIbe23Cxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh2k0ZOAg59UN0TXStaME9E37BsIPznM25z6N1857vVkk3ZJgR
	KbKjdQPlKw74aX4gI40uVeN3gLa6aPtSL6DuG8SB0Fux8RB4gWpOPHGpccfpAcIa3vgsu+Bv+LH
	a5nJwEXkOKzpBuE3G4KIEeW6YPIpejqvecLriayAY3FFFPGUH38SxeI/OyGZVQ3Vb/Q==
X-Gm-Gg: AZuq6aImQN8vngeVrwcOH+M0tbUfCSoHraRDOMQ3WqHytwmpN6UKDm1wC7jGWkfVfYk
	otjC2zHfaAw1A2Q8W2gPpJS084tmAto8DvXbvnUOKm+gKSQxfmqS/fgHGAGBEVDAycIzAd5bQL3
	yOdtYTC6sRd4Lw0D/evbvXGFfXIHA3LDTQUEG0z7zLpc2GYCApYwmzlD4YiS2RlumcBFmytrPrG
	IkFKe/bSpT/gAJ2Ot55jNhefUoVZ28dsAkfYyOjUBX0I3aQ5lgwqc+H+lRxjnNaUagcUrQtyMGQ
	7FUmMs1Ym3Iryi54jmSV49QQxcePL73M/TRLP6eBc7Bf/YT2HuhqK4xcFYBWk/GPIalsQriLczF
	hcYcwnqX/cUlUgYCLAyspi/Cxq4MehiAqJfMqYLicHnqGplbeh9R15wxL/rgy4w9tuCdcRy+fZA
	w7lx0=
X-Received: by 2002:a05:620a:4809:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cb40869db3mr2446728785a.5.1771581647671;
        Fri, 20 Feb 2026 02:00:47 -0800 (PST)
X-Received: by 2002:a05:620a:4809:b0:8cb:1c69:b7e9 with SMTP id af79cd13be357-8cb40869db3mr2446721985a.5.1771581647140;
        Fri, 20 Feb 2026 02:00:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e579sm667828666b.9.2026.02.20.02.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:00:46 -0800 (PST)
Message-ID: <85ce1f2c-f5cf-4e97-9611-4aed03f69cd7@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:00:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 battery temperature node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron
 <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hansg@kernel.org>, Jens Reidel <adrian@mainlining.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XIBzosKv3lPDn1LZ3YvkEHyB6oBZcHqD
X-Authority-Analysis: v=2.4 cv=dqzWylg4 c=1 sm=1 tr=0 ts=699830d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=8l1bqfnc6EbWCU14WoQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX2j4NUY3Gs2uQ
 ahJpCeQYaZFgHv8e3DfTySTjvPwea553MSF98zqQvH2xFl62KD+6+Y0k6jVm0K8EGVKAkmeIpjg
 xypDqKSSOyOhNLS7Q0M1zWlsu7kYwoS/K3e0Q8lh2qWNNeqhqX6d7J5+3YlkE8uN8CodJMdnZzD
 STqOJTkNLhiTjVjRSzlGc38gRloLabUzSesbQ89HnMG1vmoo9fnxdg0mHENoPvSA4UEXw6yCM4V
 9TW9PmXLqh2ge1DfrFGkxUPdWSKBKJoRukzst5RnIr39QuwsRtAeO2ttMg4eY8i18e/oKtqWIE5
 TMlar3WoFc+sJc7gYdUqyJcmuyjWyGb2uXgZYkxFfLWgpZtzUtPahDPzAiFhTvmMo3/ZGMrHzDn
 dEg7zAjCJM2xh7ANVm+tRjZuLFiEskbLwYPo8cTBnjo3HEvns7a65UbwePDgNenJn5Sh656KG1T
 gxNC5HytyxR8hBxieWw==
X-Proofpoint-GUID: XIBzosKv3lPDn1LZ3YvkEHyB6oBZcHqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200086

On 2/20/26 10:19 AM, Luca Weiss wrote:
> Add a generic-adc-thermal node to convert the voltage read by the
> battery temperature ADC into degree Celsius using the provided lookup
> table.
> 
> This will later be used as input for the fuel gauge node (QGauge on the
> PM7250B).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index b697051a0aaa..7857003099a6 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
>  		io-channel-names = "sensor-channel";
>  	};
>  
> +	bat_therm_sensor: thermal-sensor-bat-therm {

nit: this should be a little higher

> +		compatible = "generic-adc-thermal";
> +		#thermal-sensor-cells = <0>;
> +		#io-channel-cells = <0>;
> +		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
> +		io-channel-names = "sensor-channel";
> +		/*
> +		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
> +		 * 1.875V reference and 30kΩ pull-up.
> +		 */

I think this looks good. Is this data going to be correct for all/most
devices (i.e. is there a single battery sku)?

Konrad

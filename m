Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC93ED106
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996360; cv=none; b=j+bDEOoUylAYWw/0cO5eM0LL4Hp4u7fCgGQ6V2E/gjbSTiL3hEJAcb2o+Sx36UoXRgNE6J3Ef11c98gLO3iI4QlzxNcvcRTeXZX8a7zTbRe7a4sOgyo9JoV4pibGxlYsqBK3vVIizTUXEXCaADMoEpyrnrHxqlcUG1uN0aOc/y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996360; c=relaxed/simple;
	bh=bem0bfrRQTgaBeBEiyF43CC07n5PEtOByw9yids7igs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOejs969UKrIj0ZsHe1GxSaLNChGKJ2H+/syS/+Jesge6fGTnLCBIq9n4XvV9ce/GnI+y1XG1XBtwgX6cHzDe+oQLHD6QcFBZhDodDl4yUctAVeeshIiXoPw87cMEDie1CUeFZLcHyBW2HTagdvaG5fbfGcXlrmLJl9WE7nelEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSooDCE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeyKUl6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSooDCE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeyKUl6C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9fcJo3992222
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 11:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTYa+f3wYBqpXDNppZzKHLZml9UqEGFmkda50YQj2s8=; b=DSooDCE7aykHzjYy
	r+fgYVz7j3DsyFNuMcPNBDZ7CRYR3OCZu4FZWj+T0VfGTg9J5DJaQtm04lwY9iug
	z/ZYs8K6qowvy7SnvPLtAQ2R+s6JTpAb5l73dzrCHpwVmaWyncDfrOQngexy0LyZ
	MjRnBJZdo59JpZM07g/8cTMS96wjM4XK65Fz8bZNC4F+f+1kb3WP+516crqM90iu
	DEk0qc1dj2oO/u5Fj6oy9krAxLs4Wp7XDG8v6fgqSH+RNpuEZJ8NTTdk3MTtictA
	ezL6HbcOQJVBXhIlf+zJU66w4XE+11Ik0wzvt1aKyoSexw2/Z2ZS23nbb6EngMPS
	6mECHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm422e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 11:52:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so156170885a.0
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768996356; x=1769601156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTYa+f3wYBqpXDNppZzKHLZml9UqEGFmkda50YQj2s8=;
        b=KeyKUl6CQTzZLifyV/ianfWBQ4ePnUQC3HpABs8VY1YWT5GFYILOBgxOcPL2rp7f1e
         yh5CkaxGKqcXdVICkg4/5CB0DZn+XU3kyk6VyacBkVfZ3qR3wx/v/B+rCHK8h3DUjmBQ
         webCR1Cs+EtUim8yf3WzMkRxsLfD2u3aXpOc10o51G6Rb4EGn/hx02DlssvIAyLnQMHe
         UjVIQQGNaYZK9EF8hyKok0ibUCxenU44fe0lAuH7oMMPC2gG8pQHsfOhh72eGWa/d8gd
         aybocmOcbrIOHYHY1pNXu2fjEijptQriU/t7AFsUqVywhGNfzsiIIodtlDX/0j23cR9V
         gAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768996356; x=1769601156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTYa+f3wYBqpXDNppZzKHLZml9UqEGFmkda50YQj2s8=;
        b=nV64YqfOn/5AoYzLE4kCLnkMnvC6dNzMo6vXMC9moe6x+8jN/5c4aGZHXL9Zb11qMr
         PI0kij1LskIS84B5eq0gYLQbEQUlOysPoyIS8gUlDJX8QiUwqOgjLLMc0RBdL01/HEig
         K9aHbzdHT6fTPi7UcAAqgTQL4Ay3viSfgptsWLnWxZBTAeR+WPvcWthjmGJexDh3cIre
         H6PpsF7Nmp+XxUxjIk/0gdLLYrHl4c0XFciScJTWqL/L5g1uxnlHYb+xZUDCpDOt9F+u
         9QXitt9laKMkHP2ngQjOXESTIV3kmEPivyeSGaC1wGH7Uv+RbYdRZEvyMsRa/bG2rtoB
         IHAg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cYbfZwQAwE6lKSoDsHOqINgS1INTfZLYyQmrjhLGzzwWiMj+Hoat24jdfUThIMZPJHsxThRi5j06aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjhNyaXxFGelTcp/nFGIOpONmcmwH1pPtEB/5HldqRR4QMbr7
	uXjoMC1jXcv0cDOwXL1Z1RE30YzvNgMReKy8nzDAd/OAKK+MogJm60RfGgq30IHyXIRUvPlsDva
	mDrCtqx/3Oce5+3+ujNmuesRhdZWRYGpYgMnJlWy+K4Md5bhFgSI/879m/hT2bucwzQ==
X-Gm-Gg: AZuq6aLl2o4g0394GmOCWE7CrqN0WPxoJ1r4mkrBLLNwo6vATzPDPIYH0pEX8X+ukCk
	AbOYu+XLedz3FVIRdwAh2HORJl/RCNQzjHxAh7xKA3UjY+1qrSTLwlDHTh2T6inighYGTMN+0Yp
	Sd+zs9mrr4Ot0lTb1Ne8AjlLffDkedZg68Lcs6hBOYFoLysGnMAnGSr2sswj2qlN8bli8YywgTY
	wKLvlgcbBqrvLRgJ+nOhJFolbef0SKvxP51jQbFoQvwf3P2yV0rd0CLtxsUijd0vGgBRjoUzOTT
	nkKj50MtOh+yebCgLyBYpl6ZMQHCpt23Dfmm19vitttdxSiLLT1xopZse5WorsU3mMpQzfCTMX5
	77HSXe4ywz04ROYWCkRLtMwQ7coEEy3pxbYs9J3IqKxVAZJlYPDpCxFVkCb5w6UF6qzc=
X-Received: by 2002:a05:620a:1a0c:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c6ca4312d5mr557419785a.7.1768996355851;
        Wed, 21 Jan 2026 03:52:35 -0800 (PST)
X-Received: by 2002:a05:620a:1a0c:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c6ca4312d5mr557418285a.7.1768996355411;
        Wed, 21 Jan 2026 03:52:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a31322sm1582859366b.63.2026.01.21.03.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:52:34 -0800 (PST)
Message-ID: <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:52:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=6970be05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=HUUA1PmjzNnBZvILnA0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Kp1lzMa_83YczfDdg90_s4hryy945fyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5OSBTYWx0ZWRfX6Dm1RpwL7wfb
 adPF+ZjlEuzRVSY2Mk1wAgSYzFhAnjgi2HpUwI44jzA8CUzzS9KbpBQHoO3MraByK4i1bb2PP41
 kwWl0mXreRAnwP7uRLKk8qQMgbNi+iGB6MSAYdpuqCrmArzcn7DVekAxUvgazcpfPt9Fk7hTiaP
 Z/R1Faf3wdsW8MHNE2UaE+ILRA83aIh/1R04IrL/CsVVS+tgTSSQj2T1Q/8oXnHZXxaK+GwKbJl
 fvVs0RNaZuxl1iArs2RQ2lAXCOB+L2rQuOsObSNXJYKoszZGTQ46zBpO40CRQ5D6qxFtBagOckx
 kDGkY5igVwzQ9AAQMqm2BnxkT4vpVgYXWVS+tYP9YNyrjYobpUT7tw0JNC0krSbWszP2GYGvKZa
 lF/aywn1XG/IHw4Tqp4ZUr+dHViXiCVB8rlq6YcY67UfADa6j0Q4I21k3LHE2ZAPSfuYdKs/N+U
 iYY6aaDDmE5/1ADGODQ==
X-Proofpoint-ORIG-GUID: Kp1lzMa_83YczfDdg90_s4hryy945fyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210099

On 1/16/26 3:50 PM, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 52895dd9e4fa..cbe1507b0aaa 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -24,6 +24,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart5;
> +		serial1 = &uart11;
>  	};
>  
>  	gpio-keys {
> @@ -215,6 +216,67 @@ trip1 {
>  			};
>  		};
>  	};
> +
> +	wcn6750-pmu {
> +		compatible = "qcom,wcn6750-pmu"; /* WCN6755 */

I think a fallback compatible would be in order, if the data matches
exactly

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +	};

Not sure if we need to drive that pin.. perhaps a pull-down would
suffice?

[...]

> +	bluetooth {
> +		compatible = "qcom,wcn6750-bt"; /* WCN6755 */

Likewise

Konrad

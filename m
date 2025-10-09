Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01F2E3373
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014501; cv=none; b=K03H8Mhslpem3/V3Nh3+vnrMlzelz7+89YWzfcH34fn7m4eSnKWDsHKhfMHFtOBscBcx7Scqh9bHi8SLB8zr8qX7JXxy/tvQBNMNvxYJ6OLoSsCzN7rX0eHpQ1JnCQnKs6D4pwjNP9l1o199FNdJuBMG49EatEzuheTATIAlcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014501; c=relaxed/simple;
	bh=L48gd4bUY0iY0RmLNqg8Qnr65EJUPqeXnSrEl3McFgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTa7amuUAY9ADK1zt1+b4c3j/PQDE60Hxyn2l34jBwSK9rAqlQrWA/VPW4OnxzT2xtszgQqKTT5y/F28zaZtW2Gu/dT9d1WKTHX5ZixfzLbgkINU2VEsair1Gma0m7SjoDRXWcbeP4Df/PipuRXiogzwF08eAmhCpfuq/4vevyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLRg7YqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLRg7YqF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJvB019183
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 12:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x8fFSQ8NWhJBwrNV1vx5VXfQmCnGeigKLq2KnoY1LU=; b=SLRg7YqFiIrQ1lPE
	HxPLUZq3yZZj8Q5DeiJi5m6x4PXLMRRhEwrZcCpl3ttbOdGECbfQMJBE5QE3VsxA
	iCKo8lcK/4cCCC3y4P8yBOC3F5VE7F+IIjWaJhGMAH5jv/QPyiXaAerm6HXkVuh1
	51leb8oUthYCfIVHO+Ez6G5i1qwMotkesJOZ/kHyJ0RAZ0h6dirMFKBIetPLCzQj
	yqbwqUsDpgGf8i5CE9/wRO/5ozxn6IYAHlSnhRLr1kd8WEutwtv0LeJWFpZRV6Yx
	Ca1dQOsm9kB90uHfgq0OjPp0mOQCy2d9EoHtYft5SprMcN8iYvJ04CAkOy8vdOlv
	JkRBcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntsxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 12:54:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4dd729008d7so3501401cf.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 05:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014497; x=1760619297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x8fFSQ8NWhJBwrNV1vx5VXfQmCnGeigKLq2KnoY1LU=;
        b=Gv7elKZz/LrQVzrsqODxfoIvxIYrVywDkiMlyXu02DpMXM/pMJbD1cCWZDgsaIk79f
         VFoiv4QzaHYzmQ9ygD9MWoPfVVHEbDKOHMlF7cjI+Q2b/km4y5mm6FOOWf08Lm+wAOfh
         V5ZaWYbVEo1fRjIidgsjKIe8tOBhma8cmQKQZfqH5GrN96ka99v1rswobOMBlOVG3/rC
         36dLh+fFYpXi1tqU13904kwf23BYsMzUI8M1aVyN2rruux3xS3RnOX2fnKRq++V2mCKn
         yJ2IXEiD+6sekfhDfmhxMQWCPAiaN1NxWSCTsDPTFEexQgtbMZDBOhXiGFTS8+qqDuEz
         z+7w==
X-Forwarded-Encrypted: i=1; AJvYcCU5G7+mcNLPI5DKXMT+DLTFz90PknQqn/HU4yYRBHCaVp33s6RoCAdLsxnq2iOHLb7BGqKimeLglKQdDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwViOtVW81yg6DOqoN67yzjYJafe1VtvxXV8cwitgaCpkvDLTYb
	KKWkQ3n2m/0qtQtiQBR1cwhLlwEa1VYTCmS9hkqHe8KzW9vwxrc+HAhJBrkIP8Sov0oSr8uDEkE
	AaWSIbg8PI+3kFg0Momj3LPyTCSLJi/IAaCDkVqJ57WUf8CX7I66vY60fGfGLhQ5HqQ==
X-Gm-Gg: ASbGnctjBsI1Eye45GKQQrbin/f1w5+unZbxJvJ3HCxMyO8UDEPh1yG3b2zGLln34ok
	ALJNIlzj4Z0/8fIDqyHQ+6fL5Vyc95djMWF4Axd+N1JVMLePRuNlI73EwdOq2AqThpB52H54hzd
	/uI0OgILSEIoLYe7ZCVMBHYrFvQX/kA/BeR3xoonf2n0hC2+K5ihViIplbrw97wpFCMcPI7UB7L
	GYg60jXZG+kXA+8Tfa0/vZCUA6yujVfbDBSm0VLCoAm/BpHLKVQOEo01G9PHYKhPdcuajQuwLKv
	mZfgpikloZhLUBAz4X4Ca/0T11HRe4zt+L9FQKhGTAnh28VgTY5k9oi9I15d7+BtuFLrdyFJJ9k
	sJju9pf8VDlxjKxpy56D7z6hG38o=
X-Received: by 2002:a05:622a:4586:b0:4e7:462:76fb with SMTP id d75a77b69052e-4e7046278bbmr3443471cf.4.1760014496718;
        Thu, 09 Oct 2025 05:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX5/sWgll0CtsSoWnbnw8OuK/4gzjMQpFI0vobMt8d6Sm2EXkMS+OFvldQCCANHXNk1w5jSA==
X-Received: by 2002:a05:622a:4586:b0:4e7:462:76fb with SMTP id d75a77b69052e-4e7046278bbmr3443201cf.4.1760014496195;
        Thu, 09 Oct 2025 05:54:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1926375966b.2.2025.10.09.05.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:54:55 -0700 (PDT)
Message-ID: <6b9ae65c-08f0-4b13-94cb-b899764bfc8c@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:54:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding
 <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008-s6e3fc2x01-v2-4-21eca1d5c289@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 99CkIs2rfUj9wzjoK10HXri2QF5jexfb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7q7eYplhzJ5V
 t6WrI9uaj0FaeXu3RZA8cOLcD+EdPl2Y2TOv8WAoq2zl7wrNFJmnmSg8f2VeGbD/1egtL8iOSKI
 /A1cEzv0cPfg2qUiYw58l6bddb+GDOKO6dPvU4jF71EpKLnn5c/KeXN8bPgYfl6bnPTK+0KJ4vq
 KuD7X3JB/b4haWS79JB2F7ClKAlxt0AMp5TQMuDQ7EoHVsRyJPqW/iSq4EZHZX88XRzssj2PT8C
 kBrG6N/YfDVqG66aohG6SgEvN4txH0JrofUBdup1K1/dlGGSILwazTo5yY+voDk+PXzp6OLsLPe
 c+Z/kzJL7yN13NTsZuyrHARNBb/+S1cBYBgEggnd0S/xwYVBaovQq4jm5HRMU2hPovPpMyQwyVi
 8eluZEZD1hZA6WnQlrlZSFHqbQ+OAA==
X-Proofpoint-GUID: 99CkIs2rfUj9wzjoK10HXri2QF5jexfb
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7b0a1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=qaMgwUmbLaqo04ox7REA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/8/25 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe panel Tearing Effect (TE) GPIO line.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 1cf03047dd7ae..75989b377f8bc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -460,6 +460,7 @@ display_panel: panel@0 {
>  		vci-supply = <&panel_vci_3v3>;
>  		poc-supply = <&panel_vddi_poc_1p8>;
>  
> +		te-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;

Wait, I just noticed nothing consumes this..

Konrad

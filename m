Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747CF19D082
	for <phone-devel@vger.kernel.org>; Wed,  8 Oct 2025 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759923531; cv=none; b=cW/J90atDni0vZol4NBWUFGddXEERoJni9n0YbIf6sfhULRANzce/m6pFCQL7shXxk6szv4DWUpGfbB1AhN55xyOBUGRrEgigYpv0eIpXGmF2bBP3MqNXMH4NG+cyGpu26W4Od3qG+V7ppsVQawjtl0UD2qLPkTA7UAbJM+PHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759923531; c=relaxed/simple;
	bh=6cCF2LvbGpbslhl10HwoVuuROYSKzmo8yAWwSaQlewY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyJVOV3OiuwMHrsGNAOJdmAoUPBD4qJ5100c6CbdQ/8bhS/I8JsNotfelFsfegdzdcGkbJYAUlVfP/wiTyVxQJn6t76IIoSMhejwuMKEoifRH8hg9wIArfTIj2NRAxoEJwNNH/ZD7jg+gfJs0DwvIcFkVeA41o40ARaVPDGbFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWBYwcD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWBYwcD9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890P9L014221
	for <phone-devel@vger.kernel.org>; Wed, 8 Oct 2025 11:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ktF9PzCzZcJEY3eWTWWmqTdv5VI7UzhEYtnCUHGqeRM=; b=cWBYwcD941nJAH5m
	5tJXXvUAOqWfhkRWM2SV8Xiib7SYanDX7hnzdxjAsa4kgC3aylWwMNroFJpPwxCm
	b7fCISias3S6C1jHuspaPpVuecVm5kB5X+3Yn/klDd+1jRg8zQGloPg9l3zwHIL2
	2vcQJy49UXuNOJOGSvIOpuSoE7EGbenEZo/Y/PGiBRrwEjQ4+bLs3fXBB3pRLjzn
	Mv9bO9QEiaIYb7eu7IXGtWWBDGyD9qunX8vLxyXKfB4x3s/hi5FXe/HwF614C+nT
	MzHLLQ68qMXSDYL+KAitM3fqKv8WksE2g5q15VVI/yIUZpxV+UlgEi7oqiI0mjRv
	RRL/gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0nyuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 11:38:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e6d173e2a2so9981751cf.2
        for <phone-devel@vger.kernel.org>; Wed, 08 Oct 2025 04:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759923528; x=1760528328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktF9PzCzZcJEY3eWTWWmqTdv5VI7UzhEYtnCUHGqeRM=;
        b=sUbKBZrRBsi6SfScmsvjaTCFqFZ/uhCNkBEb2DGVE1j329R3Q42ejrHLQotJNZCMuH
         z5Tou0QIDYi9MtWrheq9OXkQpK0nb1uFo25uzw9fkpiD7bOPI8CkHtaft/JUzkcxih6X
         J5afBVzBPnFpd8XWRXE1ciKrk/QtWXyYvE7PixFkH/Ms1hKOW6q/k/VqNY+hPju/kRXH
         /hNLo/1ZApkUH0gJ00JzYQ+8emESEPj0zppkDzdI7peYKACg/i2nYVQ8jVkemg79SEqZ
         IOu+FxJqJHHXvte30t0Ntu8WL5rIKoYoj51TYNcPyd/iIvGq1szYSGYrr9uCdSE1+ptU
         zGRA==
X-Gm-Message-State: AOJu0YzhJxz43KUu9hns8fuuPKPQIK3tUzhoM1tRUOZluakgHqj16xav
	FngIezfTAw1RZqOu3xxjIlvfNQcmK4n/aIsFDimxH/w4M8WV1rvvaNAkF3E2SvsE/3uqNAyjIuv
	bWuAiIpCRfni5OPW9uQ+CMng2Lpg9qGa7CjoEtRm3+iIfflR+G2yxrE+PuOs2miR7/A==
X-Gm-Gg: ASbGncvkQ8ORFZ8ylfp9cG0YhO+KJNfvcbk0vwvgkG5YRr45oZ8nJV2tv7HXRChtHww
	dMSnZYqH8/OCZFhWLIl+YZRfwhxpvje8fj5TbQuFmUKgXJxySUQ1f2igDUQoZZaEsHaA5tm+tSI
	BVenBWoRj5kHQts/GpZfw3eokhIk8UK63GBAK5MyZq0r5O661WxoirJMAGVNgticEIjAea9ElIh
	XsJqtTAYoefBAHbMvfHjU7hf/FaJAU0jo0SNyQVNXzFKL1GDKdDzEVgq4O4JmlPtyJqWmJXBjWn
	QDFWDz789cFpQVZ9TQXlmrWxZSkmmsizpcMdSkVQV8Bq2khOmt3GT206JoV1tuSzmVbOfh0oL8k
	2KfSUQJt9E0UAEdCMnJQzUb/2+b0=
X-Received: by 2002:ac8:7d8d:0:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e6ead4d187mr28105521cf.8.1759923528370;
        Wed, 08 Oct 2025 04:38:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxXdxXLKV4c4vK741eJCYPaC0LrPYDOhy1QH4L6lPiyVX/KVRS60uwDKYl774T/rgeiZSNvQ==
X-Received: by 2002:ac8:7d8d:0:b0:4e5:7716:53f2 with SMTP id d75a77b69052e-4e6ead4d187mr28105351cf.8.1759923527915;
        Wed, 08 Oct 2025 04:38:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881011e9sm14525558a12.25.2025.10.08.04.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:38:47 -0700 (PDT)
Message-ID: <7abe83dc-5469-48e1-8964-ce3377d82a4d@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:38:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250930132556.266434-1-xerikasxx@gmail.com>
 <20250930132556.266434-3-xerikasxx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930132556.266434-3-xerikasxx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -fqf-AlLt8vNe4Y1hCFOg3gnbUXi7Gr-
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e64d49 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wSXgXpi4_rt3d5ynXFgA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -fqf-AlLt8vNe4Y1hCFOg3gnbUXi7Gr-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXwXGF2m8aIroq
 iNiXazZ8wcrEZRwIzIc0MIIi78X8O+n3MqjmKmYFFHrr4fTbGCRswVwBNLKESCDVttIrw/KfmnW
 xrpGiBqUV2faOmUHyu1US9G+aSL3n2Ya2Q48F1s2sIl1vHkoB/uNJhj9P2vC571MoNNHM+Jjh02
 NU6VkrMFld8yaqyx+UPWVYvS1MAJaHaYZ0sOfrZdx9SCEhaJkfJ3kBajnWS4zPYXawEZsXozLCe
 HdtCAUcBt5p7Evejdnc80jZn2est3XGRUGKAOtoqb3e2a2fTF1KVTsmAIgSKt7ahl3soUO2jjt5
 QngRNn2Ha9p6zx7zdqJBQebqYZYaS/FaCcli8V2SDjKNq72VkkU6NUD31qG+10CHJDAZ5eLqeS3
 5hwfZdm8i0JBbd1T4PCFJnlZnz4f8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On 9/30/25 3:20 PM, Erikas Bitovtas wrote:
> Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
> includes support for:
> - UART
> - USB
> - Internal storage
> - MicroSD
> - Volume keys
> - Touchscreen: Focaltech FT5306
> - Accelerometer: Invensense MPU6515
> - Magnetometer: Asahi Kasei AK09911
> - Vibrator
> - Audio input and output
> - Modem
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

[...]

> +&blsp_uart2 {
> +	pinctrl-0 = <&blsp_uart2_console_default>;
> +	pinctrl-1 = <&blsp_uart2_console_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";

nit: a newline before 'status' is customary

[...]

> +&tlmm {
> +	gpio_keys_default: gpio-keys-default-state {
> +		pins = "gpio107", "gpio117";

pin configuration nodes are best sorted by their pin number, please
reshuffle them

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-nodes

> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	imu_default: imu-default-state {
> +		pins = "gpio36";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	mag_reset_default: mag-reset-default-state {
> +		pins = "gpio112";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;

odd \n-s in some entries, please remove them

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
